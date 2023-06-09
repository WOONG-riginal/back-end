<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 한글처리
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
%>
	<jsp:useBean id="mbean" class="vo.MemberVO" scope="page"/>
<%
	// 폼에서 넘기는 값 받기
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	String name=request.getParameter("name");
	String email=request.getParameter("email");
	
	// 표현식 사용 setter
	mbean.setId(id);
	mbean.setPwd(pwd);
	mbean.setName(name);
	mbean.setEmail(email);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 폼 처리 JSP</title>
</head>
<body>
	<!-- 표현식 사용 브라우저 출력 -->
	ID : <%=mbean.getId()%><br>
	비밀번호 : <%=mbean.getPwd()%><br>
	이름 : <%=mbean.getName()%><br>
	이메일 : <%=mbean.getEmail()%><br>
</body>
</html>