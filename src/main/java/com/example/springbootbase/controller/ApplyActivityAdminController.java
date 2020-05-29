package com.example.springbootbase.controller;

import com.example.springbootbase.dao.ActivityApplyDao;
import com.example.springbootbase.dao.ActivityDao;
import com.example.springbootbase.dao.ActivityTeamRelDao;
import com.example.springbootbase.dao.TeamDao;
import com.example.springbootbase.model.ActivityApply;
import com.example.springbootbase.model.ActivityTeamRel;
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
@RequestMapping("/apply-activity-admin")
public class ApplyActivityAdminController {


    @Autowired
    ActivityDao activityDao;

    @Autowired
    ActivityApplyDao activityApplyDao;

    @Autowired
    TeamDao teamDao;

    @Autowired
    ActivityTeamRelDao activityTeamRelDao;

    @GetMapping("apply-activity-list")
    public void getActivityApplyList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Page page = Page.getPage(request,activityApplyDao.getActivityApplyListCount());

        request.setAttribute("paging",page);
        List<ActivityApply> applyActivityList = activityApplyDao.activityApplyList(Page.getLimitNumber(page.index));


        request.setAttribute("list",applyActivityList);
        /**
         * 这里待修改
         */
        request.getRequestDispatcher("apply-activity-admin-list.jsp").forward(request,response);
    }



    @PostMapping("/obscure-match")
    public void obscureMatch(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<ActivityApply> activityApplyList = activityApplyDao.getOneActivityApply(Integer.parseInt(request.getParameter("number")));
        request.setAttribute("list",activityApplyList);
        Page page = Page.getPage(request,activityApplyDao.getActivityApplyListCount());
        request.setAttribute("paging",page);
        request.getRequestDispatcher("apply-activity-admin-list.jsp").forward(request,response);
    }



    @PostMapping("updateResultTrue")
    public void updateResultState(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String reason = request.getParameter("reason");
        String username = request.getParameter("username");
        String activityname = request.getParameter("activityname");
        activityApplyDao.updateResultState(id,reason,"通过");
        String teamname = teamDao.getTeamNameByUserName(username);
        Integer teamid = teamDao.getTeamIdByTeamname(teamname);
        Integer activityid = activityDao.getActivityIdByActivitynname(activityname);
        activityTeamRelDao.insertActivityTeamRel(teamid,activityid);

    }


    @PostMapping("updateResultFalse")
    public void updateResultStateFalse(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String reason = request.getParameter("reason");
        String pass = "不通过";
        activityApplyDao.updateResultFalseState(id,reason,pass);
    }






}
