package com.example.springbootbase.controller;

import com.example.springbootbase.dao.PersonDao;
import com.example.springbootbase.dao.VolunteerAndAdminDao;
import com.example.springbootbase.model.Person;
import com.example.springbootbase.model.VolunteerAndAdmin;
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
@RequestMapping("/person")
public class PersonController {

    @Autowired
    PersonDao personDao;

    @Autowired
    VolunteerAndAdminDao volunteerAndAdminDao;


    @PostMapping("add-volunteer")
    public void addVolunteer(HttpServletRequest request,HttpServletResponse response)
            throws ServletException, IOException {
        Person person = new Person();
        person.setUsername(request.getParameter("username"));
        person.setPassword(request.getParameter("password"));
        person.setName(request.getParameter("name"));
        person.setEmail(request.getParameter("email"));
        person.setSex(request.getParameter("sex"));
        person.setRole("志愿者");
        person.setTelephone(request.getParameter("tel"));
        personDao.insertPerson(person);
        request.getRequestDispatcher("success.jsp").forward(request,response);
    }


    /**
     * 单个页面的跳转
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @GetMapping("single-volunteer-show")
    public void singleVolunteer(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        Integer id = Integer.parseInt(request.getParameter("id"));
        Person person = personDao.getPersonById(id.toString());
        request.setAttribute("name",person.getName());
        request.setAttribute("password",person.getPassword());
        request.setAttribute("username",person.getUsername());
        request.setAttribute("email",person.getEmail());
        request.setAttribute("sex",person.getSex());
        request.setAttribute("tel",person.getTelephone());
        request.setAttribute("grade",person.getGrade());
        request.setAttribute("major",person.getMajor());
        request.setAttribute("role",person.getRole());
        request.getRequestDispatcher("volunteer-info-show.jsp").forward(request,response);
    }

    @GetMapping("single-volunteer-update")
    public void singleVolunteerupdate(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        Integer id = Integer.parseInt(request.getParameter("id"));
        Person person = personDao.getPersonById(id.toString());
        request.setAttribute("id",request.getParameter("id"));
        request.setAttribute("name",person.getName());
        request.setAttribute("password",person.getPassword());
        request.setAttribute("username",person.getUsername());
        request.setAttribute("email",person.getEmail());
        request.setAttribute("sex",person.getSex());
        request.setAttribute("tel",person.getTelephone());
        request.setAttribute("major",person.getMajor());
        request.setAttribute("grade",person.getGrade());
        request.getRequestDispatcher("volunteer-info-update.jsp").forward(request,response);
    }

    @PostMapping("update-single-volunteer")
    public void volunteerSingleUpdate(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        Person person = new Person();
        person.setPersonid(request.getParameter("id"));
        person.setUsername(request.getParameter("username"));
        person.setPassword(request.getParameter("password"));
        person.setName(request.getParameter("name"));
        person.setSex(request.getParameter("sex"));
        person.setTelephone(request.getParameter("tel"));
        person.setEmail(request.getParameter("email"));
        person.setMajor(request.getParameter("major"));
        person.setGrade(request.getParameter("grade"));
        personDao.updatePerson(person);
        request.getRequestDispatcher("update-success.jsp").forward(request,response);
    }


    @GetMapping("add-volunteers")
    public void addVolunteersByAdminGet(HttpServletRequest request,HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("add-volunteer.jsp").forward(request,response);
    }

    @PostMapping("add-volunteers")
    public void addVolunteersByAdminPost(HttpServletRequest request,HttpServletResponse response)
            throws ServletException, IOException {
        Person person = new Person();
        person.setUsername(request.getParameter("username"));
        person.setPassword(request.getParameter("password"));
        person.setName(request.getParameter("name"));
        person.setEmail(request.getParameter("email"));
        person.setSex(request.getParameter("sex"));
        person.setTelephone(request.getParameter("tel"));
        person.setGrade(request.getParameter("grade"));
        person.setMajor(request.getParameter("major"));
        person.setRole("学生");
        personDao.insertPerson(person);
        request.getRequestDispatcher("success.jsp").forward(request,response);
    }

    @PostMapping("volunteer-list")
    public void volunteerLists(HttpServletRequest request,HttpServletResponse response)
            throws ServletException, IOException {
        Page page = Page.getPage(request,personDao.getPersonListCount());
        List<Person> personList = personDao.personList(Page.getLimitNumber(page.index));
        request.setAttribute("list",personList);
        request.getRequestDispatcher("volunteer-list.jsp").forward(request,response);
    }


    @GetMapping("volunteer-list")
    public void volunteerList(HttpServletRequest request,HttpServletResponse response)
            throws ServletException, IOException {
        Page page = Page.getPage(request,personDao.getPersonListCount());

        request.setAttribute("paging",page);
        List<Person> personList = personDao.personList(Page.getLimitNumber(page.index) );

        request.setAttribute("list",personList);
        request.setAttribute("title","志愿者列表");
        request.getRequestDispatcher("volunteer-list.jsp").forward(request,response);
    }

    @GetMapping("updateVolunteer")
    public void updateVolunteers(HttpServletRequest request,HttpServletResponse response)
            throws ServletException, IOException {
        List<Person> onlyOnePersons = new ArrayList<>();
        Person person = personDao.getPersonById(request.getParameter("id"));
        onlyOnePersons.add(person);
        request.setAttribute("person",onlyOnePersons);
        request.getRequestDispatcher("update-volunteer-admin.jsp").forward(request,response);
    }


    @PostMapping("update-volunteers-admin")
    public void updateVolunteerByAdmin(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        Person person = new Person();
        person.setPersonid(request.getParameter("id"));
        person.setUsername(request.getParameter("username"));
        person.setPassword(request.getParameter("password"));
        person.setName(request.getParameter("name"));
        person.setSex(request.getParameter("sex"));
        person.setTelephone(request.getParameter("tel"));
        person.setEmail(request.getParameter("email"));
        person.setGrade(request.getParameter("grade"));
        person.setMajor(request.getParameter("major"));
        personDao.updatePerson(person);
        Page page = Page.getPage(request,personDao.getPersonListCount());

        request.setAttribute("paging",page);
        List<Person> personList = personDao.personList(Page.getLimitNumber(page.index));
        request.setAttribute("list",personList);
        request.getRequestDispatcher("volunteer-list.jsp").forward(request,response);

    }

    @GetMapping("deleteVolunteer")
    public void deleteVolunteers(HttpServletRequest request,HttpServletResponse response)
            throws ServletException, IOException {
        personDao.deletePerson(request.getParameter("id"));
        Page page = Page.getPage(request,personDao.getPersonListCount());

        request.setAttribute("paging",page);
        List<Person> personList = personDao.personList(Page.getLimitNumber(page.index));
        request.setAttribute("list",personList);
        request.getRequestDispatcher("volunteer-list.jsp").forward(request,response);
    }

    @PostMapping("/obscure-match")
    public void obscureMatch(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Person> person = personDao.getOnePerson(request.getParameter("number"));
        request.setAttribute("list",person);
        Page page = Page.getPage(request,personDao.getPersonListCount());
        request.setAttribute("paging",page);
        request.getRequestDispatcher("volunteer-list.jsp").forward(request,response);
    }






    @GetMapping("/promote")
    public void promoteAdmin(HttpServletRequest request,HttpServletResponse response)
            throws ServletException, IOException {

        Integer personid = Integer.parseInt(request.getParameter("id"));
        VolunteerAndAdmin volunteerAndAdmin = new VolunteerAndAdmin();
        volunteerAndAdmin.setPersonid(personid);
        volunteerAndAdminDao.insertvolunteerandadmin(volunteerAndAdmin);
        Person person = personDao.getPersonById(personid + "");
        Person newperson = new Person();
        newperson.setEmail(person.getEmail());
        newperson.setName(person.getName());
        newperson.setPassword(person.getPassword());
        newperson.setTelephone(person.getTelephone());
        newperson.setRole("管理员");
        newperson.setUsername(person.getUsername());
        newperson.setSex(person.getSex());
        personDao.insertPerson(newperson);
    }





}
