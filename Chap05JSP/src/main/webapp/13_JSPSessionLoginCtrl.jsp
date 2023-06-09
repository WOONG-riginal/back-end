<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 처리 페이지</title>
</head>
<body>
<%
	// 한글처리
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	// 폼 데이터
	String id=request.getParameter("id");
	String pw=request.getParameter("pw");
	// session 값 할당
	session.setAttribute("session_id", id);
	session.setAttribute("session_pw", pw);
	// 세션의 유지시간 설정
	session.setMaxInactiveInterval(60);
%>
	<h2>당신의 id는 <%=id %>이고</h2>
	<p>당신의 비밀번호는 <%=pw %>입니다.</p>
	
	<a href="13_JSPSessionLoginCtrl2.jsp">다음페이지로 이동</a>
</body>
</html>