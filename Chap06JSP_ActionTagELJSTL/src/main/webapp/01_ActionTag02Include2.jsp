<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Action Tag 액션태그 | include => 파라미터값 변경</title>
</head>
<body>
	<jsp:include page="./00_included.jsp">
		<jsp:param name="name" value="포토이미지"/>
		<jsp:param name="imgName" value="img06.png"/>
	</jsp:include>
</body>
</html>