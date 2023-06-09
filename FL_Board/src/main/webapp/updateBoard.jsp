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
	<title>Floatleft 글쓰기</title>
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
		<br />
			<h3>글 수정</h3>
		<article>
			<form action="UpdateBoardCtrl" method="post">
				<!-- hidden -->
				<input type="hidden" name="seq" value="${board.seq }"/>
				<table class="table table-bordered">
					<tr>
						<td>제목</td>
						<td>
							<input type="text" name="title" class="form-control" value="${board.title }">
						</td>
					</tr>
					<tr>
						<td>작성자</td>
						<td>
							${board.nickname }
						</td>
					</tr>
					<tr>
						<td>내용</td>
						<td>
							<textarea name="content" cols="40" rows="10" class="form-control">${board.content }</textarea>
						</td>
					</tr>
					<tr>
						<td>등록일</td>
						<td>
							${board.regdate }
						</td>
					</tr>
					<tr>
						<td>조횟수</td>
						<td>
							${board.cnt }
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="수정하기">
						</td>
					</tr>
				</table>
			</form>
			<h3>
				<a href="GetBoardListCtrl">글목록으로</a>
			</h3>
		</article>
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