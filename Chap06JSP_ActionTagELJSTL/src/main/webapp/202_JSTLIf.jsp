<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
%>
<c:set var="id" value="mc" />
<c:set var="pw" value="1111" />
<c:set var="name" value="${'김명철' }" />
<c:set var="age" value="${43 }" />
<c:set var="tall" value="${173 }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL if문</title>
<link rel="stylesheet" href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
</head>
<body>
	<c:if test="${true }">
		<h2>항상 true</h2>
	</c:if>
	<!-- 비교연산자 -->
	<c:if test="${11==11 }">
		<h2>두 값은 같으므로 true</h2>
	</c:if>
	<c:if test="${30!=31 }">
		<h2>두 값은 같지 않으므로 true</h2>
	</c:if>
	<!-- 논리연산자 -->
	<c:if test="${(id=='mc')&&(name=='김명철') }">
		<h2>아이디: ${id }, 이름: ${name }</h2>
	</c:if>
	
	<c:if test="${age==43 }">
		<h2>이름 : ${name }, 나이 : ${age }</h2>
	</c:if>
	
	<c:if test="${tall>170 }">
		<h2>${name }님 키가 크시네요</h2>
	</c:if>
</body>
</html>