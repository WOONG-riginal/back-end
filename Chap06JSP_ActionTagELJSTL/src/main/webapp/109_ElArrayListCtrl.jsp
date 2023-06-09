<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
	<title>EL 객체배열 데이터 출력</title>
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
			</tr>
			<tr>
				<td>${memberList[0].id }</td>
				<td>${memberList[0].pw }</td>
				<td>${memberList[0].name }</td>
				<td>${memberList[0].email }</td>
			</tr>
			<tr>
				<td>${memberList[1].id }</td>
				<td>${memberList[1].pw }</td>
				<td>${memberList[1].name }</td>
				<td>${memberList[1].email }</td>
			</tr>
		</table>
	</div>
</body>
</html>