package com.servlet;

import java.io.IOException;

import com.dao.UserDao;
import com.db.HibernateUtil;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("Email");
        String password = req.getParameter("Password");

        UserDao dao = new UserDao(HibernateUtil.getSessionFactory());
        User u = dao.login(email, password);
        //System.out.println(u);
        HttpSession session = req.getSession(); // Getting the session object
        if(u == null) {
            session.setAttribute("msg", "Invalid Email or Password"); 
            resp.sendRedirect("login.jsp");// Setting attribute in session
        }else {
        	session.setAttribute("loginUser",u);
        	resp.sendRedirect("user/home.jsp");
        }
    }
}
