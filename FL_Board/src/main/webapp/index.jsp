<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Floatleft</title>
	<link rel="stylesheet" href="assets/css/main.css" />
	<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
</head>
<body class="is-preload">
	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Header -->
		<header id="header">
			<div class="logo">
				<span class="icon fa-gem"></span>
			</div>
			<div class="content">
				<div class="inner">
					<h1>Float Left</h1>
					<p>[스마트웹&콘텐츠개발] 풀스택자바웹개발자(프론트엔드&백엔드) <br />
					CRUD 게시판 프로젝트2-모델2 버전</p>
				</div>
			</div>
			<c:set var="name" value="${name }" />
				<c:if test="${empty name }">
				<nav>
					<ul>
						<li><a href="./login.jsp">로그인</a></li>
						<li><a href="GetBoardListCtrl">글목록</a></li>
						<li><a href="./addBoard.jsp">글쓰기</a></li>
					</ul>
				</nav>
				</c:if>
				<c:if test="${not empty name }">
      					<nav>
					<ul>
						<li><a href="LogoutCtrl">로그아웃</a></li>
						<li><a href="GetBoardListCtrl">글목록</a></li>
						<li><a href="./addBoard.jsp">글쓰기</a></li>
					</ul>
				</nav>
	            </c:if>
		</header>
		<!-- Footer -->
		<footer id="footer">
			<p class="copyright">&copy; 플롯레프트 프로젝트 <a href="https://qkrrnf321.cafe24.com/900_portfolio_teamHyundai/">현대자동차 클론코딩</a>.</p>
		</footer>
	</div>

	<!-- BG -->
	<div id="bg"></div>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
</body>
</html>