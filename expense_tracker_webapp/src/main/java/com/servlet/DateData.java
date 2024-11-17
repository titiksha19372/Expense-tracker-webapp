package com.servlet;

import com.dao.ExpenseDao;
import com.entity.User;
import com.db.HibernateUtil;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/dateData") // Change the URL pattern to /dateData
public class DateData extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the user from the session or wherever it's stored
        User user = (User) request.getSession().getAttribute("user");
        // Get the ExpenseDao instance
        ExpenseDao expenseDao = new ExpenseDao(HibernateUtil.getSessionFactory());

        // Get the required expense totals
        double todaysExpensesTotal = expenseDao.getTodayExpensesTotal(user);
        double yesterdaysTotalExpense = expenseDao.getYesterdayTotalExpense(user);
        double monthlyExpenses = expenseDao.getMonthlyExpenses(user);
        double totalExpenses = expenseDao.getTotalExpenses(user);

        // Set these attributes in the request scope
        request.setAttribute("todaysExpensesTotal", todaysExpensesTotal);
        request.setAttribute("yesterdaysTotalExpense", yesterdaysTotalExpense);
        request.setAttribute("monthlyExpenses", monthlyExpenses);
        request.setAttribute("totalExpenses", totalExpenses);

        // Forward the request to the home.jsp page
        RequestDispatcher dispatcher = request.getRequestDispatcher("../user/home.jsp");
        dispatcher.forward(request, response);
    }
}
