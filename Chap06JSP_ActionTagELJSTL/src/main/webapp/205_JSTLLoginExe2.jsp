<!-- 
	작업지시사항.
	1. JSTL을 이용하여 로그인 데이터 처리
	2. (기능)
	  a. id값을 입력 안했을 때 -> 아이디를 입력해주세요 출력페이지 => null 처리
	                           -> 아이디 입력 링크(클릭 시 로그인 화면으로 이동)
	  b. id명 admin으로 로그인 했을 때 -> 관리자 페이지로 이동 => Admin님 환영합니다.
	  c. id명 아무거나 로그인 했을 때 -> 일반 페이지로 이동 => ??? 님 환영합니다.
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL 연습</title>
</head>
<body>
	<c:if test="${empty param.id }">
		<h1>아이디를 입력하세요</h1>
		<a href="./205_JSTLLoginExe.jsp">로그인</a>
	</c:if>
	<c:if test="${!empty param.id }">
		<c:if test="${param.id=='admin' }" >
			<h1>관리자 로그인</h1>
		</c:if>
		<c:if test="${param.id!='admin' }" >
			<h1>일반 페이지</h1>
			<p>${param.id}님 환영합니다</p>
		</c:if>
	</c:if>
</body>
</html>