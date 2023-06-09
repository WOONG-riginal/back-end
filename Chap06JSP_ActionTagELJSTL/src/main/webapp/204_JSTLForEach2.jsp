<%@page import="java.util.ArrayList"%>
<%@page import="vo.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	
	ArrayList memberList=new ArrayList();
	MemberBean mb1=new MemberBean("indopop","1111","김엠씨","indopop@naver.com");
	MemberBean mb2=new MemberBean("ms","1111","김수돌","ms@naver.com");
	MemberBean mb3=new MemberBean("mj","1111","김재돌","mj@naver.com");
	
	memberList.add(mb1);
	memberList.add(mb2);
	memberList.add(mb3);
%>
<c:set var="memberList" value="<%=memberList %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forEach 클래스 객체배열</title>
<link rel="stylesheet" href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
	<style>
		#wrap{
			width: 80%;
			margin: 20px auto;
		}
		table,tr,td,th{
			border: 1px solid #ccc;
		}
		td,th{
			padding: 10px;
		}
	</style>
</head>
<body>
	<div id="wrap" class="card-body">
		<h1>회원관리 화면</h1>
		<table class="table">
			<tr>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>이름</th>
				<th>이메일</th>
			</tr>
			<!-- 객체배열에 저장된 회원수만큼 반복 실행 -->
			<c:forEach var="i" begin="0" end="2" step="1">
				<tr>
					<td>${memberList[i].id }</td>
					<td>${memberList[i].pw }</td>
					<td>${memberList[i].name }</td>
					<td>${memberList[i].email }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>