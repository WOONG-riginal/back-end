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
	<title>Floatleft 글상세보기</title>
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
		<article>
			<h3>글 상세보기</h3>
			<div class="table-wrapper">
				<table>
					<tr>
						<th>제목</th>
						<td>
							${board.title }
						</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>
							${board.nickname }
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							${board.content }
						</td>
					</tr>
					<tr>
						<th>등록일</th>
						<td>
							${board.regdate }
						</td>
					</tr>
					<tr>
						<th>조횟수</th>
						<td>
							${board.cnt }
						</td>
					</tr>
				</table>
			</div>
		</article>
			<h3>
				<a href="addBoard.jsp">글등록</a>&nbsp;
				<a href="CheckBoardCtrl?num=${board.seq }">글수정</a>&nbsp;
				<a href="DeleteBoardCtrl?num=${board.seq }" onclick="return confirm('삭제하시겠습니까?')">글삭제</a>&nbsp;
				<a href="GetBoardListCtrl">글목록</a>
			</h3>
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