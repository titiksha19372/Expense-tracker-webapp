package com.servlet;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

public class ExpenseSummaryServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Establish database connection
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            // Code to establish database connection
            
            // Execute query to fetch expense data
            String query = "SELECT todays_expenses, yesterdays_expense, monthly_expenses, total_expenses FROM expenses_table";
            stmt = conn.prepareStatement(query);
            rs = stmt.executeQuery();
            
            // Set data as request attributes
            if (rs.next()) {
                request.setAttribute("todaysExpensesTotal", rs.getDouble("todays_expenses"));
                request.setAttribute("yesterdaysTotalExpense", rs.getDouble("yesterdays_expense"));
                request.setAttribute("monthlyExpenses", rs.getDouble("monthly_expenses"));
                request.setAttribute("totalExpenses", rs.getDouble("total_expenses"));
            }
            
            // Forward request to JSP
            RequestDispatcher dispatcher = request.getRequestDispatcher("expenseSummary.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close resources (connection, statement, resultset)
        }
    }
}
