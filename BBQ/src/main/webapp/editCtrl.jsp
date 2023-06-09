<%@page import="biz.member.bbqMemberDAO"%>
<%@page import="biz.member.bbqMemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	
	// 로그인 확인
	String id = (String)session.getAttribute("id");
	if(id==null){
%>
		<script>
			alert('로그인 해주세요.');
			location.href='index.jsp';
		</script>
<%	
	}
	String name = request.getParameter("name");
	String birth = request.getParameter("birth");
	String tel = request.getParameter("tel");
	String email = request.getParameter("email");
	String address = request.getParameter("address");
	
	bbqMemberVO mbean = new bbqMemberVO();
	mbean.setId(id);
	mbean.setBirth(birth);
	mbean.setEmail(email);
	mbean.setAddress(address);
	mbean.setTel(tel);
	bbqMemberDAO mdao = new bbqMemberDAO();
	int c = mdao.editMember(mbean);
	if(c!=0){
%>
		<script>
			alert('정보 변경 성공');
			location.href='index.jsp?content=mypage.jsp';
		</script>
<%					
	}else {
%>
		<script>
			alert('정보 변경 실패');
			location.href='index.jsp?content=editpage.jsp';
		</script>
<%	
	}
	
%>