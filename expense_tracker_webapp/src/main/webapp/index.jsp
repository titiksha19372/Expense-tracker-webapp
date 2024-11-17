<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="com.db.HibernateUtil "%>
<!DOCTYPE html>
<html>
<head>
<title>Expense tracker WebApp</title>
<%@ include file="../componet/all_css.jsp"%>
</head>
<body>

    <%@ include file="../componet/navbar.jsp"%>
    <div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active"
                aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1"
                aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2"
                aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item active" data-bs-interval="10000">
                <img src="img/expenses-1.jpg" class="d-block w-100" alt="..." style="height: 690px; object-fit: cover;">
                <div class="carousel-caption d-none d-md-block">
                    <h5>How about "Track Every Expense, Empower Your Finances"?</h5>
                </div>
            </div>
            <div class="carousel-item" data-bs-interval="2000">
                <img src="img/expenses-2.jpg" class="d-block w-100" alt="..." style="height: 690px; object-fit: cover;">
                <div class="carousel-caption d-none d-md-block">
                    <h5>It's concise, communicates the purpose clearly, and emphasizes the empowerment aspect of managing finances effectively.</h5>
                </div>
            </div>
            <div class="carousel-item">
                <img src="img/expenses-3.jpg" class="d-block w-100" alt="..." style="height: 690px; object-fit: cover;">
                <div class="carousel-caption d-none d-md-block">
                    <h5>Budget Better, Live Brighter</h5>
                </div>
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark"
            data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
                class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark"
            data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span> <span
                class="visually-hidden">Next</span>
        </button>
    </div>
</body>
</html>
