package com.servlet;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;

import com.dao.ExpenseDao;
import com.db.HibernateUtil;
import com.entity.Expense;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/updateExpense")
public class UpdateExpenseServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String title = req.getParameter("title");
        LocalDate date = LocalDate.parse(req.getParameter("date"));
        LocalTime time = LocalTime.parse(req.getParameter("time"));
        String description = req.getParameter("description");
        
        // Convert the String price to double
        double price = Double.parseDouble(req.getParameter("price"));
        
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("loginUser");

        // Retrieve the existing expense from the database
        ExpenseDao dao = new ExpenseDao(HibernateUtil.getSessionFactory());
        Expense existingExpense = dao.getExpenseById(id);

        // Update the properties of the existing expense
        existingExpense.setTitle(title);
        existingExpense.setDate(date);
        existingExpense.setTime(time);
        existingExpense.setDescription(description);
        existingExpense.setPrice(price); // Set the double value

        // Update the expense in the database
        boolean isSuccess = dao.updateExpense(existingExpense);

        if (isSuccess) {
            session.setAttribute("msg", "Expense updated successfully");
            resp.sendRedirect("../user/view_expense.jsp");
        } else {
            session.setAttribute("msg", "Failed to update expense");
            resp.sendRedirect("../user/view_expense.jsp");
        }
    }
}
