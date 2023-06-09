<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>포워드 처리 페이지</title>
	<link rel="stylesheet" href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="card-body">
		<div id="wrap">
			<h1>회원관리 화면</h1>
			<table class="table">
				<tr>
					<th>아이디</th>
					<th>비밀번호</th>
					<th>이름</th>
					<th>이메일</th>
					<th>주소</th>
				</tr>
				<tr>
					<td>${param.id}</td>
					<td>${param.pwd}</td>
					<td>${param.name}</td>
					<td>${param.email}</td>
					<td>${requestScope.address}</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>