package com.example.springbootbase.controller;

import com.example.springbootbase.dao.WanguiNewDao;
import com.example.springbootbase.model.LateApplyNew;
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
@RequestMapping("/wanguinewapply-admin")
public class WanguiNewAdminController {

    @Autowired
    WanguiNewDao wanguiNewDao;

    @GetMapping("waigui-list-admin")
    public void WaiguiList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Page page = Page.getPage(request,wanguiNewDao.getWanGuiNewListCount());
        request.setAttribute("paging",page);
        List<LateApplyNew> lateApplyNewList = wanguiNewDao.wanguiNewList(Page.getLimitNumber(page.index));
        request.setAttribute("list", lateApplyNewList);
        request.getRequestDispatcher("wangui-list-admin.jsp").forward(request,response);

    }

    @PostMapping("updateResultTrue")
    public void updateResultState(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String applyid = request.getParameter("applyid");
        String reason = request.getParameter("reason");
        String pass = "通过";
        wanguiNewDao.updateResultState(applyid,reason,pass);
    }


    @PostMapping("updateResultFalse")
    public void updateResultStateFalse(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String applyid = request.getParameter("applyid");
        String reason = request.getParameter("reason");
        String pass = "不通过";
        wanguiNewDao.updateResultFalseState(applyid,reason,pass);
    }



    @PostMapping("/obscure-match")
    public void obscureMatch(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String major = request.getParameter("major");
        List<LateApplyNew> lateApplyNewList = wanguiNewDao.getObscureMatchNewResult(major);
        request.setAttribute("list", lateApplyNewList);
        Page page = Page.getPage(request,wanguiNewDao.getLateApplyNewListObscureMatchCount(major));
        request.setAttribute("paging",page);
        request.getRequestDispatcher("wangui-list-admin.jsp").forward(request,response);
    }




}
