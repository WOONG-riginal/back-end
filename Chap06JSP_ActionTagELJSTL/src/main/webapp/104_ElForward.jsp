<!-- 
	EL 내장객체 requestScope = JSP request객체와 동일
	= request에 바인딩 된 데이터에 접근 가능
	=> sessionScope, applicationScope도 있음
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	// request 스코프에 값 할당 키명 address 키값 서울시 성동구
	request.setAttribute("address", "서울시 성동구");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL 포워드 처리 페이지</title>
</head>
<body>
	<!-- 액션태그 포워딩 -->
	<jsp:forward page="./104_ElForward2.jsp"></jsp:forward>
	<!-- RequestDispatcher 포워딩 -->
<%
	RequestDispatcher dis=request.getRequestDispatcher("104_ElForward2.jsp");
	dis.forward(request, response);
%>	
</body>
</html>