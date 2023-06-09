<!-- 
	ForEach : 가장 많이 사용
	[형식]
	c:ForEach var="변수명" item="반복객체이름" begin="시작값" end="마지막값" step="증가값" varStatus="반복상태"
	/c:ForEach
 -->
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	ArrayList data=new ArrayList();
	data.add("강백호");
	data.add("채치수");
	data.add("정대만");
%>
<%
	pageContext.setAttribute("data", data);
%>
<!-- 변수에 객체배열 할당 -->
<c:set var="list" value="${data }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JSTL ForEach태그</title>
</head>
<body>
	<!-- 반복문 1부터 10까지 1씩 증가하면서 반복 -->
	<c:forEach var="i" begin="1" end="10" step="1" varStatus="loop">
		i=${i } &nbsp;&nbsp;&nbsp;
		반복횟수: ${loop.count } <br>
	</c:forEach>
	<br>
	<!-- 실습1. 1부터 10까지의 합은 ??입니다. -->
	<c:set var="sum" value="0"/>
	<c:forEach var="i" begin="1" end="10" step="1">
		<c:set var="sum" value="${sum+i }"/>
	</c:forEach>
	1부터 10까지의 합은 ${sum}입니다.<br><br>
	<!-- 실습2. 1부터 10까지 2씩 증가하면서 반복 -->
	<c:forEach var="i" begin="1" end="10" step="2" varStatus="loop">
		i=${i } &nbsp;&nbsp;&nbsp;
		반복횟수: ${loop.count } <br>
	</c:forEach>
	<br>
	<!-- 실습3. 1부터 10까지 홀수의 합은 ??입니다. -->
	<c:set var="sum" value="0"/>
	<c:forEach var="i" begin="1" end="10" step="2">
		<c:set var="sum" value="${sum+i }"/>
	</c:forEach>
	1부터 10까지 홀수의 합은 ${sum}입니다.<br><br>
	<!-- 객체배열 출력 -->
	<c:forEach var="slamdunk" items="${list }">
		슬램덩크 ${slamdunk }<br>
	</c:forEach><br>
	
	<!-- 추가. 구분자 ,를 이용하여 문자열을 분리하여 출력 -->
	<c:set var="football" value="차범근,안정환,박지성,손흥민,이강인"/>
	<c:forTokens var="fb" items="${football }" delims=",">
		${fb }
	</c:forTokens>
	
</body>
</html>