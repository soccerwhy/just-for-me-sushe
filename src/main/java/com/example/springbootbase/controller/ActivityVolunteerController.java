package com.example.springbootbase.controller;


import com.example.springbootbase.dao.ActivityDao;
import com.example.springbootbase.model.Activity;
import com.example.springbootbase.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/activity-volunteer")
public class ActivityVolunteerController {



    @Autowired
    ActivityDao activityDao;

    @GetMapping("activity-list-volunteer")
    public void getActivityList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Page page = Page.getPage(request,activityDao.getActivityListCount());

        request.setAttribute("paging",page);
        List<Activity> activityList = null;

        /**
         * 这里可能要设置activityList的值为0 TODO
         */

        request.setAttribute("list",activityList);
        request.getRequestDispatcher("activity-list-volunteer.jsp").forward(request,response);
    }


    @PostMapping("hadoop-match")
    public void getObscureMatchList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        /**
         * 模糊匹配的逻辑  还要实现插入到Hadoop中  很多操作命令行的代码
         */
        String keyWord = request.getParameter("word");
        List<Activity> activityList = activityDao.getActivityListObscureMatch("%" + keyWord + "%");
        Page page = Page.getPage(request,activityDao.getActivityListObscureMatchCount("%" + keyWord + "%"));
        FileWriter writer = new FileWriter("/Users/mac/Downloads/hadoop-2.7.3/bin/wcinput/wc.input", true);
        writer.write(" " + keyWord);
        writer.close();
        request.setAttribute("paging",page);
        request.setAttribute("list",activityList);
        request.getRequestDispatcher("activity-list-volunteer.jsp").forward(request,response);
    }

}
