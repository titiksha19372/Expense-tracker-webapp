<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.entity.User"%>
<%@ page import="com.dao.ExpenseDao"%>
<%@ page import="com.db.HibernateUtil"%>
<%@ page import="com.entity.Expense"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Expense</title>
    <%@ include file="../componet/all_css.jsp"%>
</head>
<body>
<c:if test="${empty loginUser}">
    <c:redirect url="../login.jsp"></c:redirect>
</c:if>
<%
    // Get the id parameter from the request
    int id = Integer.parseInt(request.getParameter("id"));
    // Initialize the ExpenseDao object
    ExpenseDao dao = new ExpenseDao(HibernateUtil.getSessionFactory());
    // Retrieve the expense object by id
    Expense ex = dao.getExpenseById(id);
%>
<%@ include file="../componet/navbar.jsp"%>
<div class="container">
    <div class="row">
        <div class="col-md-4 offset-md-4">
            <div class="card">
                <div class="card-header text-center">
                    <p class="fs-3">Edit Expense</p>
                </div>
                <div class="card-body">
                    <form action="../updateExpense" method="post">
                        <input type="hidden" name="id" value="<%= ex.getId() %>">
                        <div class="mb-3">
                            <label for="title">Title</label>
                            <input type="text" id="title" name="title" class="form-control" value="<%= ex.getTitle() %>">
                        </div>
                        <div class="mb-3">
                            <label for="date">Date</label>
                            <input type="date" id="date" name="date" class="form-control" value="<%= ex.getDate() %>">
                        </div>
                        <div class="mb-3">
                            <label for="time">Time</label>
                            <input type="time" id="time" name="time" class="form-control" value="<%= ex.getTime() %>">
                        </div>
                        <div class="mb-3">
                            <label for="description">Description</label>
                            <input type="text" id="description" name="description" class="form-control" value="<%= ex.getDescription() %>">
                        </div>
                        <div class="mb-3">
                            <label for="price">Cost</label>
                            <input type="text" id="price" name="price" class="form-control" value="<%= ex.getPrice() %>">
                        </div>
                        <input type="hidden" name="id" value="<%= ex.getId() %>">
                        <button type="submit" class="btn btn-success col-md-12">Update</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
