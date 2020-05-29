package com.example.springbootbase.controller;

import com.alibaba.fastjson.JSON;
import com.example.springbootbase.dao.WordCountDao;
import com.example.springbootbase.model.WordCount;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.List;

@Controller
@RequestMapping("/data-analyze")
public class DataAnalyzeController {


    @Autowired
    WordCountDao wordCountDao;


    @GetMapping("activity-hot")
    public void getActivityList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, InterruptedException {



        String cmd1 = "rm -rf /Users/mac/Downloads/hadoop-2.7.3/bin/wcoutput";
        String cmd2 = "/Users/mac/Downloads/hadoop-2.7.3/bin/hadoop jar /Users/mac/Downloads/hadoop-2.7.3/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.7.3.jar wordcount /Users/mac/Downloads/hadoop-2.7.3/bin/wcinput /Users/mac/Downloads/hadoop-2.7.3/bin/wcoutput";
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

        /**
         * 从文件中读取信息的方法
         */
        FileInputStream fis=new FileInputStream("/Users/mac/Downloads/hadoop-2.7.3/bin/wcoutput/part-r-00000");
        InputStreamReader isr=new InputStreamReader(fis, "UTF-8");
        BufferedReader br = new BufferedReader(isr);
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
        request.getRequestDispatcher("keyword-hot.jsp").forward(request,response);
    }



}
