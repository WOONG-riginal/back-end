<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	request.setAttribute("id", "kim");
	request.setAttribute("pw", "111");
	session.setAttribute("name", "김명철");
	application.setAttribute("email", "indopop@naver.com");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>EL 바인딩</title>
</head>
<body>
<%-- <jsp:forward page="/107_ElBindingCtrl.jsp"/> --%>
<%
	RequestDispatcher dis=request.getRequestDispatcher("107_ElBindingCtrl.jsp");
	dis.forward(request, response);
%>	
</body>
</html>