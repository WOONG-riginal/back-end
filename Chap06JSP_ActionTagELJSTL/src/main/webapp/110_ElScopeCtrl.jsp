<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");

	request.setAttribute("address", "서울시 강남구");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>EL Scope 우선순위 포워드 바인딩 처리</title>
	<link rel="stylesheet" href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
	<style>
		#wrap{
			width: 80%;
			margin: 20px auto;
		}
		table,tr,td,th{
			border: 1px solid #ccc;
		}
		td,th{
			padding: 10px;
		}
	</style>
</head>
<body>
	<div id="wrap" class="card-body">
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
				<td>${id }</td>
				<td>${pw }</td>
				<td>${name }</td>
				<td>${email }</td>
				<td>${address }</td>
			</tr>
		</table>
	</div>
</body>
</html>