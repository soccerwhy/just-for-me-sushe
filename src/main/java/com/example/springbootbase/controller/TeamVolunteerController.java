package com.example.springbootbase.controller;

import com.example.springbootbase.dao.ApplyDao;
import com.example.springbootbase.dao.PersonDao;
import com.example.springbootbase.dao.PersonTeamRelDao;
import com.example.springbootbase.dao.TeamDao;
import com.example.springbootbase.model.TeamApply;
import com.example.springbootbase.model.Person;
import com.example.springbootbase.model.Team;
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
import java.util.ArrayList;
import java.util.List;
@Controller
@RequestMapping("/team-volunteer")
public class TeamVolunteerController {

    @Autowired
    TeamDao teamDao;

    @Autowired
    PersonDao personDao;

    @Autowired
    ApplyDao applyDao;

    @Autowired
    PersonTeamRelDao personTeamRelDao;




    @PostMapping("/obscure-match")
    public void obscureMatch(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Team> team = teamDao.getOneTeam(request.getParameter("number"));
        request.setAttribute("list",team);
        Page page = Page.getPage(request,teamDao.getTeamListCount());
        request.setAttribute("paging",page);
        request.getRequestDispatcher("team-list-volunteer.jsp").forward(request,response);
    }


    /**
     * 志愿者看到的团队信息
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @GetMapping("team-info-volunteer")
    public void getTeamInfoForVolunteer(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Integer personId = Integer.parseInt(request.getSession().getAttribute("personId").toString());
        Integer teamId = personTeamRelDao.getTeamIdFromPersonteamrelByPersonId(personId);
        Team team = teamDao.getTeamByTeamid(teamId);
        List<Integer> personIdList = personTeamRelDao.getPersonIdByTeamId(teamId);
        List<String> nameList = new ArrayList<>();;
        for(Integer i : personIdList){
            nameList.add(personDao.getNameByPersonId(i));
        }
        request.setAttribute("teamname",team.getName());
        request.setAttribute("teamlocation",team.getLocation());
        request.setAttribute("teamslogan",team.getSlogan());
        request.setAttribute("teamnumber",team.getNumber());
        request.setAttribute("teammember",nameList);
        request.getRequestDispatcher("team-info-volunteer.jsp").forward(request,response);
    }







    /**
     * teamList信息 给志愿者看到额
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @GetMapping("team-list-volunteer")
    public void getTeamListForVolunteer(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Integer personId = Integer.parseInt(request.getSession().getAttribute("personId").toString());
        Page page = Page.getPage(request,teamDao.getTeamListCount());
        request.setAttribute("paging",page);
        List<Team> teamList = teamDao.teamList(Page.getLimitNumber(page.index));
        request.setAttribute("list",teamList);
        request.setAttribute("personId",personId);
        request.getRequestDispatcher("team-list-volunteer.jsp").forward(request,response);
    }

    @GetMapping("joinTeam")
    public void personJoinTeam(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer teamId = Integer.parseInt(request.getParameter("teamId"));
        Integer personId = Integer.parseInt(request.getParameter("personId"));
        String teamName = teamDao.getTeamNameById(teamId);
        Person person = personDao.getPersonById(personId.toString());
        TeamApply teamApply = new TeamApply();
        teamApply.setPersonId(Integer.parseInt(person.getPersonid()));
        teamApply.setPersonName(person.getName());
        teamApply.setPersonSex(person.getSex());
        teamApply.setTeamId(teamId);
        teamApply.setTeamName(teamName);
        teamApply.setType("申请加入团队");
        teamApply.setReason("");
        teamApply.setResult("");
        applyDao.insertApply(teamApply);
        request.getRequestDispatcher("apply-success.jsp").forward(request,response);
    }

    @GetMapping("applyTeamLeader")
    public void applyTeamLeader(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer teamId = Integer.parseInt(request.getParameter("teamId"));
        Integer personId = Integer.parseInt(request.getParameter("personId"));
        String teamName = teamDao.getTeamNameById(teamId);
        Person person = personDao.getPersonById(personId.toString());
        TeamApply teamApply = new TeamApply();
        teamApply.setPersonId(Integer.parseInt(person.getPersonid()));
        teamApply.setPersonName(person.getName());
        teamApply.setPersonSex(person.getSex());
        teamApply.setTeamId(teamId);
        teamApply.setTeamName(teamName);
        teamApply.setType("申请小队队长");
        teamApply.setReason("");
        teamApply.setResult("");
        applyDao.insertApply(teamApply);
        request.getRequestDispatcher("apply-success.jsp").forward(request,response);
    }







}
