package com.example.springbootbase.controller;

import com.example.springbootbase.dao.WanguiDao;
import com.example.springbootbase.model.LateApply;
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
@RequestMapping("/wanguiapply-admin")
public class WanguiAdminController {

    @Autowired
    WanguiDao wanguiDao;

    @GetMapping("waigui-list-admin")
    public void WaiguiList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Page page = Page.getPage(request,wanguiDao.getWanGuiListCount());
        request.setAttribute("paging",page);
        List<LateApply> lateApplyList = wanguiDao.wanguiList(Page.getLimitNumber(page.index));
        request.setAttribute("list", lateApplyList);

        request.getRequestDispatcher("wangui-list-admin.jsp").forward(request,response);
    }

    @PostMapping("updateResultTrue")
    public void updateResultState(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String applyid = request.getParameter("applyid");
        String reason = request.getParameter("reason");
        String pass = "通过";
        wanguiDao.updateResultState(applyid,reason,pass);
    }


    @PostMapping("updateResultFalse")
    public void updateResultStateFalse(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String applyid = request.getParameter("applyid");
        String reason = request.getParameter("reason");
        String pass = "不通过";
        wanguiDao.updateResultFalseState(applyid,reason,pass);
    }



    @PostMapping("/obscure-match")
    public void obscureMatch(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String grade = request.getParameter("grade");
        List<LateApply> lateApplyList = wanguiDao.getObscureMatchResult(grade);
        request.setAttribute("list", lateApplyList);
        Page page = Page.getPage(request,wanguiDao.getLateApplyListObscureMatchCount(grade));
        request.setAttribute("paging",page);
        request.getRequestDispatcher("wangui-list-admin.jsp").forward(request,response);
    }





}
