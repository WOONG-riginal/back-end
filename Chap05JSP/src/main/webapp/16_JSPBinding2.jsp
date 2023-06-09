<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 바인딩 처리 페이지2</title>
</head>
<body>
<%
	String name=(String)session.getAttribute("name");
	String address=(String)session.getAttribute("address");
%>
	<p>이름은 <%=name %> 입니다.</p>
	<p>주소는 <%=address %> 입니다.</p>
</body>
</html>