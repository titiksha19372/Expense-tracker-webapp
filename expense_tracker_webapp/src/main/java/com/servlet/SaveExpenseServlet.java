package com.servlet;

import com.entity.User;
import com.dao.ExpenseDao;
import com.db.HibernateUtil;
import com.entity.Expense;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;

@WebServlet("/saveExpense")
public class SaveExpenseServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String title = req.getParameter("title");
        LocalDate date = LocalDate.parse(req.getParameter("date"));
        LocalTime time = LocalTime.parse(req.getParameter("time"));
        String description = req.getParameter("description");
        double price = Double.parseDouble(req.getParameter("price"));
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("loginUser");
        Expense ex = new Expense(title, date, time, description, price, user);
        
        ExpenseDao dao = new ExpenseDao(HibernateUtil.getSessionFactory());
        boolean f = dao.saveExpense(ex);
        if (f) {
            session.setAttribute("msg", "Expense added successfully");
            resp.sendRedirect("user/add_expense.jsp");
        } else {
            session.setAttribute("msg", "Something went wrong on the server");
            resp.sendRedirect("user/add_expense.jsp");
        }
    }
}
