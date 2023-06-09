<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="02_ExceptionBasic2.jsp"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	int num=Integer.valueOf(request.getParameter("num"));
	int sum=0;
	for(int i=1;i<=num;i++){
		sum+=i;
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JSP 처리 페이지</title>
</head>
<body>
	<h3>입력받은 수 합계 구하기</h3>
	<p>
		1부터 <%=num %>까지의 합 : <%=sum %>
	</p>
</body>
</html>