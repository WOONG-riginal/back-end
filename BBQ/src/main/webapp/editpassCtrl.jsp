<%@page import="biz.member.bbqMemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	
	String id = (String)session.getAttribute("id");
	String password=request.getParameter("password");
	String pwchk=request.getParameter("pwchk");
	
	bbqMemberDAO mdao=new bbqMemberDAO();
	int result=mdao.editPassword(id, password);
	
	if(password.equals(pwchk)){
		if(result!=0){
%>
	<script>
			alert('비밀번호가 변경되었습니다.');
			opener.location.href='index.jsp?content=editpage.jsp';
			self.close();
	</script>
<%
		}
	}else{
%>
	<script>
		alert('비밀번호가 올바르지 않습니다.');
		history.back();
	</script>
<%	
	}
%>
