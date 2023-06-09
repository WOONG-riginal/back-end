<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	String name=request.getParameter("name");
	String imgName=request.getParameter("imgName");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>인클루드 될 페이지</title>
</head>
<body>
	<h1>사진의 종류는 <%=name %></h1>
	<img src="./images/<%=imgName %>" alt="<%=imgName %>" />
</body>
</html>