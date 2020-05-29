package com.example.springbootbase.controller;

import com.example.springbootbase.dao.ForeignerDao;
import com.example.springbootbase.dao.SusheDao;
import com.example.springbootbase.model.Foreigner;
import com.example.springbootbase.model.Person;
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
@RequestMapping("/laifang-admin")
public class LaiFangController {

    @Autowired
    ForeignerDao foreignerDao;

    @Autowired
    SusheDao susheDao;


    @GetMapping("add-laifang-jsp")
    public void laifangList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Integer> sushenumber = susheDao.getSusheNumberFromSushe();
        request.setAttribute("sushenumberts",sushenumber);
        request.getRequestDispatcher("add-laifang.jsp").forward(request,response);
    }


    @GetMapping("laifang-list-jsp")
    public void laifangListJsp(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Page page = Page.getPage(request,foreignerDao.getForeignerListCount());
        request.setAttribute("paging",page);
        List<Foreigner> foreignerList = foreignerDao.foreignerList(Page.getLimitNumber(page.index));
        request.setAttribute("list", foreignerList);
        request.getRequestDispatcher("laifang-list.jsp").forward(request,response);
    }

    @PostMapping("add-laifang")
    public void addLaifang(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String job = request.getParameter("job");
        String sushenumber = request.getParameter("mySelect");
        String cometime = request.getParameter("cometime");
        String lefttime = request.getParameter("lefttime");
        Foreigner foreigner = new Foreigner();
        foreigner.setCometime(cometime);
        foreigner.setLefttime(lefttime);
        foreigner.setJob(job);
        foreigner.setSushenumber(sushenumber);
        foreigner.setName(name);
        foreignerDao.insertForeigner(foreigner);
        request.getRequestDispatcher("insert-ok.jsp").forward(request,response);
    }


    @PostMapping("obscure-match")
    public void obscureMatch(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Foreigner> foreigner = foreignerDao.getOneForeign(request.getParameter("number"));
        request.setAttribute("list",foreigner);
        Page page = Page.getPage(request,1);
        request.setAttribute("paging",page);
        request.getRequestDispatcher("laifang-list.jsp").forward(request,response);
    }
}
