package com.example.springbootbase.controller;

import com.example.springbootbase.dao.SusheDao;
import com.example.springbootbase.dao.TeamDao;
import com.example.springbootbase.model.Sushe;
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
import java.util.List;

@Controller
@RequestMapping("/team")
public class TeamController {

    @Autowired
    SusheDao susheDao;

    @Autowired
    TeamDao teamDao;

    /**
     * 添加活动的页面跳转controller
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @GetMapping("add-team")
    public void getTeamPage(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("add-team.jsp").forward(request,response);
    }


    /**
     * 添加团队信息
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @PostMapping("add-teams")
    public void addTeamsByAdmin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Sushe sushe = new Sushe();
        sushe.setNumber(request.getParameter("sushenumber"));
        sushe.setLocation(request.getParameter("sushelocation"));
        sushe.setClean(request.getParameter("susheclean"));
        sushe.setGuaranteecontent(request.getParameter("sunhuai"));
        susheDao.InsertSusheInfo(sushe);
        request.getRequestDispatcher("success.jsp").forward(request,response);
    }





    @GetMapping("team-list")
    public void getTeamList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        Page page = Page.getPage(request,susheDao.getSusheListCount());


        request.setAttribute("paging",page);
        List<Sushe> susheList = susheDao.susheList(Page.getLimitNumber(page.index));
        request.setAttribute("list",susheList);
        request.getRequestDispatcher("team-list.jsp").forward(request,response);
    }

    /**
     * 更新团队跳转页面
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @GetMapping("updateTeams")
    public void updateTeams(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        List<Sushe> susheList = susheDao.getOneSushe(id);
        request.setAttribute("sushe",susheList);
        request.getRequestDispatcher("update-team.jsp").forward(request,response);
    }


    @PostMapping("/updateTeam")
    public void updateTeam(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Sushe sushe = new Sushe();
        sushe.setNumber(request.getParameter("number"));
        sushe.setSusheid(Integer.parseInt(request.getParameter("id")));
        sushe.setLocation(request.getParameter("location"));
        sushe.setGuaranteecontent(request.getParameter("guaranteecontent"));
        sushe.setClean(request.getParameter("clean"));
        susheDao.updateSushe(sushe);

        Page page = Page.getPage(request,susheDao.getSusheListCount());
        request.setAttribute("paging",page);
        List<Sushe> susheList = susheDao.susheList(Page.getLimitNumber(page.index));
        request.setAttribute("list",susheList);
        request.getRequestDispatcher("team-list.jsp").forward(request,response);
    }


    @GetMapping("deleteTeam")
    public void deleteTeams(HttpServletRequest request,HttpServletResponse response)
            throws ServletException, IOException {
        susheDao.deletesushe(request.getParameter("id"));
        Page page = Page.getPage(request,susheDao.getSusheListCount());

        request.setAttribute("paging",page);
        List<Sushe> susheList = susheDao.susheList(Page.getLimitNumber(page.index));

        request.setAttribute("list",susheList);
        request.getRequestDispatcher("team-list.jsp").forward(request,response);
    }


    @PostMapping("/obscure-match")
    public void obscureMatch(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Sushe> sushe = susheDao.getOneSushe(request.getParameter("number"));
        request.setAttribute("list",sushe);
        Page page = Page.getPage(request,susheDao.getSusheListCount());
        request.setAttribute("paging",page);
        request.getRequestDispatcher("team-list.jsp").forward(request,response);
    }




}
