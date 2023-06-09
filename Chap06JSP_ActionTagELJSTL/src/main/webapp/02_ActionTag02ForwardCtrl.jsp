<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
	<title>포워드 액션태그 처리 페이지</title>
</head>
<body>
<%
	String id=request.getParameter("id");
	String password=request.getParameter("password");
	if(id.length()==0){ // id값이 없으면
//		RequestDispatcher dis=request.getRequestDispatcher("02_ActionTag01Forward.jsp");
//		dis.forward(request, response);
%>
	<jsp:forward page="02_ActionTag01Forward.jsp"></jsp:forward>	
<%
	}
%>
	<h3><%=id %>님 환영합니다</h3>
</body>
</html>