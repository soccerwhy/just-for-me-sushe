package com.example.springbootbase.controller;

import com.example.springbootbase.dao.LoginDao;
import com.example.springbootbase.dao.LoginNewDao;
import com.example.springbootbase.model.Person;
import com.example.springbootbase.model.Person_New;
import com.example.springbootbase.util.VerifyCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.IOException;

@Controller
@RequestMapping("/login")
public class LoginController {


    @Autowired
    LoginDao loginDao;

    @Autowired
    LoginNewDao loginNewDao;

    static String verifycode;

    @RequestMapping("/go")
    public String index(Model model){
        return "login";
    }


    @RequestMapping("/VerifyCodeServlet")
    public void nextIndex(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        VerifyCode vc = new VerifyCode();
        response.setHeader("Cache-Control", "no-cache");
        response.setContentType("image/jpeg");
        BufferedImage bim = vc.getImage();
        ImageIO.write(bim, "JPEG", response.getOutputStream());
        verifycode = vc.getText();
        request.getSession().setAttribute("verifyCode", verifycode);
    }

    @GetMapping("/main")
    public void loginIndex(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        request.setCharacterEncoding("UTF-8");
        String studentid = request.getParameter("studentid");
        String password = request.getParameter("password");
        String code = request.getParameter("code");
        String role = request.getParameter("role");
        Person_New person_new = loginNewDao.loginPersonNew(studentid,password,role);
        if(!(person_new == null)){
            request.setAttribute("id",person_new.getPersonid().toString());
            request.getSession().setAttribute("personId",person_new.getPersonid().toString());
            request.setAttribute("name",person_new.getName());
        }

        Boolean codeIsRight = false;
        if(verifycode.equals(code)){
            codeIsRight = true;
        }else{
            codeIsRight = false;
        }
        if((!(person_new == null)) && codeIsRight && role.equals("学生")){
                request.getRequestDispatcher("volunteer-home.jsp").forward(request,response);
        }
        if((!(person_new == null)) && codeIsRight && role.equals("管理员")){
                response.sendRedirect("admin-home.jsp");
        }
        if((person_new == null) || (!codeIsRight)){
            request.getRequestDispatcher("login-error.jsp").forward(request,response);
        }

    }

}
