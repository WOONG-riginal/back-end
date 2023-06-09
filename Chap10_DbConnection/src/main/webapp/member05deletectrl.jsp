<%@page import="vo.MemberVO"%>
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
	<title>회원정보 삭제 처리 페이지</title>
</head>
<body>
	<jsp:useBean id="mbean" class="vo.MemberVO">
		<jsp:setProperty name="mbean" property="*" />
	</jsp:useBean>
<%
	MemberDAO mdao=new MemberDAO();
	String pass=mdao.getPass(mbean.getId());
	if(mbean.getPwd().equals(pass)){
		// 회원정보 삭제 메서드 호출
		mdao.deleteMember(mbean.getId());	
		response.sendRedirect("member02list.jsp");
	}else{
%>
	<script>
		alert('비밀번호 다시 입력!');
		history.go(-1); // 이전 단계로 돌아가기
	</script>
<%			
	}
%>
</body>
</html>