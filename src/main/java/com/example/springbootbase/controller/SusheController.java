package com.example.springbootbase.controller;

import com.example.springbootbase.dao.PersonDao;
import com.example.springbootbase.dao.SusheDao;
import com.example.springbootbase.dao.SusheRelDao;
import com.example.springbootbase.model.Sushe;
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
@RequestMapping("/sushe-student")
public class SusheController {


    @Autowired
    SusheRelDao susheRelDao;

    @Autowired
    SusheDao susheDao;

    @Autowired
    PersonDao personDao;

    /**
     * 单个页面的跳转
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @GetMapping("susheinfo-student")
    public void SusheInfoStudent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer personid = Integer.parseInt(request.getParameter("personId"));
        Integer susheid = susheRelDao.getSusheIdByPersonId(personid);
        List<String> personnamelist = new ArrayList<>();
        List<Integer> personidlist = susheRelDao.getListPersonIdBySusheId(susheid);
        for(Integer peopleid : personidlist){
            String peoplename = personDao.getNameByPersonId(peopleid);
            personnamelist.add(peoplename);
        }
        Sushe sushe = susheDao.getSusheBySusheId(susheid);
        request.setAttribute("sushenumber",sushe.getNumber());
        request.setAttribute("sushelocation",sushe.getLocation());
        request.setAttribute("susheguaranteecontent",sushe.getGuaranteecontent());
        request.setAttribute("susheclean",sushe.getClean());
        request.setAttribute("personnamelist",personnamelist);
        request.getRequestDispatcher("susheinfo-stushow.jsp").forward(request,response);
    }



    /**
     * 单个页面的跳转
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @GetMapping("sushebaoxiu-student")
    public void SusheBaoxiuStudent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer personid = Integer.parseInt(request.getParameter("personId"));
        Integer susheid = susheRelDao.getSusheIdByPersonId(personid);
        Sushe sushe = susheDao.getSusheBySusheId(susheid);
        request.setAttribute("sushenumber",sushe.getNumber());
        request.setAttribute("sushelocation",sushe.getLocation());
        request.setAttribute("susheclean",sushe.getClean());
        request.getRequestDispatcher("sushebaoxiu-stushow.jsp").forward(request,response);
    }

    @PostMapping("update-sushebaoxiu")
    public void updatesushebaoxiu(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String susheguaranteecontent = request.getParameter("susheguaranteecontent");
        String susheclean = request.getParameter("susheclean");
        Integer personid = Integer.parseInt(request.getSession().getAttribute("personId").toString());
        Integer susheid = susheRelDao.getSusheIdByPersonId(personid);
        susheDao.updateGuaranteeContentBySusheid(susheid,susheguaranteecontent,susheclean);
        request.getRequestDispatcher("update-ok.jsp").forward(request,response);
    }

}
