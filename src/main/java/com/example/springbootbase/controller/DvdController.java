package com.example.springbootbase.controller;

import com.example.springbootbase.dao.DvdDao;
import com.example.springbootbase.learn.DVD;
import com.example.springbootbase.learn.PhotoDao;
import org.apache.commons.fileupload.FileItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/ProductServlet")
public class DvdController {


    @Autowired
    DvdDao dvdDao;

    @PostMapping("lala")
    public  void addDVDinfo(HttpServletRequest request, HttpServletResponse response)
            throws IOException, SQLException, ServletException {
        List<String> list=new ArrayList<String>();
        String filename= PhotoDao.getPhotoNewName();
        ServletContext servletContext=null;
        servletContext=request.getSession().getServletContext();
        //数据库中存储格式:/webTest/imgs/***.jpg
        //第一步:获取页面上上传的图片资源
        List<FileItem> items=PhotoDao.getRequsetFileItems(request,servletContext);
        boolean isLoadToSQL=false;
        for(FileItem item:items) {
            if(!item.isFormField()){
                //判断后缀名是否是jpg
                if(PhotoDao.isGif(item)) {
                    isLoadToSQL=PhotoDao.saveFile(item,filename);
                }else {
                    System.out.println("后缀格式有误，保存文件失败");
                }
            }else {
                /*获取表单中的非文件值
                表单中的空间name值
                System.out.println("name值:  "+item.getFieldName());
                该name值空间中的value值
                System.out.println(item.getString("UTF-8"));*/
                list.add(item.getString("UTF-8"));
            }
        }
//        String dvdNum=DvdDao.returnNextNum();
        String dvdNum = "2";
        //存在数据库里面的照片路径是在项目里的相对路径
        String finalPhotoName= request.getContextPath()+"/imgs/"+filename;
        int bol= 1 ;
        DVD dvd = new DVD();
        dvd.setDvdnum(dvdNum);
        dvd.setDvdname("《"+list.get(0)+"》");
        dvd.setDvdstate(list.get(1));
        dvd.setDvdtype(list.get(2));
        dvd.setDvdphoto(finalPhotoName);
        dvdDao.insertDVD(dvd);
        if(list.get(4).equals("FULL")) {
            if(bol>0) {
                PrintWriter out=response.getWriter();
                out.flush();
                out.print("<script>");
                out.println("alert('添加DVD信息成功！！！')");
                out.print("window.location.href='ProductServlet?method=toAddView&currentPage=");
                out.print(list.get(3));    /*第四个数下标为3表示主页的页数*/
                out.print("'</script>\");");
                out.close();
            }
        }
        else if(list.get(4).equals("EMPTY")){
            PrintWriter out=response.getWriter();
            out.flush();
            out.print("<script>");
            out.print("window.location.href='ProductServlet?method=toAddView';");
            out.println("</script>");
            out.close();
        }
    }


}
