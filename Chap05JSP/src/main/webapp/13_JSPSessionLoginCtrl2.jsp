<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>세션데이터 확인</title>
</head>
<body>
<%
	// 한글처리
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	// 세션 값 가져와서 id, pw에 할당
	String id=(String)session.getAttribute("session_id");
	String pw=(String)session.getAttribute("session_pw");
%>
	<h2>세션 데이터 출력</h2>
	<p>아이디 : <%=id %></p>
	<p>비밀번호 : <%=pw %></p>
</body>
</html>