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
import java.io.IOException;
import java.util.List;

//for test push trigger
@Controller
@RequestMapping("/activity-admin")
public class ActivityAdminController {

    @Autowired
    ActivityDao activityDao;


    /**
     * 管理员页面 添加活动
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @GetMapping("add-activity-admin")
    public void getAddActivityJSP(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("add-activity.jsp").forward(request,response);

    }


    /**
     * 具体的添加请求
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @PostMapping("add-activity-request")
    public void addAtivityRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String location = request.getParameter("location");
        String time = request.getParameter("time");
        String content = request.getParameter("content");
        Activity activity = new Activity();
        activity.setName(name);
        activity.setLocation(location);
        activity.setTime(time);
        activity.setContent(content);
        activityDao.insertActivity(activity);
        request.getRequestDispatcher("add-success.jsp").forward(request,response);
    }



    @PostMapping("admin-activity-list")
    public void getActivityListPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Page page = Page.getPage(request,activityDao.getActivityListCount());
        request.setAttribute("paging",page);
        List<Activity> activityList = activityDao.activityList(Page.getLimitNumber(page.index));
        request.setAttribute("list",activityList);
        request.getRequestDispatcher("activity-list-admin.jsp").forward(request,response);
    }


    @GetMapping("admin-activity-list")
    public void getActivityList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Page page = Page.getPage(request,activityDao.getActivityListCount());
        request.setAttribute("paging",page);
        List<Activity> activityList = activityDao.activityList(Page.getLimitNumber(page.index));
        request.setAttribute("list",activityList);
        request.getRequestDispatcher("activity-list-admin.jsp").forward(request,response);
    }


    @PostMapping("/obscure-match")
    public void obscureMatch(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Activity> activity = activityDao.getOneActivity(Integer.parseInt(request.getParameter("number")));
        request.setAttribute("list",activity);
        Page page = Page.getPage(request,activityDao.getActivityListCount());
        request.setAttribute("paging",page);
        request.getRequestDispatcher("activity-list-admin.jsp").forward(request,response);
    }


    /**
     * 修改活动信息
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @GetMapping("update-activity-admin-jsp")
    public void updateActivity(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Integer id = Integer.parseInt(request.getParameter("id"));
        Activity activity = activityDao.getActivityById(id.toString());
        request.setAttribute("id",request.getParameter("id"));
        request.setAttribute("name",activity.getName());
        request.setAttribute("location",activity.getLocation());
        request.setAttribute("time",activity.getTime());
        request.setAttribute("content",activity.getContent());
        request.getRequestDispatcher("activity-info-update.jsp").forward(request,response);
    }


    @PostMapping("update-activity-sure")
    public void uodateActivitySure(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Activity activity = new Activity();
        activity.setActivityid(request.getParameter("id"));
        activity.setName(request.getParameter("name"));
        activity.setLocation(request.getParameter("location"));
        activity.setContent(request.getParameter("content"));
        activity.setTime(request.getParameter("time"));
        activityDao.updateActivity(activity);
        Page page = Page.getPage(request,activityDao.getActivityListCount());

        request.setAttribute("paging",page);
        List<Activity> activityList = activityDao.activityList(Page.getLimitNumber(page.index) );

        request.setAttribute("list",activityList);
        request.getRequestDispatcher("activity-list-admin.jsp").forward(request,response);

    }


}
