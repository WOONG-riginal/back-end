<!-- 
	JSP 표준 태그 라이브러리(JSTL)
	: 커스텀 태그 중 가장 많이 사용하는 태그를 표준화하여 라이브러리로 제공하는 것
	  JSP 2.0 규약부터 추가되어 톰캣에서는 기본적으로 제공하지 않음
	  따라서 lib에 JSTL jar파일을 다운로드하여 사용해야 함
	  
	자바의 기능을 태그로 대체가 가능하다는 개념
	사용하려면 JSP페이지 상단에 taglib 태그에 추가하여 톰캣에 알려줘야 함
	
	여러가지 JSTL 태그 종류
	 a. 라이브러리 코어 = 변수지원, 제어문, 반복문 처리, URL 처리 등의 기능 | 접두어 c(Core)를 가장 많이 사용
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!-- JSTL 사용을 위해 반드시 선언한 후 코딩해야 함 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
%>
<!-- 변수선언 c:set var="변수이름" value="변수" scope="적용범위" -->
<c:set var="id" value="kim" scope="page" />
<c:set var="pw" value="1111" />
<c:set var="name" value="김명철" />
<c:set var="age" value="${32 }" />
<c:set var="email" value="indopop@naver.com" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JSTL Core</title>
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
				<th>이메일</th>
			</tr>
			<tr>
				<td>${id }</td>
				<td>${pw }</td>
				<td>${name }</td>
				<td>${age }</td>
				<td>${email }</td>
			</tr>
		</table>
	</div>
</body>
</html>