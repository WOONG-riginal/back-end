<%@page import="biz.member.bbqMemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	
	String id = (String)session.getAttribute("id");
	
	bbqMemberDAO mdao=new bbqMemberDAO();
	int result=mdao.deleteAddress(id);
	
	if(result!=0){
%>
	<script>
		alert('주소지가 삭제되었습니다.');
		location.href='index.jsp?content=editpage.jsp';
	</script>
<%
	}
%>
