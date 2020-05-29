package com.example.springbootbase.controller;

import com.example.springbootbase.dao.PersonNewDao;
import com.example.springbootbase.dao.SusheDao;
import com.example.springbootbase.dao.SusheRelDao;
import com.example.springbootbase.dao.WanguiNewDao;
import com.example.springbootbase.model.LateApplyNew;
import com.example.springbootbase.model.Person_New;
import com.example.springbootbase.model.Sushe;
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
@RequestMapping("/wanguiapplynew-student")
public class WanguiNewStudentController {

    @Autowired
    WanguiNewDao wanguiNewDao;

    @Autowired
    PersonNewDao personNewDao;

    @Autowired
    SusheRelDao susheRelDao;

    @Autowired
    SusheDao susheDao;

    @GetMapping("wangui-list-apply")
    public void wanguiListApply(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String personid = request.getParameter("personId");
        System.out.println("personid---------------------:" + personid);
        Person_New person_new = personNewDao.getPerson_NewById(personid);
        request.setAttribute("name",person_new.getName());
        request.setAttribute("major",person_new.getMajor());
        request.setAttribute("classes",person_new.getClasses());
        Integer susheid = susheRelDao.getSusheIdByPersonId(Integer.parseInt(personid));
        Sushe sushe = susheDao.getSusheBySusheId(susheid);
        request.setAttribute("sushelocation",sushe.getLocation());
        request.setAttribute("sushenumber",sushe.getNumber());
        request.getRequestDispatcher("wangui-insert.jsp").forward(request,response);
    }
    @PostMapping("add-wanguiinfo")
    public void addWanguiInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer personid = Integer.parseInt(request.getSession().getAttribute("personId").toString());
        String name = request.getParameter("name");
        String major = request.getParameter("major");
        String classes = request.getParameter("classes");
        String content = request.getParameter("content");
        String sushenumber = request.getParameter("sushenumber");
        String sushelocation = request.getParameter("sushelocation");
        LateApplyNew lateApplyNew = new LateApplyNew();
        lateApplyNew.setPersonid(personid);
        lateApplyNew.setPersonname(name);
        lateApplyNew.setApplycontent(content);
        lateApplyNew.setApplyreason("");
        lateApplyNew.setApplyresult("");
        lateApplyNew.setPersonmajor(major);
        lateApplyNew.setPersongrade(classes);
        lateApplyNew.setSushelocation(sushelocation);
        lateApplyNew.setSushenumber(sushenumber);
        wanguiNewDao.InsertWanguiNew(lateApplyNew);
        request.getRequestDispatcher("insert-ok.jsp").forward(request,response);
    }


    @GetMapping("wangui-apply-result-show")
    public void wanguiListApplyResult(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String personId = request.getSession().getAttribute("personId").toString();
        Page page = Page.getPage(request,wanguiNewDao.lateApplyNewListCountById(Integer.parseInt(personId)));
        request.setAttribute("paging",page);
        Integer limitNumber = Page.getLimitNumber(page.index);
        List<LateApplyNew> lateApplyNewList = wanguiNewDao.lateApplyNewListById(limitNumber,Integer.parseInt(personId));
        request.setAttribute("list", lateApplyNewList);
        request.getRequestDispatcher("lateapply-list-student.jsp").forward(request,response);

    }


    @PostMapping("/obscure-match")
    public void obscureMatch(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<LateApplyNew> lateApplyNewList =wanguiNewDao.selectOneLateApplyNewById(Integer.parseInt(request.getParameter("number")));
        request.setAttribute("list",lateApplyNewList);
        Page page = Page.getPage(request,1);
        request.setAttribute("paging",page);
        request.getRequestDispatcher("lateapply-list-student.jsp").forward(request,response);
    }


}
