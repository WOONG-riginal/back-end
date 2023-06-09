<%@page import="biz.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입 처리 페이지</title>
</head>
<body>
	<jsp:useBean id="mbean" class="vo.MemberVO">
		<jsp:setProperty name="mbean" property="*"/>
	</jsp:useBean>
<%
	MemberDAO mdao=new MemberDAO();
	mdao.insertMember(mbean);
%>
	<script>
		alert("회원가입완료");
		location.href='./member02list.jsp'
	</script>
</body>
</html>