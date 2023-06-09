<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 한글처리
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	// 데이터 폼
	String user_id=request.getParameter("user_id");
	String user_pw=request.getParameter("user_pw");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 로그인 결과 출력</title>
</head>
<body>
	<h1>결과출력</h1>
	<p>아이디 : <%=user_id %></p>
	<p>비밀번호 : <%=user_pw %></p>
	<p>======================</p>
	
<%
	if(user_id==null || user_id.length()==0){ // 아이디 값이 없으면
%>
	<p>아이디를 입력하세요.</p>
	<a href="./11_JSPlogin.jsp">Log in</a>
<%
	}else{ // 아이디 값이 있으면
		if(user_id.equals("admin")){ // id가 admin으로 로그인하면
%>
	<h2>관리자로 로그인 하셨습니다.</h2>
<%		
		}else{
%>
	<h2><%=user_id %>님 환영합니다.</h2>
<%
		}
	}
%>
</body>
</html>