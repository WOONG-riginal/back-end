<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결과</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	int num=Integer.valueOf(request.getParameter("num"));
	
	int todayNum=(int)Math.ceil((Math.random()*num));
	String todayMenu=request.getParameter("menu"+todayNum);
%>
	<h1>오늘의 메뉴는 <%=todayMenu %>!!</h1>
</body>
</html>