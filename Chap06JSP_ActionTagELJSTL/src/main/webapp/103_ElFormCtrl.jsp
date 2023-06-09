<!-- 
	EL 내장객체 
	: JSP에서 기본적으로 내장객체를 제공하지만 JSP내장객체는 표현식%=에서만 사용 가능
	  그래서 EL에서 따로 내장객체들을 제공함
	  => EL에서 제공하는 내장객체들은 \${}안에서만 사용 가능
	
	EL 내장객체 param => getParameter() 이용하지 않고 사용가능
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	String name=request.getParameter("name");
	String email=request.getParameter("email");
%>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
	<title>EL 폼 데이터 받기</title>
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
				</tr>
				<tr>
					<td>${param.id}</td>
					<td>${param.pwd}</td>
					<td>${param.name}</td>
					<td>${param.email}</td>
				</tr>
				<tr>
					<td><%=id %></td>
					<td><%=pwd %></td>
					<td><%=name %></td>
					<td><%=email %></td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>