<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JSTLDataSend Servlet Data 출력 페이지</title>
	<link rel="stylesheet" href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="card-body">
		<h2>1. 배열 데이터</h2>
		<c:forEach var="item1" items="${name }">
			${item1 }<br>
		</c:forEach>
		
		<h2>2. 배열객체 데이터</h2>
		<c:forEach var="item2" items="${list }">
			${item2 }<br>
		</c:forEach>
		
		<h2>3. 자바빈 데이터</h2>
		<c:forEach var="item3" items="${personList }">
			이름: ${item3.name }<br>
			나이: ${item3.age }<br>
			주소: ${item3.address }<br><br>
		</c:forEach>
		
		<hr>
		
		<h2>참조. varStatus 속성들</h2>
		<table class="table">
			<tr>
				<td>Value</td>
				<td>Current</td>
				<td>Index</td>
				<td>Count</td>
			</tr>
			<c:forEach var="item4" items="${personList }" varStatus="status">
			<tr>				
				<td>
					${item4.name } <!-- value 가져오는 위와 같은 방법 -->
				</td>
				<td>
					${status.current.name } <!-- value 가져오는 위와 같은 방법 = varStatus이용 -->
				</td>
				<td>
					${status.index } <!-- 인덱스번호 가져오기 -->
				</td>
				<td>
					${status.count } <!-- 인덱스번호 +1 출력 -->
				</td>
			</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>