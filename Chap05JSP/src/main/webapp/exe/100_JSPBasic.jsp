<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JSP 기초연습</title>
</head>
<body>
	<h1>JSP</h1>
	<p>Hello JSP</p>
	<p>스크립틀릿 => 내부 자바 코드 코딩</p>
<%
	out.print("<h2>Hello JSP</h2>");
	out.print("<p>JSP로 작성한 파일</p>");
%>
	<p>HTML 코드 작성</p>
<% 
	out.print("스크립틀릿 이어쓰기");
%>
</body>
</html>