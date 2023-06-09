<%@page import="biz.board.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 로그인 체크 -->
<c:if test="${empty nickname }">
	<c:redirect url="login.jsp"/>
</c:if>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원목록</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/css.css">
    <style>
    .btn{
    	width: 100px;
    	margin: 0 10px;
    }
    </style>
</head>
<body>
    <div id="wrap" class="card-body">
    <aside>
    	${nickname }님
    	<a href="GetUserInfo"><button class="btn btn-warning">회원정보</button></a>
    	<a href="LogoutCtrl"><button class="btn btn-secondary">로그아웃</button></a>
    </aside>
      <header>
         <h3>회원 목록보기</h3>
      </header>
      <section>
   		<table class="table table-bordered">
			<tr>
				<td>아이디</td>
				<td>이름</td>
				<td>닉네임</td>
				<td>구분</td>
			</tr>
		<!-- JSTL 반복문 이용 DB에 있는 데이터 있는 만큼 출력 -->
		<c:forEach var="users" items="${userList }">
			<tr>
				<td>${users.id }</td>
				<td>${users.name }</td>
				<td>${users.nickname }</td>
				<td>${users.role }</td>
			</tr>
		</c:forEach>
   		</table>
   		<a href="./index.jsp"><input type="button" value="메인" class="btn btn-success"></a>
      </section>
   </div>
</body>
</html>