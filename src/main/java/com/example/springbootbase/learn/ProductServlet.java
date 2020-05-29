//package com.example.springbootbase.learn;
//
//import com.example.springbootbase.dao.DvdDao;
//import org.apache.commons.fileupload.FileItem;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//
//import javax.servlet.ServletContext;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.sql.SQLException;
//import java.util.ArrayList;
//import java.util.List;
//
///**
// * @author Mr Tang
// *
// */
//@Controller
//@WebServlet("/ProductServlet")
//public class ProductServlet extends HttpServlet {
//
//    @Autowired
//    DvdDao dvdDao;
//
//
//    public ProductServlet() {
//        super();
//    }
//    protected void doGet(HttpServletRequest request,
//                         HttpServletResponse response) throws ServletException, IOException {
//        String method = request.getParameter("method");
//        try {
//            switch (method) {
//                case "add":
//                    //转接给相对应的函数去处理相关数据。
//                    addDVDinfo(request, response);
//                    break;
//            }}catch(Exception e){
//                // TODO Auto-generated catch block
//                e.printStackTrace();
//            }
//        }
//
///**
// * <p>
// *  这个函数实现了增加dvd的功能
// * <p>
// * @throws SQLException
// * @throws ServletException
// */
//    private static void addDVDinfo(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException, ServletException {
//        List<String> list=new ArrayList<String>();
//        String filename=PhotoDao.getPhotoNewName();
//        ServletContext servletContext=null;
//        servletContext=request.getSession().getServletContext();
//        //数据库中存储格式:/webTest/imgs/***.jpg
//        //第一步:获取页面上上传的图片资源
//        List<FileItem> items=PhotoDao.getRequsetFileItems(request,servletContext);
//        boolean isLoadToSQL=false;
//        for(FileItem item:items) {
//            if(!item.isFormField()){
//                //判断后缀名是否是jpg
//                if(PhotoDao.isGif(item)) {
//                    isLoadToSQL=PhotoDao.saveFile(item,filename);
//                }else {
//                    System.out.println("后缀格式有误，保存文件失败");
//                }
//            }else {
//                /*获取表单中的非文件值
//                表单中的空间name值
//                System.out.println("name值:  "+item.getFieldName());
//                该name值空间中的value值
//                System.out.println(item.getString("UTF-8"));*/
//                list.add(item.getString("UTF-8"));
//            }
//        }
////        String dvdNum=DvdDao.returnNextNum();
//        String dvdNum = "2";
//        //存在数据库里面的照片路径是在项目里的相对路径
//        String finalPhotoName= request.getContextPath()+"/imgs/"+filename;
//        int bol= 1 ;
//        DVD dvd = new DVD();
//        dvd.setDvdnum(dvdNum);
//        dvd.setDvdname("《"+list.get(0)+"》");
//        dvd.setDvdstate(list.get(1));
//        dvd.setDvdtype(list.get(2));
//        dvd.setDvdphoto(finalPhotoName);
//        dvdDao.insertDVD(dvd);
//        if(list.get(4).equals("FULL")) {
//            if(bol>0) {
//                PrintWriter out=response.getWriter();
//                out.flush();
//                out.print("<script>");
//                out.println("alert('添加DVD信息成功！！！')");
//                out.print("window.location.href='ProductServlet?method=toAddView&currentPage=");
//                out.print(list.get(3));    /*第四个数下标为3表示主页的页数*/
//                out.print("'</script>\");");
//                out.close();
//            }else {
//                PrintWriter out=response.getWriter();
//                out.flush();
//                out.print("<script>");
//                out.println("alert('很抱歉，添加DVD失败，请检查填入信息是否正确！！！')");
//                out.println("history.back();");
//                out.println("</script>");
//                out.close();
//            }
//        }
//        else if(list.get(4).equals("EMPTY")){
//            PrintWriter out=response.getWriter();
//            out.flush();
//            out.print("<script>");
//            out.print("window.location.href='ProductServlet?method=toAddView';");
//            out.println("</script>");
//            out.close();
//        }
//    }
//
//    protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
//        doGet(request, response);
//    }
//}