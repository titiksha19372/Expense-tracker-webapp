<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Expense</title>
    <%@ include file="../componet/all_css.jsp"%>
</head>
<body>
<c:if test="${empty loginUser}">
    <c:redirect url="../login.jsp"></c:redirect>
</c:if>
<%@ include file="../componet/navbar.jsp"%>
<div class="container">
    <div class="row">
        <div class="col-md-4 offset-md-4">
            <div class="card">
                <div class="card-header text-center">
                    <p class="fs-3">Add Expense</p>
                </div>
                <c:if test="${not empty msg}">
                    <p class="text-center text-success fs-4">${msg}</p>
                    <c:remove var="msg" />
                </c:if>
                <div class="card-body">
                    <form action="../saveExpense" method="post">
                        <div class="mb-3">
                            <label for="title">Title</label>
                            <input type="text" id="title" name="title" >
                        </div>
                        <div class="mb-3">
                            <label for="date">Date</label>
                            <input type="date" id="date" name="date" >
                        </div>
                        <div class="mb-3">
                            <label for="time">Time</label>
                            <input type="time" id="time" name="time" >
                        </div>
                        <div class="mb-3">
                            <label for="description">Description</label>
                            <input type="text" id="description" name="description" >
                        </div>
                        <div class="mb-3">
                            <label for="price">Cost</label>
                            <input type="text" id="price" name="price" >
                        </div>
                        <button type="submit" class="btn btn-success col-md-12">Add Expense</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
