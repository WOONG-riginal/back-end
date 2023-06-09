<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 접두어 fmt -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JSTL Format TimeZone | 각 도시 기준시</title>
	<link rel="stylesheet" href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="card-body">
		<h2>Time Zone</h2>
		<!-- 오늘의 시간 정보 -->
		<c:set var="today" value="<%=new Date() %>"/>
		
		서울 : 
		<fmt:timeZone value="Asia/Seoul">
			<fmt:formatDate value="${today }" pattern="YYYY/MM/dd EEEE a HH:mm:ss"/><br><br>
		</fmt:timeZone>
		뉴욕 : 
		<fmt:timeZone value="America/New_York">
			<fmt:formatDate value="${today }" pattern="YYYY/MM/dd EEEE a HH:mm:ss"/><br><br>
		</fmt:timeZone>
		런던 : 
		<fmt:timeZone value="Europe/London">
			<fmt:formatDate value="${today }" pattern="YYYY/MM/dd EEEE a HH:mm:ss"/><br><br>
		</fmt:timeZone>
		
		<!-- TimeZone 기준 변경 = 설정 이후 그 도시의 시간대로 표시 -->
		<h2>setTimeZone</h2>
		<!-- 뉴욕 기준으로 변경 -->
		<fmt:setTimeZone value="America/New_York"/>
		뉴욕 기준시 : <fmt:formatDate value="${today }" pattern="YYYY/MM/dd EEEE a HH:mm:ss"/><br><br>
		
	</div>
</body>
</html>