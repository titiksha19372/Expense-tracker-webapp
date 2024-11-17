<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.entity.User"%>
<%@ page import="com.dao.ExpenseDao"%>
<%@ page import="com.db.HibernateUtil"%>
<%@ page import="com.entity.Expense"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User's Page</title>
    <%@ include file="../componet/all_css.jsp" %>
</head>
<body>
    <%@ include file="../componet/navbar.jsp" %>
    <div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
        <!-- Carousel items... -->
    </div>
    
    <!-- Welcome Card -->
    <div class="container mt-5">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Welcome, User!</h5>
                <p class="card-text">You are logged in.</p>
            </div>
        </div>
    </div>

    <!-- Expenses Table Card -->
    <div class="container mt-5">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Expenses</h5>
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">Title</th>
                            <th scope="col">Description</th>
                            <th scope="col">Date</th>
                            <th scope="col">Time</th>
                            <th scope="col">Price</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            User user = (User) session.getAttribute("loginUser");
                            if (user != null) {
                                String sortOrder = request.getParameter("sortOrder");
                                if (sortOrder == null || (!sortOrder.equals("asc") && !sortOrder.equals("desc"))) {
                                    sortOrder = "asc";
                                }
                                ExpenseDao dao = new ExpenseDao(HibernateUtil.getSessionFactory());
                                List<Expense> list = dao.getAllExpensesByUserSortedByDate(user, sortOrder);
                                double totalExpense = 0.0;
                                for (Expense ex : list) {
                                    totalExpense += ex.getPrice();
                        %>
                        <tr>
                            <td><%= ex.getTitle() %></td>
                            <td><%= ex.getDescription() %></td>
                            <td><%= ex.getDate() %></td>
                            <td><%= ex.getTime() %></td>
                            <td><%= ex.getPrice() %></td>
                        </tr>
                        <% } %>
                        <tr>
                            <td colspan="4" class="text-end">Total:</td>
                            <td><%= totalExpense %></td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
