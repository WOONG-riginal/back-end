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
	<title>JSTL Format Date</title>
	<link rel="stylesheet" href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="card-body">
		<h2>Format Date</h2>
		<h3>tablib에 prefix fmt를 추가해서 사용</h3>
		<c:set var="today" value="<%=new Date() %>"/>
		
		오늘의 날짜 : <fmt:formatDate value="${today }" type="both"/><br>
		오늘의 날짜 : <fmt:formatDate value="${today }" type="date"/><br>
		오늘의 시간 : <fmt:formatDate value="${today }" type="time"/><br><br>
		
		오늘의 날짜 Full : <fmt:formatDate value="${today }" type="date" dateStyle="full"/><br>
		오늘의 날짜 Long : <fmt:formatDate value="${today }" type="date" dateStyle="long"/><br>
		오늘의 날짜 Medium : <fmt:formatDate value="${today }" type="date" dateStyle="medium"/><br>
		오늘의 날짜 Short : <fmt:formatDate value="${today }" type="date" dateStyle="short"/><br><br>
		
		오늘의 시간 Full : <fmt:formatDate value="${today }" type="time" timeStyle="full"/><br>
		오늘의 시간 Long : <fmt:formatDate value="${today }" type="time" timeStyle="long"/><br>
		오늘의 시간 Medium : <fmt:formatDate value="${today }" type="time" timeStyle="medium"/><br>
		오늘의 시간 Short : <fmt:formatDate value="${today }" type="time" timeStyle="short"/><br><br>
		
		<!-- 조합해서 사용 가능 -->
		현재의 날짜 시간 : <fmt:formatDate value="${today }" type="both" dateStyle="full" timeStyle="full"/><br>
		현재의 날짜 시간 : <fmt:formatDate value="${today }" type="both" dateStyle="long" timeStyle="long"/><br>
		현재의 날짜 시간 : <fmt:formatDate value="${today }" type="both" dateStyle="medium" timeStyle="medium"/><br>
		현재의 날짜 시간 : <fmt:formatDate value="${today }" type="both" dateStyle="short" timeStyle="short"/><br><br>
		
		<!-- 패턴 사용 -->
		<!-- 
			YYYY = 년도
			MM = 월
			dd = 일
			HH = 24시간 표시 | hh = 12시간 표시
			SS = 밀리세컨 | ss = 초
			EEEE = 요일
			a = 오전, 오후
		 -->
		Pattern : <fmt:formatDate value="${today }" pattern="YYYY/MM/dd EEEE a HH:mm:ss"/><br>
		Pattern : <fmt:formatDate value="${today }" pattern="YY/M/d E a H:m:s"/><br>
	</div>
</body>
</html>