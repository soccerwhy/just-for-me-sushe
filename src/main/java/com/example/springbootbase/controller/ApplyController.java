package com.example.springbootbase.controller;

import com.example.springbootbase.dao.ApplyDao;
import com.example.springbootbase.dao.PersonDao;
import com.example.springbootbase.dao.PersonTeamRelDao;
import com.example.springbootbase.dao.TeamDao;
import com.example.springbootbase.model.TeamApply;
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
@RequestMapping("/apply")
public class ApplyController {

    @Autowired
    ApplyDao applyDao;

    @Autowired
    TeamDao teamDao;

    @Autowired
    PersonDao personDao;

    @Autowired
    PersonTeamRelDao personTeamRelDao;

    @GetMapping("apply-list")
    public void getApplyList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Page page = Page.getPage(request,applyDao.getApplyListCount());

        request.setAttribute("paging",page);
        List<TeamApply> teamApplyList = applyDao.applyList(Page.getLimitNumber(page.index));


        request.setAttribute("list", teamApplyList);
        request.getRequestDispatcher("apply-list.jsp").forward(request,response);
    }


    @PostMapping("/obscure-match")
    public void obscureMatch(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String sex = request.getParameter("sex");
        String ageupper = request.getParameter("ageupper");
        String agelower = request.getParameter("agelower");
        List<TeamApply> teamApply = applyDao.getObscureMatchResult(sex,agelower,ageupper);
        request.setAttribute("list", teamApply);
        Page page = Page.getPage(request,applyDao.getApplyListObscureMatchCount(sex,agelower,ageupper));
        request.setAttribute("paging",page);
        request.getRequestDispatcher("apply-list.jsp").forward(request,response);
    }

    @PostMapping("updateResultTrue")
    public void updateResultState(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String reason = request.getParameter("reason");
        String teamname = request.getParameter("teamname");
        String personname = request.getParameter("personname");
        String type = request.getParameter("type");
        String role = "志愿者";
        if(("申请小队队长").equals(type)){
            role = "小队长";
        }
        if(("申请加入团队").equals(type)){
            role = "志愿者";
        }
        String pass = "通过";
        applyDao.updateResultState(id,reason,pass);
        Integer teamid = teamDao.getTeamIdByTeamname(teamname);
        Integer personid = personDao.getPersonIdByPersonname(personname);
        personDao.updateRoleByUsername(personname,role);
        personTeamRelDao.insertPersonTeamRel(teamid,personid);
        teamDao.updateTeamLeaderByTeamId(teamid,personname);
        Integer teamnumber = personTeamRelDao.getTeamNumberByTeamId(teamid);
        teamDao.updateTeamNumberByTeamId(teamid,teamnumber);
        applyDao.deleteApplyInfo(personname);
    }


    @PostMapping("updateResultFalse")
    public void updateResultStateFalse(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String reason = request.getParameter("reason");
        String pass = "不通过";
        applyDao.updateResultFalseState(id,reason,pass);
    }


    @GetMapping("apply-list-volunteer")
    public void getApplyListVolunteer(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String personId = request.getSession().getAttribute("personId").toString();
        Page page = Page.getPage(request,applyDao.getApplyListCount());

        request.setAttribute("paging",page);
        Integer limitNumber = Page.getLimitNumber(page.index);
        List<TeamApply> teamApplyList = applyDao.applyListById(limitNumber,Integer.parseInt(personId));
        System.out.println("teamApplyList:" + teamApplyList);
        request.setAttribute("list", teamApplyList);
        request.getRequestDispatcher("apply-list-volunteer.jsp").forward(request,response);
    }






}
