package com.example.springbootbase.controller;

import com.example.springbootbase.dao.PersonDao;
import com.example.springbootbase.dao.PersonNewDao;
import com.example.springbootbase.model.Person;
import com.example.springbootbase.model.Person_New;
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
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/person_New")
public class PersonNewController {

    @Autowired
    PersonNewDao personNewDao;

    @PostMapping("add-volunteer")
    public void addVolunteer(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Person_New person_new = new Person_New();
        person_new.setStudentid(request.getParameter("studentid"));
        person_new.setPassword(request.getParameter("password"));
        person_new.setName(request.getParameter("password"));
        person_new.setEmail(request.getParameter("email"));
        person_new.setSex(request.getParameter("sex"));
        person_new.setRole("学生");
        person_new.setClasses(request.getParameter("classes"));
        person_new.setMajor(request.getParameter("major"));
        person_new.setTelephone(request.getParameter("tel"));
        personNewDao.insertPerson_New(person_new);
        request.getRequestDispatcher("personnew_success.jsp").forward(request,response);
    }


    @GetMapping("single-volunteer-show")
    public void singleVolunteer(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        Integer id = Integer.parseInt(request.getParameter("id"));

        Person_New person_new = personNewDao.getPerson_NewById(id.toString());
        request.setAttribute("name",person_new.getName());
        request.setAttribute("password",person_new.getPassword());
        request.setAttribute("studentid",person_new.getStudentid());
        request.setAttribute("email",person_new.getEmail());
        request.setAttribute("sex",person_new.getSex());
        request.setAttribute("tel",person_new.getTelephone());
        request.setAttribute("classes",person_new.getClasses());
        request.setAttribute("major",person_new.getMajor());
        request.setAttribute("role",person_new.getRole());

        request.getRequestDispatcher("personnew_volunteer-info-show.jsp").forward(request,response);
    }

    @GetMapping("single-volunteer-update")
    public void singleVolunteerupdate(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        Integer id = Integer.parseInt(request.getParameter("id"));

        Person_New person_new = personNewDao.getPerson_NewById(id.toString());
        request.setAttribute("id",request.getParameter("id"));
        request.setAttribute("name",person_new.getName());
        request.setAttribute("password",person_new.getPassword());
        request.setAttribute("studentid",person_new.getStudentid());
        request.setAttribute("email",person_new.getEmail());
        request.setAttribute("sex",person_new.getSex());
        request.setAttribute("tel",person_new.getTelephone());
        request.setAttribute("major",person_new.getMajor());
        request.setAttribute("classes",person_new.getClasses());
        request.getRequestDispatcher("personnew_volunteer-info-update.jsp").forward(request,response);
    }

    @PostMapping("update-single-volunteer")
    public void volunteerSingleUpdate(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        Person_New person_new = new Person_New();
        person_new.setPersonid(request.getParameter("id"));
        person_new.setStudentid(request.getParameter("studentid"));
        person_new.setName(request.getParameter("name"));
        person_new.setPassword(request.getParameter("password"));
        person_new.setTelephone(request.getParameter("tel"));
        person_new.setMajor(request.getParameter("major"));
        person_new.setEmail(request.getParameter("email"));
        person_new.setClasses(request.getParameter("classes"));
        person_new.setSex(request.getParameter("sex"));
        personNewDao.updatePerson_New(person_new);

        request.getRequestDispatcher("personnew_update-success.jsp").forward(request,response);
    }


    @GetMapping("add-volunteers")
    public void addVolunteersByAdminGet(HttpServletRequest request,HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("personnew_add_volunteer.jsp").forward(request,response);
    }


    @PostMapping("add-volunteers")
    public void addVolunteersByAdminPost(HttpServletRequest request,HttpServletResponse response)
            throws ServletException, IOException {

        Person_New person_new = new Person_New();
        person_new.setStudentid(request.getParameter("studentid"));
        person_new.setPassword(request.getParameter("password"));
        person_new.setName(request.getParameter("name"));
        person_new.setMajor(request.getParameter("major"));
        person_new.setEmail(request.getParameter("email"));
        person_new.setClasses(request.getParameter("classes"));
        person_new.setTelephone(request.getParameter("tel"));
        person_new.setSex(request.getParameter("sex"));
        person_new.setRole("学生");
        personNewDao.insertPerson_New(person_new);

        request.getRequestDispatcher("personnew_success.jsp").forward(request,response);
    }

    @PostMapping("volunteer-list")
    public void volunteerLists(HttpServletRequest request,HttpServletResponse response)
            throws ServletException, IOException {
        Page page = Page.getPage(request,personNewDao.getPerson_NewListCount());
        List<Person_New> personNewList = personNewDao.person_NewList(Page.getLimitNumber(page.index));
        request.setAttribute("list",personNewList);
        request.getRequestDispatcher("personnew_volunteer-list.jsp").forward(request,response);

    }

    @GetMapping("qinshi-fenpei")
    public void qinshifenpei(HttpServletRequest request,HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("qinshi-fenpei.jsp").forward(request,response);

    }



    @GetMapping("volunteer-list")
    public void volunteerList(HttpServletRequest request,HttpServletResponse response)
            throws ServletException, IOException {
        Page page = Page.getPage(request,personNewDao.getPerson_NewListCount());
        request.setAttribute("paging",page);
        List<Person_New> personNewList = personNewDao.person_NewList(Page.getLimitNumber(page.index));
        request.setAttribute("list",personNewList);
        request.getRequestDispatcher("personnew_volunteer-list.jsp").forward(request,response);
    }


    @GetMapping("updateVolunteer")
    public void updateVolunteers(HttpServletRequest request,HttpServletResponse response)
            throws ServletException, IOException {
        List<Person_New> onlyOnePersons = new ArrayList<>();
        Person_New person_new = personNewDao.getPerson_NewById(request.getParameter("id"));
        onlyOnePersons.add(person_new);
        request.setAttribute("person",onlyOnePersons);
        request.getRequestDispatcher("personnew_update-volunteer-admin.jsp").forward(request,response);
    }



    @PostMapping("update-volunteers-admin")
    public void updateVolunteerByAdmin(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        Person_New person_new = new Person_New();
        person_new.setPersonid(request.getParameter("id"));
        person_new.setStudentid(request.getParameter("studentid"));
        person_new.setPassword(request.getParameter("password"));
        person_new.setTelephone(request.getParameter("tel"));
        person_new.setSex(request.getParameter("sex"));
        person_new.setName(request.getParameter("name"));
        person_new.setEmail(request.getParameter("email"));
        person_new.setClasses(request.getParameter("classes"));
        person_new.setMajor(request.getParameter("major"));
        personNewDao.updatePerson_New(person_new);
        Page page = Page.getPage(request,personNewDao.getPerson_NewListCount());
        request.setAttribute("paging",page);

        List<Person_New> personNewList = personNewDao.person_NewList(Page.getLimitNumber(page.index));
        request.setAttribute("list",personNewList);
        request.getRequestDispatcher("personnew_volunteer-list.jsp").forward(request,response);
    }


    @GetMapping("deleteVolunteer")
    public void deleteVolunteers(HttpServletRequest request,HttpServletResponse response)
            throws ServletException, IOException {
        personNewDao.deletePerson_New(request.getParameter("id"));
        Page page = Page.getPage(request,personNewDao.getPerson_NewListCount());
        request.setAttribute("paging",page);
        List<Person_New> personNewList = personNewDao.person_NewList(Page.getLimitNumber(page.index));
        request.setAttribute("list",personNewList);
        request.getRequestDispatcher("personnew_volunteer-list.jsp").forward(request,response);
    }

    @PostMapping("/obscure-match")
    public void obscureMatch(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Person_New> personNewList = personNewDao.getOnePerson_New(request.getParameter("number"));
        request.setAttribute("list",personNewList);
        Page page = Page.getPage(request,personNewDao.getPerson_NewListCount());
        request.setAttribute("paging",page);
        request.getRequestDispatcher("personnew_volunteer-list.jsp").forward(request,response);

    }




}
