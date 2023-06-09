<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${empty name }">
	<c:redirect url="login.jsp" />
</c:if>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Floatleft 글목록</title>
	<link rel="stylesheet" href="assets/css/main.css" />
	<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
	<style>
		h3 {
			text-align : center;
		}
	</style>
</head>
<body class="is-preload">
	<div id="wrapper">
		<aside>
			${name }님 접속중!! &nbsp;&nbsp;&nbsp;&nbsp;
			<a href="LogoutCtrl" class="button small">로그아웃</a>
		</aside>
		<br>
		<header>
			<h3>글목록 보기</h3>
		</header>
		<div class="table-wrapper">
			<table>
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>등록일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<c:forEach var="board" items="${boardList }" varStatus="status">
					<tbody>
						<tr>
							<td>${board.seq }</td>
							<td><a href="GetBoardCtrl?num=${board.seq }">${board.title }</a></td>
							<td>${board.nickname }</td>
							<td>${board.regdate }</td>
							<td>${board.cnt }</td>
						</tr>
					</tbody>
				</c:forEach>
			</table>
			<br>
			<h3>
				<a href="addBoard.jsp" class="button small">
				글등록</a>
			</h3>
		</div>
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