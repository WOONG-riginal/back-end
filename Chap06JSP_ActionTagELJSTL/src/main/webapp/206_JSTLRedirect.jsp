<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JSTL Redirect</title>
	<link rel="stylesheet" href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">	
</head>
<body>
	<div class="card-body">
		<h2>Redirect = 서블릿 sendRedirect와 동일 = 파라미터값 넘겨줄 수 있음</h2>
		<c:redirect url="./206_JSTLRedirect2.jsp">
			<c:param name="param1" value="Ezen"/>
			<c:param name="param2" value="Computer"/>
		</c:redirect>
	</div>
</body>
</html>