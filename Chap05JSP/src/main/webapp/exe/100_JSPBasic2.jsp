<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JSP 기초연습</title>
</head>
<body>
	<h1>1부터 10까지의 합</h1>
<%
	int sum=0;
	for(int i=0;i<11;i++){
		sum+=i;
	}
	out.print("1부터 10까지의 합 : ");
	out.print(sum);
	out.print("입니다.");
%>
	<br>
	<span>1부터 10까지의 합 : <%=sum %>입니다.</span>
</body>
</html>