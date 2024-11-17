<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Expense Summary</title>
    <%@ include file="../componet/all_css.jsp"%>
</head>
<body>
    <c:if test="${empty loginUser}">
        <c:redirect url="../login.jsp"></c:redirect>
    </c:if>
    <%@ include file="../componet/navbar.jsp"%>
    <div class="container">
        <div class="row">
            <div class="col-md-8 offset-md-2">
                <div class="card">
                    <div class="card-header text-center">
                        <h1>Expense Summary</h1>
                    </div>
                    <div class="card-body">
                        <p>Today's Expenses Total: ${todaysExpensesTotal}</p>
                        <p>Yesterday's Total Expense: ${yesterdaysTotalExpense}</p>
                        <p>Monthly Expenses: ${monthlyExpenses}</p>
                        <p>Total Expenses: ${totalExpenses}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
