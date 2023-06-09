<%@page import="biz.member.bbqMemberVO"%>
<%@page import="biz.member.bbqMemberDAO"%>
<%@page import="biz.menu.bbqMenuDAO"%>
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
	response.setContentType("text/html;charset=utf-8");
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	// DAO
	bbqMemberDAO mdao = new bbqMemberDAO();
	bbqMemberVO member=new bbqMemberVO();
	int result = mdao.getMember(id, pw);
	
	if(result!=0){
		member=mdao.getMyPage(id);
		session.setAttribute("id", member.getId());
		session.setAttribute("role", member.getRole());
%>
	<script>
		opener.parent.location.reload();
		window.open('about:blank','_self').self.close();
	</script>
<%		
	}else{
%>
	<script>
		alert('아이디 또는 비밀번호가 잘못되었습니다.');
		history.back();
	</script>

<%		
	}
	
%>