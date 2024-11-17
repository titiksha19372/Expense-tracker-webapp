<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User's Page</title>
    <%@ include file="../componet/all_css.jsp" %>
</head>
<body>
    <%@ include file="../componet/navbar.jsp" %>
    
    <div class="container mt-5">
        <div class="row">
        <c:if test="${not empty msg}">
                    <p class="text-center text-success fs-4">${msg}</p>
                    <c:remove var="msg" />
                </c:if>
            <div class="col text-center">
                <h2>Download Expenses CSV</h2>
                <form action="../generateCSV" method="GET">
                    <button type="submit" class="btn btn-primary">Download CSV</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
