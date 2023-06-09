<!-- 
	MemberBean 객체를 바인딩 후 출력
 -->
<%@page import="vo.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	// 사용할 자바빈 생성
	MemberBean mbean=new MemberBean("kim","1111","김명철","indopop@naver.com");
	// 자바빈 request 객체에 생성
	request.setAttribute("mbean", mbean);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL 바인딩</title>
</head>
<body>
<jsp:forward page="108_ElBeanBindingCtrl.jsp"/>
</body>
</html>