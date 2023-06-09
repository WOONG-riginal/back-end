<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>
		예외처리 페이지
		: JSP페이지에서 오류 발생 시 예외처리 페이지를 이용해 예외처리를 할 수 있음
	</title>
</head>
<body>
	<h1>예외처리 페이지 연습</h1>
	<p>
		정수만 입력하세요 | 숫자가 아닐 시 예외발생
	</p>
	<form action="./01_ExceptionBasicCtrl.jsp">
		1부터 <input type="text" name="num">
		<input type="submit" value="계산하기">
	</form>
</body>
</html>