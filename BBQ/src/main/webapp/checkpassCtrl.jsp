<%@page import="biz.member.bbqMemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	
	String id = (String)session.getAttribute("id");
	String password=request.getParameter("pw");
	
	bbqMemberDAO mdao=new bbqMemberDAO();
	String pwchk=mdao.checkPass(id);
	
	if(password.equals(pwchk)){
%>
	<script>
		opener.location.href='index.jsp?content=editpage.jsp';
		self.close();
	</script>
<%
	}else{
%>
	<script>
		alert('비밀번호가 올바르지 않습니다.');
		history.back();
	</script>
<%	
	}
%>
