<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name="gimssam";
	String age=request.getParameter("age");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>
	표현식(expression tag)
	: JSP에서 변수값 출력 시 사용 | (주의)변수나 자바식에는 절대 ;을 사용하면 안됨
	  <%-- [형식]<%= %> --%>
</title>
</head>
<body>
	<h1>안녕하세요 <%=name %>님</h1>
	<h2>
		입력받은 나이에 10살을 더한 값은 <%=Integer.valueOf(age)+10 %>살 입니다.
	</h2>
</body>
</html>