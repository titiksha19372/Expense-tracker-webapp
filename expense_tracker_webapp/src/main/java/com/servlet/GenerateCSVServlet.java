package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.dao.ExpenseDao;
import com.entity.Expense;
import com.entity.User;
import com.db.HibernateUtil;

@WebServlet("/generateCSV")
public class GenerateCSVServlet extends HttpServlet {
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve user from session or wherever it's stored
        User user = (User) request.getSession().getAttribute("user");

        // Get the ExpenseDao instance
        ExpenseDao expenseDao = new ExpenseDao(HibernateUtil.getSessionFactory());

        // Retrieve expense data
        List<Expense> expenses = expenseDao.getAllExpensesByUser(user);

        // Set response content type
        response.setContentType("text/csv");
        response.setHeader("Content-Disposition", "attachment; filename=\"expenses.csv\"");

        // Get the response output stream
        PrintWriter writer = response.getWriter();

        // Write CSV header
        writer.println("Title,Date,Time,Description,Price");

        // Write expense data to CSV
        for (Expense expense : expenses) {
            writer.println(
                    "\"" + expense.getTitle() + "\"," +
                    "\"" + expense.getDate() + "\"," +
                    "\"" + expense.getTime() + "\"," +
                    "\"" + expense.getDescription() + "\"," +
                    "\"" + expense.getPrice() + "\""
            );
        }

        // Close the writer
        writer.close();
    }
}
