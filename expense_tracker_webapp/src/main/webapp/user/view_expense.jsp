<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.entity.User"%>
<%@ page import="com.dao.ExpenseDao"%>
<%@ page import="com.db.HibernateUtil"%>
<%@ page import="com.entity.Expense"%>
<%@ page import="java.util.List"%>
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
		<c:redirect url="../login.jsp" />
	</c:if>
	<%@ include file="../componet/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-8 offset-md-2">
				<div class="card">
					<div class="card-header text-center">
						<p class="fs-3">All Expense</p>
						<c:if test="${not empty msg}">
							<p class="text-center text-success fs-4">${msg}</p>
							<c:remove var="msg" />
						</c:if>
						<form action="" method="post"
							class="form-inline justify-content-end mb-2">
							<label for="sortOrder" class="me-2">Sort Order:</label> <select
								name="sortOrder" id="sortOrder"
								class="form-select form-select-sm">
								<option value="asc">Ascending</option>
								<option value="desc">Descending</option>
							</select>
							<button type="submit" class="btn btn-sm btn-primary ms-2">Sort</button>
						</form>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Title</th>
									<th scope="col">Description</th>
									<th scope="col">Date</th>
									<th scope="col">Time</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
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
									<td><a href="edit_expense.jsp?id=<%=ex.getId() %>"
										class="btn btn-sm btn-primary me-1">Edit</a> <a
										href="../deleteExpense?id=<%=ex.getId() %>"
										class="btn btn-sm btn-danger me-1">Delete</a></td>

								</tr>
								<% } %>
								<tr>
									<td colspan="4" class="text-end">Total:</td>
									<td><%= totalExpense %></td>
									<td></td>
								</tr>
								<% } %>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
