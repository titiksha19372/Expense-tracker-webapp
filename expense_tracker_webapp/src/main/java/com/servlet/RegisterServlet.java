package com.servlet;
import java.io.IOException;

import org.hibernate.Hibernate;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.dao.UserDao;
import com.db.HibernateUtil;
import com.entity.User;

@WebServlet("/userRegister")
public class RegisterServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String fullname = req.getParameter("Fullname");
		String email = req.getParameter("Email");
		String password = req.getParameter("Password");
		String about = req.getParameter("About");

		User u = new User(fullname, email, password, about);

		//System.out.println(u);
	    UserDao dao = new UserDao (HibernateUtil.getSessionFactory());
	    boolean f=dao.saveuser(u);
	    
	    HttpSession session = req.getSession();
	    if (f) {
	        session.setAttribute("msg", "Register sucessfully");
	        resp.sendRedirect("register.jsp");
	        // System.out.println("Register sucessfully");
	    } else {
	        session.setAttribute("msg", "Something wrong on server");
	        //System.out.println("Something wrong on server");
	    }
	}
}
	    
	   /* if (f) {
	        System.out.println("Register sucessfully");
	    } else {
	        System.out.println("Something wrong on server");
	    }
	}*/
