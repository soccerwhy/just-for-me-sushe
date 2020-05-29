package com.example.springbootbase.controller;

import com.example.springbootbase.dao.WanguiDao;
import com.example.springbootbase.model.LateApply;
import com.example.springbootbase.model.Team;
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
@RequestMapping("/wanguiapply-student")
public class WanguiStudentController {


    @Autowired
    WanguiDao wanguiDao;

    @GetMapping("wangui-list-apply")
    public void wanguiListApply(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("wangui-insert.jsp").forward(request,response);
    }
    @PostMapping("add-wanguiinfo")
    public void addWanguiInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer personid = Integer.parseInt(request.getSession().getAttribute("personId").toString());
        String name = request.getParameter("name");
        String major = request.getParameter("major");
        String classes = request.getParameter("classes");
        String content = request.getParameter("content");
        LateApply lateApply = new LateApply();
        lateApply.setPersonid(personid);
        lateApply.setApplycontent(content);
        lateApply.setPersonname(name);
        lateApply.setPersongrade(classes);
        lateApply.setPersonmajor(major);
        lateApply.setApplyreason("");
        lateApply.setApplyresult("");
        wanguiDao.InsertWangui(lateApply);
        request.getRequestDispatcher("insert-ok.jsp").forward(request,response);
    }


    @GetMapping("wangui-apply-result-show")
    public void wanguiListApplyResult(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String personId = request.getSession().getAttribute("personId").toString();
        Page page = Page.getPage(request,wanguiDao.lateApplyListCountById(Integer.parseInt(personId)));

        request.setAttribute("paging",page);
        Integer limitNumber = Page.getLimitNumber(page.index);
        List<LateApply> lateApplyList = wanguiDao.lateApplyListById(limitNumber,Integer.parseInt(personId));
        request.setAttribute("list", lateApplyList);
        request.getRequestDispatcher("lateapply-list-student.jsp").forward(request,response);
    }


    @PostMapping("/obscure-match")
    public void obscureMatch(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<LateApply> lateApplyList = wanguiDao.selectOneLateApplyById(Integer.parseInt(request.getParameter("number")));
        request.setAttribute("list",lateApplyList);
        Page page = Page.getPage(request,1);
        request.setAttribute("paging",page);
        request.getRequestDispatcher("lateapply-list-student.jsp").forward(request,response);
    }

}
