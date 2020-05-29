package com.example.springbootbase.controller;

import com.example.springbootbase.dao.BBSAdminDao;
import com.example.springbootbase.dao.PerponSusheRelDao;
import com.example.springbootbase.dao.SusheDao;
import com.example.springbootbase.model.BBS;
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
@RequestMapping("/BBS-ADMIN")
public class BBSAdminController {

    @Autowired
    BBSAdminDao bbsAdminDao;

    @Autowired
    PerponSusheRelDao perponSusheRelDao;

    @Autowired
    SusheDao susheDao;

    @GetMapping("insert-content-page")
    public void getAddContentJSP(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Integer> sushenumber = susheDao.getSusheNumberFromSushe();
        request.setAttribute("sushenumberts",sushenumber);
        request.getRequestDispatcher("insert-BBS.jsp").forward(request,response);
    }


    @PostMapping("insert-content")
    public void insertBBS(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String bbstitle = request.getParameter("bbstitle");
        String bbscontent = request.getParameter("bbscontent");
        String susheid = request.getParameter("mySelect");


        BBS bbs = new BBS();
        bbs.setBbscontent(bbscontent);
        bbs.setBbstitle(bbstitle);
        bbs.setSusheid(Integer.parseInt(susheid));

        bbsAdminDao.insertBBS(bbs);
        request.getRequestDispatcher("success.jsp").forward(request,response);
    }


    @GetMapping("show-content")
    public void contentList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Page page = Page.getPage(request,bbsAdminDao.getBBSCountByAdmin());

        request.setAttribute("paging",page);
        List<BBS> bbsList = bbsAdminDao.getBBSListByAdmin(Page.getLimitNumber(page.index));
        request.setAttribute("list",bbsList);
        request.getRequestDispatcher("BBS-List.jsp").forward(request,response);
    }

    @GetMapping("BBSDetail")
    public void detailContent(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String bbstitle = request.getParameter("bbstitle");
        BBS bbs = bbsAdminDao.getBBSByBbstitle(bbstitle);
        request.setAttribute("susheid",bbs.getSusheid().toString());
        request.setAttribute("bbstitle",bbs.getBbstitle());
        request.setAttribute("bbscontent",bbs.getBbscontent());
        request.getRequestDispatcher("BBS-Detail.jsp").forward(request,response);
    }

    @GetMapping("DELETE-BBS")
    public void deleteContent(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String bbstitle = request.getParameter("bbstitle");
        bbsAdminDao.deleteByBBSTitle(bbstitle);
        Page page = Page.getPage(request,bbsAdminDao.getBBSCountByAdmin());

        request.setAttribute("paging",page);
        List<BBS> bbsList = bbsAdminDao.getBBSListByAdmin(Page.getLimitNumber(page.index));
        request.setAttribute("list",bbsList);
        request.getRequestDispatcher("BBS-List.jsp").forward(request,response);
    }

}
