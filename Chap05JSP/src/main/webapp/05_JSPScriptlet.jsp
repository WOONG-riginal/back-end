<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 선언문 -->
<%!
	/* 변수선언 */
	String name="gimssam";
	/* 메서드 */
	public int add(int a,int b){
		int sum=a+b;
		return sum;
	}
%>
<!-- 스크립틀릿 = 자바코드만 들어감 -->
<%
	String age=request.getParameter("age");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스크립틀릿 <% %> = 안에는 자바코드만 사용 가능</title>
</head>
<body>
	<h1>안녕하세요 <%=name %> 님!!</h1>
	<h2>나이는 <%=age %>세 이시네요!!</h2>
	
	<h2>연산 1+2 합은</h2>
	<h2><%=add(1, 2) %> 입니다.</h2>
</body>
</html>