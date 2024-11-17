<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Expense Tracker</title>
    <%@ include file="componet/all_css.jsp"%>
    <style type="text/css">
        .card-sh {
            box-shadow: 0 0 6px 0 rgb(0, 0, 0.3);
        }
    </style>
</head>
<body class="bg-light">
    <%@ include file="componet/navbar.jsp"%>
    <div class="container p-5">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <div class="card card-sh">
                    <div class="card-header">
                        <p class="text-center fs-t">Register Page</p>
                        <c:if test="${not empty msg}">
                            <p>${msg}</p>
                            <c:remove var="msg" />
                        </c:if>
                    </div>
                    <div class="card-body">
                        <form action="userRegister" method="post">
                            <div class="mb-3">
                                <label>Enter Full Name</label>
                                <input type="text" name="Fullname" class="form-control">
                            </div>
                            <div class="mb-3">
                                <label>Enter Email</label>
                                <input type="text" name="Email" class="form-control">
                            </div>
                            <div class="mb-3">
                                <label>Enter Password</label>
                                <input type="text" name="Password" class="form-control">
                            </div>
                            <div class="mb-3">
                                <label>About</label>
                                <input type="text" name="About" class="form-control">
                            </div>
                            <button type="submit" class="btn btn-success col-md-12">Register</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
