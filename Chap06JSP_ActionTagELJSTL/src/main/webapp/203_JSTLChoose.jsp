<!-- 
	[형식]
	c:choose
		c:when test="조건식1" [내용1] /c:when
		c:when test="조건식2" [내용2] /c:when
	/c:choose
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
%>
<c:set var="id" value="mc" />
<c:set var="pw" value="1111" />
<c:set var="name" value="" />
<c:set var="age" value="${33 }" />
<c:set var="tall" value="${174 }" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JSTL choose 태그</title>
	<link rel="stylesheet" href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
	<style>
		#wrap{
			width: 80%;
			margin: 20px auto;
		}
		table,tr,td,th{
			border: 1px solid #ccc;
		}
		td,th{
			padding: 10px;
		}
	</style>
</head>
<body>
	<div id="wrap" class="card-body">
		<h1>회원관리 화면</h1>
		<table class="table">
			<tr>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>이름</th>
				<th>나이</th>
				<th>신장</th>
			</tr>
			<c:choose>
				<c:when test="${empty name }"> <!-- null 체크 -->
					<h2>이름을 입력하세요</h2>
				</c:when>
				<c:otherwise>
					<td>${id }</td>
					<td>${pw }</td>
					<td>${name }</td>
					<td>${age }</td>
					<td>${tall }</td>
				</c:otherwise>
			</c:choose>
		</table>
	</div>
</body>
</html>