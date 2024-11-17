<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Expense Tracker</title>
    <%@ include file="../componet/all_css.jsp"%>
</head>
<body>
<c:if test="${empty loginUser}">
    <c:redirect url="../login.jsp"></c:redirect>
</c:if>
<%@ include file="../componet/navbar.jsp"%>
<div class="container">
    <div class="row mt-4">
        <div class="col-md-6 offset-md-3">
            <div class="card">
                <div class="card-header text-center">
                    <p class="fs-3">Expense Splitter</p>
                </div>
                <div class="card-body">
                    <c:if test="${not empty param.totalExpense and not empty param.numParticipants}">
                        <h2 class="mt-4 text-center">Expense Split Result</h2>
                        <table class="table table-bordered mt-2">
                            <thead>
                                <tr>
                                    <th>Participant</th>
                                    <th>Share</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:set var="totalExpense" value="${param.totalExpense}" />
                                <c:set var="numParticipants" value="${param.numParticipants}" />
                                <c:forEach var="i" begin="1" end="${numParticipants}">
                                    <tr>
                                        <td>Participant ${i}</td>
                                        <td>${totalExpense / numParticipants}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:if>
                    <form action="" method="post">
                        <div class="mb-3">
                            <label for="totalExpense">Total Expense:</label>
                            <input type="text" id="totalExpense" name="totalExpense" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label for="numParticipants">Number of Participants:</label>
                            <input type="number" id="numParticipants" name="numParticipants" class="form-control" required>
                        </div>
                        <button type="submit" class="btn btn-primary col-md-12">Split Expense</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
