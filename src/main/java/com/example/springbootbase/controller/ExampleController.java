package com.example.springbootbase.controller;

import com.alibaba.fastjson.JSON;
import com.example.springbootbase.dao.PersonDao;
import com.example.springbootbase.dao.WordCountDao;
import com.example.springbootbase.model.WordCount;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.List;

@Controller
@RequestMapping("/example")
public class ExampleController {

    @Autowired
    PersonDao personDao;

    @Autowired
    WordCountDao wordCountDao;

    @GetMapping("/ajax")
    public void ajaxExample(HttpServletResponse response) throws IOException {
        response.getWriter().println("<b>I'm server content</b>");
    }



    @GetMapping("/echart")
    public void echartExample(HttpServletRequest request, HttpServletResponse response)
            throws IOException, InterruptedException {



                String cmd1 = "rm -rf /Users/mac/Downloads/hadoop-2.7.3/bin/wcoutput";
                String cmd2 = "/Users/mac/Downloads/hadoop-2.7.3/bin/hadoop jar /Users/mac/Downloads/hadoop-2.7.3/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.7.3.jar wordcount /Users/mac/Downloads/hadoop-2.7.3/bin/wcinput /Users/mac/Downloads/hadoop-2.7.3/bin/wcoutput";
                //String cmd3 = "/Users/mac/Downloads/hadoop-2.7.3/bin/./hadoop jar /Users/mac/Downloads/hadoop-2.7.3/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.7.3.jar wordcount wcinput wcoutput";
                Runtime run = Runtime.getRuntime();
                    Process process1 = run.exec(cmd1);
                    Thread.sleep(1000);
                    Process process2 = run.exec(cmd2);
                    InputStream in = process2.getInputStream();
                    InputStreamReader reader = new InputStreamReader(in);
                    BufferedReader brs = new BufferedReader(reader);
                    StringBuffer sb3 = new StringBuffer();
                    String message;
                    while((message = brs.readLine()) != null) {
                        sb3.append(message);
                    }
                    System.out.println("The command3 output message is :" + sb3);
      //  List<TempPerson> tempPersonList = new ArrayList<>();
        /**
         * 从数据库中得到信息的方法
         */
//        List<Person> personList = personDao.getPersonNameAndAge();
//        for (Person person:personList) {
//            TempPerson tempPerson = new TempPerson();
//            tempPerson.setName(person.getName());
//            tempPerson.setValue(person.getAge());
//            tempPersonList.add(tempPerson);
//        }
        /**
         * 从文件中读取信息的方法
         */
        FileInputStream fis=new FileInputStream("/Users/mac/Downloads/hadoop-2.7.3/bin/wcoutput/part-r-00000");
        InputStreamReader isr=new InputStreamReader(fis, "UTF-8");
        BufferedReader br = new BufferedReader(isr);
        //简写如下
        //BufferedReader br = new BufferedReader(new InputStreamReader(
        //        new FileInputStream("E:/phsftp/evdokey/evdokey_201103221556.txt"), "UTF-8"));
        String line="";
        String[] arrs=null;
        wordCountDao.deleteAllWordCountData();
        while ((line=br.readLine())!=null) {
            arrs=line.split(" ");
            System.out.println(arrs[0]);
             int index = 0;
            StringBuilder sb1 = new StringBuilder();
            StringBuilder sb2 = new StringBuilder();
            for(int i = 0; i < arrs[0].length();){
                char c =  arrs[0].charAt(i);
                if((c != '\t')&&(index == 0)){
                    sb1.append(c);
                    i++;
                    continue;
                }
                if((c == '\t')&&(index == 0)){
                    i++;
                    index = 1;
                    continue;
                }
                if((c == '\t')&&(index == 1)){
                    i++;
                    continue;
                }
                if((c != '\t')&&(index == 1)){
                    sb2.append(c);
                    i++;
                    continue;
                }
            }
            WordCount wordCount = new WordCount();
            wordCount.setName(sb1.toString());
            wordCount.setValue(Integer.parseInt(sb2.toString()));

            wordCountDao.insertWordCount(wordCount);
        }
        br.close();
        isr.close();
        fis.close();

        List<WordCount> wordCountList = wordCountDao.getWordCountList();
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");
        response.getWriter().println(JSON.toJSONString(wordCountList));

    }

    @GetMapping("/examplecases")
    public void thirdIndex(HttpServletRequest request, HttpServletResponse response, @RequestParam("method") String method)
            throws ServletException, IOException {
        if(method.equals("see")){
            request.setAttribute("age","18");
            System.out.println("wangyuyu");
            request.getRequestDispatcher("index/admin/course/showGradeNotice.jsp").forward(request,response);
        }
        if(method.equals("one")){
            request.setAttribute("age","one");
            System.out.println("wangyuyuone");
            request.getRequestDispatcher("index/admin/course/volunteer-list.jsp").forward(request,response);
        }
        if(method.equals("two")){
            request.setAttribute("age","one");
            System.out.println("wangyuyuone");
            request.getRequestDispatcher("index/admin/course/selTz1.jsp").forward(request,response);
        }
        if(method.equals("three")){
            request.setAttribute("age","two");
            System.out.println("wangyuyuone");
            request.getRequestDispatcher("index/admin/notice/showNotice.jsp").forward(request,response);
        }
        if(method.equals("four")){
            request.setAttribute("age","one");
            System.out.println("wangyuyuone");
            request.getRequestDispatcher("index/admin/pinglun/selPl.jsp").forward(request,response);
        }
        if(method.equals("five")){
            request.setAttribute("age","one");
            System.out.println("wangyuyuone");
            request.getRequestDispatcher("index/admin/pinglun/selPl1.jsp").forward(request,response);
        }
        if(method.equals("six")){
            request.setAttribute("age","two");
            System.out.println("wangyuyuone");
            request.getRequestDispatcher("index/admin/student/selStu.jsp").forward(request,response);
        }
        if(method.equals("seven")){
            request.setAttribute("age","one");
            System.out.println("wangyuyuone");
            request.getRequestDispatcher("index/admin/student/success.jsp").forward(request,response);
        }
        if(method.equals("eight")){
            request.setAttribute("age","one");
            System.out.println("wangyuyuone");
            request.getRequestDispatcher("index/admin/teacher/selTea.jsp").forward(request,response);
        }
        if(method.equals("nine")){
            request.setAttribute("age","two");
            System.out.println("wangyuyuone");
            request.getRequestDispatcher("index/admin/tiaoke/selTk.jsp").forward(request,response);
        }
        if(method.equals("ten")){
            request.setAttribute("age","one");
            System.out.println("wangyuyuone");
            request.getRequestDispatcher("index/admin/tiaoke/selTk1.jsp").forward(request,response);
        }
        if(method.equals("eleven")){
            request.setAttribute("age","one");
            System.out.println("wangyuyuone");
            request.getRequestDispatcher("index/admin/user/selUser.jsp").forward(request,response);
        }
        if(method.equals("twelve")){
            request.setAttribute("age","two");
            System.out.println("wangyuyuone");
            request.getRequestDispatcher("index/admin/ziyuan/selZy.jsp").forward(request,response);
        }



        if(method.equals("20")){
            request.setAttribute("age","one");
            System.out.println("wangyuyuone");
            request.getRequestDispatcher("index/student/course/selCo.jsp").forward(request,response);
        }
        if(method.equals("21")){
            request.setAttribute("age","one");
            System.out.println("wangyuyuone");
            request.getRequestDispatcher("index/student/course/selCo1.jsp").forward(request,response);
        }
        if(method.equals("22")){
            request.setAttribute("age","two");
            System.out.println("wangyuyuone");
            request.getRequestDispatcher("index/student/gradenotice/showGradeNoticeStu.jsp").forward(request,response);
        }
        if(method.equals("23")){
            request.setAttribute("age","one");
            System.out.println("wangyuyuone");
            request.getRequestDispatcher("index/student/my/selMy.jsp").forward(request,response);
        }
        if(method.equals("24")){
            request.setAttribute("age","one");
            System.out.println("wangyuyuone");
            request.getRequestDispatcher("index/student/my/password.jsp").forward(request,response);
        }
        if(method.equals("25")){
            request.setAttribute("age","two");
            System.out.println("wangyuyuone");
            request.getRequestDispatcher("index/student/notice/showNoticeStu.jsp").forward(request,response);
        }
        if(method.equals("26")){
            request.setAttribute("age","one");
            System.out.println("wangyuyuone");
            request.getRequestDispatcher("index/student/shiyan/selSy.jsp").forward(request,response);
        }
        if(method.equals("27")){
            request.setAttribute("age","one");
            System.out.println("wangyuyuone");
            request.getRequestDispatcher("index/student/ziyuan/selCo.jsp").forward(request,response);
        }
    }

}
