<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 한글처리
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	// 데이터 폼
	int score=Integer.parseInt(request.getParameter("score"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 처리 페이지</title>
</head>
<body>
	<h1>시험점수 : <%=score %>점</h1>
	
<%
	if(score>=90){
%>
		<h2>A학점</h2>
		
<%
	}else if(score>=80){
	
%>
		<h2>B학점</h2>
<%
	}else if(score>=70){
	
%>
		<h2>C학점</h2>
<%
	}else if(score>=60){
	
%>
		<h2>D학점</h2>		
<%		
	}else{
%>
		<h2>F학점</h2>
<%
	}
%>
	<a href="12_scoreif.jsp">점수입력</a>
</body>
</html>