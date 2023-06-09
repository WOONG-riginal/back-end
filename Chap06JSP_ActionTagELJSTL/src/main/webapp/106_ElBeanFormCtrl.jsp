<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 한글처리
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
%>
<jsp:useBean id="mbean" class="vo.MemberBean">
	<jsp:setProperty name="mbean" property="*"/> 
</jsp:useBean>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
	<title>EL 자바 빈 처리 페이지</title>
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
				<td>${param.id}</td>
				<td>${param.pw}</td>
				<td>${param.name}</td>
				<td>${param.email}</td>
			</tr>
			<tr>
				<td><%=mbean.getId() %></td>
				<td><%=mbean.getPw() %></td>
				<td><%=mbean.getName() %></td>
				<td><%=mbean.getEmail() %></td>
			</tr>
		</table>
	</div>
</body>
</html>