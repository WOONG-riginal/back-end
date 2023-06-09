<%@page import="biz.member.bbqMemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 확인</title>
<link rel="stylesheet" href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
<!-- 기본 코딩 JS 파일 -->
<script src="./js/jquery-1.12.4.min.js"></script>
<script src="./js/jquery-3.3.1.min.js"></script>
<script src="./js/jquery-3.4.1.min.js"></script>
<script src="./js/prefixfree.min.js"></script>
<!-- 기본 코딩 CSS 파일 -->
<link rel="stylesheet" href="./css/reset.css">
<link rel="stylesheet" href="./css/font.css">
<link rel="stylesheet" href="./css/css.css">
</head>
<body>
<section class="passform">
	<h2>비밀번호 확인</h2>
	<form action="checkpassCtrl.jsp" method="post" class="login">
		<ul>
			<li>
				<p>비밀번호 확인</p>
				<input type="password" class="form-control" name="pw" id="pw" placeholder="비밀번호를 입력하세요." style="width:400px; height:40px" required>
			</li>
			<li>	
				<input type="submit" value="확인" class="btn" style="width:80px; height:40px">
			</li>
		</ul>
	</form>
</section> 
</body>
</html>