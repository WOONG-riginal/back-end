<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 바인딩 처리 페이지</title>
</head>
<body>
<%
	String name=(String)session.getAttribute("name");
%>
	<h1>바인딩 된 세션 데이터</h1>
	<p>이름은 <%=name %> 입니다.</p>
<%
	session.setAttribute("address", "서울시 성동구");
%>
	<p><a href="./16_JSPBinding2.jsp">바인딩 데이터 추가</a></p>
</body>
</html>