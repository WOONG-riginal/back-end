<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>지정한 예외처리 페이지</title>
</head>
<body>
	<h2>
		<%=exception.toString() %>
	</h2>
	<h2>
		<%=exception.getMessage() %>
	</h2>
	<h2>
		<% exception.printStackTrace(); %>
	</h2>
	숫자만 입력가능. 다시 시동
	<a href="./01_ExceptionBasic.jsp">다시 입력</a>
</body>
</html>