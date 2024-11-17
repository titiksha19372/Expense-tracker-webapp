package com.servlet;

import java.io.IOException;

import com.dao.ExpenseDao;
import com.db.HibernateUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/deleteExpense")
public class DeleteExpenseServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        ExpenseDao dao = new ExpenseDao(HibernateUtil.getSessionFactory());
        boolean f = dao.deleteExpense(id); // Using 'f' instead of 'isDeleted'
        HttpSession session = req.getSession();
        
        if (f) { // Checking if 'f' is true
            session.setAttribute("msg", "Expense deleted successfully");
            resp.sendRedirect("../user/view_expense.jsp");
        } else {
            resp.getWriter().println("Failed to delete expense");
            resp.sendRedirect("../user/view_expense.jsp");
        }
    }

}
