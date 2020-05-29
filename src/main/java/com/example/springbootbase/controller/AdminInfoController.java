package com.example.springbootbase.controller;


import com.example.springbootbase.dao.PersonDao;
import com.example.springbootbase.model.Person;
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
@RequestMapping("/admin-info")
public class AdminInfoController {

    @Autowired
    PersonDao personDao;

    @GetMapping("single-admin-show")
    public void singleAdminInfo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Integer id = Integer.parseInt(request.getSession().getAttribute("personId").toString());
        Person person = personDao.getPersonById(id.toString());
        request.setAttribute("name",person.getName());
        request.setAttribute("password",person.getPassword());
        request.setAttribute("username",person.getUsername());
        request.setAttribute("email",person.getEmail());
        request.setAttribute("sex",person.getSex());
        request.setAttribute("tel",person.getTelephone());
        request.getRequestDispatcher("admin-info-show.jsp").forward(request,response);
    }


    @GetMapping("single-admin-update")
    public void singleAdminupdate(HttpServletRequest request,HttpServletResponse response)
            throws ServletException, IOException {
        Integer id = Integer.parseInt(request.getSession().getAttribute("personId").toString());
        Person person = personDao.getPersonById(id.toString());
        request.setAttribute("id",id);
        request.setAttribute("name",person.getName());
        request.setAttribute("password",person.getPassword());
        request.setAttribute("username",person.getUsername());
        request.setAttribute("email",person.getEmail());
        request.setAttribute("sex",person.getSex());
        request.setAttribute("tel",person.getTelephone());
        request.getRequestDispatcher("admin-info-update.jsp").forward(request,response);
    }



    @PostMapping("single-admin-update")
    public void adminSingleUpdate(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        Person person = new Person();
        person.setPersonid(request.getParameter("id"));
        person.setUsername(request.getParameter("username"));
        person.setPassword(request.getParameter("password"));
        person.setName(request.getParameter("name"));
        person.setSex(request.getParameter("sex"));
        person.setTelephone(request.getParameter("tel"));
        person.setEmail(request.getParameter("email"));
        personDao.updatePerson(person);
        request.getRequestDispatcher("success.jsp").forward(request,response);
    }

    @GetMapping("add-admin-jsp")
    public void adminAddJsp(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("add-admin.jsp").forward(request,response);
    }


    @PostMapping("add-admin")
    public void adminAdd(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        Person person = new Person();
        person.setMajor("");
        person.setGrade("");
        person.setUsername(request.getParameter("username"));
        person.setPassword(request.getParameter("password"));
        person.setRole("管理员");
        person.setSex(request.getParameter("sex"));
        person.setTelephone(request.getParameter("tel"));
        person.setName(request.getParameter("name"));
        person.setEmail(request.getParameter("email"));
        personDao.insertPerson(person);
        request.getRequestDispatcher("add-ok.jsp").forward(request,response);
    }






}
