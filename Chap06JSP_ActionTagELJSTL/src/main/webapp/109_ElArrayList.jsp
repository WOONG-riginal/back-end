<%@page import="vo.MemberBean"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	// ArrayList 생성
	List memberList=new ArrayList();
	// 자바 빈 생성
	MemberBean mbean=new MemberBean("gimssam","1111","김명철","indopop@naver.com");
	MemberBean mbean2=new MemberBean("ezen","1111","김이젠","ezen@naver.com");
	// 2개 객체 객체배열에 저장
	memberList.add(mbean);
	memberList.add(mbean2);
	// 2개 객체배열을 request객체에 바인딩
	request.setAttribute("memberList", memberList);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL ArrayList 처리</title>
</head>
<body>
	<jsp:forward page="109_ElArrayListCtrl.jsp"/>
</body>
</html>