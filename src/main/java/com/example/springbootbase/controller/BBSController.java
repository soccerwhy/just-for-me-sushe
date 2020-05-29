package com.example.springbootbase.controller;

import com.example.springbootbase.dao.BBSDao;
import com.example.springbootbase.dao.PerponSusheRelDao;
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
@RequestMapping("/BBS")
public class BBSController {

    @Autowired
    BBSDao bbsDao;

    @Autowired
    PerponSusheRelDao perponSusheRelDao;

    @GetMapping("insert-content-page")
    public void getAddContentJSP(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("insert-BBS.jsp").forward(request,response);
    }


    @PostMapping("insert-content")
    public void insertBBS(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String personId = request.getSession().getAttribute("personId").toString();
        String bbstitle = request.getParameter("bbstitle");
        String bbscontent = request.getParameter("bbscontent");

        /**
         * TODO getsusheIDByPersonId
         */

        Integer susheid = perponSusheRelDao.getSusheIdBypersonId(Integer.parseInt(personId));
        BBS bbs = new BBS();
        bbs.setBbscontent(bbscontent);
        bbs.setBbstitle(bbstitle);
        bbs.setSusheid(susheid);

        bbsDao.insertBBS(bbs);
        request.getRequestDispatcher("success.jsp").forward(request,response);
    }


    @GetMapping("show-content")
    public void contentList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String personId = request.getSession().getAttribute("personId").toString();
        Integer susheid = perponSusheRelDao.getSusheIdBypersonId(Integer.parseInt(personId));
        Page page = Page.getPage(request,bbsDao.getBBSCountBySusheId(susheid));
        request.setAttribute("paging",page);

        List<BBS> bbsList =bbsDao.getBBSListBySusheid(susheid,Page.getLimitNumber(page.index));
        request.setAttribute("list",bbsList);
        request.getRequestDispatcher("BBS-List.jsp").forward(request,response);
    }

    @GetMapping("BBSDetail")
    public void detailContent(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String bbstitle = request.getParameter("bbstitle");
        BBS bbs = bbsDao.getBBSByBbstitle(bbstitle);
        request.setAttribute("bbstitle",bbs.getBbstitle());
        request.setAttribute("bbscontent",bbs.getBbscontent());
        request.getRequestDispatcher("BBS-Detail.jsp").forward(request,response);
    }

    @PostMapping("/obscure-match")
    public void obscureMatch(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String personId = request.getSession().getAttribute("personId").toString();
        String keyword = request.getParameter("keyword");
        Integer susheid =  perponSusheRelDao.getSusheIdBypersonId(Integer.parseInt(personId));
        Page page = Page.getPage(request,bbsDao.getBBSListCountByKeyword("%" + keyword + "%",susheid));
        List<BBS> bbsList = bbsDao.getBBSListByKeyword(keyword,susheid,Page.getLimitNumber(page.index));
        request.setAttribute("list",bbsList);
        request.setAttribute("paging",page);
        request.getRequestDispatcher("BBS-List.jsp").forward(request,response);
    }

}
