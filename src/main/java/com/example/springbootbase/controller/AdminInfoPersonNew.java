package com.example.springbootbase.controller;

import com.example.springbootbase.dao.PersonDao;
import com.example.springbootbase.dao.PersonNewDao;
import com.example.springbootbase.model.Person;
import com.example.springbootbase.model.Person_New;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
@RequestMapping("/admin-info-personnew")
public class AdminInfoPersonNew {

    @Autowired
    PersonNewDao personNewDao;

    @GetMapping("single-admin-show")
    public void singleAdminInfo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Integer id = Integer.parseInt(request.getSession().getAttribute("personId").toString());
        Person_New person_new = personNewDao.getPerson_NewById(id.toString());
        request.setAttribute("name",person_new.getName());
        request.setAttribute("studentid",person_new.getStudentid());
        request.setAttribute("password",person_new.getPassword());
        request.setAttribute("email",person_new.getEmail());
        request.setAttribute("sex",person_new.getSex());
        request.setAttribute("tel",person_new.getTelephone());
        request.setAttribute("classes",person_new.getClasses());
        request.setAttribute("major",person_new.getMajor());
        request.getRequestDispatcher("personnew-admin-info-show.jsp").forward(request,response);
    }


    @GetMapping("single-admin-update")
    public void singleAdminupdate(HttpServletRequest request,HttpServletResponse response)
            throws ServletException, IOException {
        Integer id = Integer.parseInt(request.getSession().getAttribute("personId").toString());
        Person_New person_new = personNewDao.getPerson_NewById(id.toString());
        System.out.println("-----------------" + person_new);
        request.setAttribute("id",id);
        request.setAttribute("studentid",person_new.getStudentid());
        request.setAttribute("name",person_new.getName());
        request.setAttribute("password",person_new.getPassword());
        request.setAttribute("username",person_new.getStudentid());
        request.setAttribute("email",person_new.getEmail());
        request.setAttribute("sex",person_new.getSex());
        request.setAttribute("tel",person_new.getTelephone());
        request.setAttribute("classes",person_new.getClasses());
        request.setAttribute("major",person_new.getMajor());
        request.getRequestDispatcher("personnew-admin-info-update.jsp").forward(request,response);
    }



    @PostMapping("single-admin-update")
    public void adminSingleUpdate(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        Person_New person_new = new Person_New();
        person_new.setPersonid(request.getParameter("id"));
        person_new.setStudentid(request.getParameter("studentid"));
        person_new.setPassword(request.getParameter("password"));
        person_new.setName(request.getParameter("name"));
        person_new.setMajor(request.getParameter("major"));
        person_new.setClasses(request.getParameter("classes"));
        person_new.setSex(request.getParameter("sex"));
        person_new.setEmail(request.getParameter("email"));
        person_new.setTelephone(request.getParameter("tel"));
        personNewDao.updatePerson_New(person_new);
        request.getRequestDispatcher("personnew-success.jsp").forward(request,response);
    }

    @GetMapping("add-admin-jsp")
    public void adminAddJsp(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("personnew-add-admin.jsp").forward(request,response);
    }


    @PostMapping("add-admin")
    public void adminAdd(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {

        Person_New person_new = new Person_New();
        person_new.setTelephone(request.getParameter("tel"));
        person_new.setEmail(request.getParameter("email"));
        person_new.setSex(request.getParameter("sex"));
        person_new.setClasses("");
        person_new.setMajor("");
        person_new.setPersonid(request.getParameter("id"));
        person_new.setStudentid(request.getParameter("studentid"));
        person_new.setName(request.getParameter("name"));
        person_new.setPassword(request.getParameter("password"));
        person_new.setRole("管理员");
        personNewDao.insertPerson_New(person_new);
        request.getRequestDispatcher("personnew-add-ok.jsp").forward(request,response);

    }







}
