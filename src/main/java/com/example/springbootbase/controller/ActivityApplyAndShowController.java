package com.example.springbootbase.controller;


import com.example.springbootbase.dao.ActivityApplyDao;
import com.example.springbootbase.dao.ActivityDao;
import com.example.springbootbase.dao.PersonDao;
import com.example.springbootbase.dao.TeamDao;
import com.example.springbootbase.model.*;
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

@Controller
@RequestMapping("/activity-applyAndShow")
public class ActivityApplyAndShowController {

    @Autowired
    ActivityApplyDao activityAppDao;

    @Autowired
    ActivityDao activityDao;

    @Autowired
    PersonDao personDao;

    @Autowired
    TeamDao teamDao;

    @GetMapping("activity-list-apply")
    public void getActivityList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Page page = Page.getPage(request,activityDao.getActivityListCount());

        request.setAttribute("paging",page);
        List<Activity> activityList = activityDao.activityList(Page.getLimitNumber(page.index));


        request.setAttribute("list",activityList);
        request.getRequestDispatcher("apply-list-activity-volunteer.jsp").forward(request,response);
    }


    @PostMapping("/obscure-match")
    public void obscureMatch(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Activity> activity = activityDao.getOneActivity(Integer.parseInt(request.getParameter("number")));
        request.setAttribute("list",activity);
        Page page = Page.getPage(request,activityDao.getActivityListCount());
        request.setAttribute("paging",page);
        request.getRequestDispatcher("apply-list-activity-volunteer.jsp").forward(request,response);
    }


    @GetMapping("/joinActivity")
    public void addActivity(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String personId = request.getParameter("personId");
        String activityId = request.getParameter("activityId");
        ActivityApply activityApply = new ActivityApply();
        Person person = personDao.getPersonById(personId);
        activityApply.setUsername(person.getName());
        Activity activity = activityDao.getActivityById(activityId);
        activityApply.setActivityname(activity.getName());
        Team team = teamDao.getTeamByName(person.getName());
        activityApply.setReason("");
        activityApply.setResult("");
        activityApply.setTeamlocation(team.getLocation());
        activityApply.setTeamname(team.getName());
        activityApply.setTeamnumber(team.getNumber());

        activityAppDao.insertActivityApply(activityApply);
        request.getRequestDispatcher("success.jsp").forward(request,response);

    }

    @GetMapping("/actitivity-apply-result-show")
    public void getActivityApplyListVolunteer(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String personId = request.getSession().getAttribute("personId").toString();
        Page page = Page.getPage(request,activityAppDao.getActivityApplyListCount());

        request.setAttribute("paging",page);
        Integer limitNumber = Page.getLimitNumber(page.index);
        Person person = personDao.getPersonById(personId);
        String teamname = teamDao.getTeamNameByUserName(person.getName());
        List<ActivityApply> activityApplyList = activityAppDao.getActivityApplyListByTeamName(teamname,limitNumber);

        request.setAttribute("list",activityApplyList);
        request.getRequestDispatcher("activity-apply-result-show.jsp").forward(request,response);
    }


    @PostMapping("/obscure-result-match")
    public void obscureMatchForResult(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<ActivityApply> activityApplyList = activityAppDao.getOneActivityApply(Integer.parseInt(request.getParameter("number")));
        request.setAttribute("list",activityApplyList);
        Page page = Page.getPage(request,activityAppDao.getActivityApplyListCount());
        request.setAttribute("paging",page);
        request.getRequestDispatcher("activity-apply-result-show.jsp").forward(request,response);
    }





}
