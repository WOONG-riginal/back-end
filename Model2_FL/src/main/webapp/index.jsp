<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Float Left</title>
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link rel="preconnect" href="https://fonts.gstatic.com" />
        <link href="https://fonts.googleapis.com/css2?family=Tinos:ital,wght@0,400;0,700;1,400;1,700&amp;display=swap" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css2?family=DM+Sans:ital,wght@0,400;0,500;0,700;1,400;1,500;1,700&amp;display=swap" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="./css/styles.css" rel="stylesheet" />
    </head>
    <body>
        <!-- Background Video-->
        <video class="bg-video" playsinline="playsinline" autoplay="autoplay" muted="muted" loop="loop"><source src="assets/mp4/bg.mp4" type="video/mp4" /></video>
        <!-- Masthead-->
        <div class="masthead">
            <div class="masthead-content text-white">
                <div class="container-fluid px-4 px-lg-0">
                    <h1 class="fst-italic lh-1 mb-4">Join and Board</h1>
                    &nbsp;&nbsp;&nbsp;&nbsp;<p class="mb-5">Floatleft</p>
                </div>
            </div>
        </div>
        <!-- Social Icons-->
        <div class="social-icons">
            <div class="d-flex flex-row flex-lg-column justify-content-center align-items-center h-100 mt-3 mt-lg-0">
    		<!-- 세션에 할당 JSTL로 변수 선언 -->
            <c:set var="id" value="${id }" scope="session" />
            <c:set var="nickname" value="${nickname }" scope="session" />
            <c:set var="role" value="${role }" scope="session" />
            <!-- 세션이 없으면 -->
			<c:if test="${empty nickname }">
                <a class="btn btn-dark m-3" href="login.jsp">Login</a>
                <a class="btn btn-dark m-3" href="GetBoardListCtrl">List</a>
                <a class="btn btn-dark m-3" href="./addBoard.jsp">Write</a>
            </c:if>
            <!-- 세션이 있으면 -->
			<c:if test="${not empty nickname }">
                <a class="btn btn-dark m-3" href="LogoutCtrl">Logout</a>
                <a class="btn btn-dark m-3" href="GetBoardListCtrl">List</a>
                <a class="btn btn-dark m-3" href="./addBoard.jsp">Write</a>
            </c:if>
            <c:if test="${role=='Admin' }">
                <a class="btn btn-dark m-3" href="GetUserList">Members</a>
            </c:if>
            </div>
        </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    </body>
</html>