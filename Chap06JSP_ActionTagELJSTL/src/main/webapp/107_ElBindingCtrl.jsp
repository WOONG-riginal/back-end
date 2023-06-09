<!-- 
	EL 이용 => request, session, application 내장객체에 바인딩 된 속성값을 직접 접근하여 출력 가능
	
	각 Scope 저장 공간
	 a. pageScope = JSPContext
	 b. requestScope = ServletRequest
	 c. sessionScope = HttpSession
	 d. applicationScope = ServletContext
 -->
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
	<link rel="stylesheet" href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
	<title>바인딩 포워딩 데이터 처리</title>
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
				<td><%=request.getAttribute("id") %></td>
				<td><%=request.getAttribute("pw") %></td>
				<td><%=session.getAttribute("name") %></td>
				<td><%=application.getAttribute("email") %></td>
			</tr>
			<tr>
				<td>${id }</td>
				<td>${pw }</td>
				<td>${name }</td>
				<td>${email }</td>
			</tr>
			<tr>
				<td>${requestScope.id }</td>
				<td>${requestScope.pw }</td>
				<td>${sessionScope.name }</td>
				<td>${applicationScope.email }</td>
			</tr>
		</table>
	</div>
</body>
</html>