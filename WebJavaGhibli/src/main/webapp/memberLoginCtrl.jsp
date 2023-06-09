<%@page import="biz.GhibliRentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인 처리 화면</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String id=request.getParameter("id");
	String pw=request.getParameter("pw");
	
	// DAO
	GhibliRentDAO gdao=new GhibliRentDAO();
	int result=gdao.getMember(id,pw);
	if(result==0){
%>
<script>
	alert('아이디와 비밀번호를 확인하세요.');
	location.href="index.jsp?content=login.jsp";
</script>
<%
	}else{
		session.setAttribute("id", id);
		response.sendRedirect("index.jsp");
	}
%>
</body>
</html>