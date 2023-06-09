<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${empty id }">
	<c:redirect url="login.jsp"/>
</c:if>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원정보</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/css.css">
</head>
<body>
    <div id="wrap" class="card-body">
	    <aside>
	    	${name }님
	    	<a href="LogoutCtrl"><button class="btn btn-secondary">로그아웃</button></a>
	    </aside>
    	<header>
         <h3>회원정보</h3>
      </header>
		<table class="table table-bordered">
			<tr>
				<td>아이디</td>
				<td>${member.id }</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>${member.name }</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>${member.email }</td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td>${member.tel }</td>
			</tr>
			<tr>
				<td>취미</td>
				<td>${member.hobby }</td>
			</tr>
			<tr>
				<td>직업</td>
				<td>${member.job }</td>
			</tr>
			<tr>
				<td>나이</td>
				<td>${member.age }</td>
			</tr>
			<tr>
   				<td>나의 정보</td>
   				<td>${member.info }</td>
   			</tr>
		</table>
		<a href="GetBoardListCtrl"><input type="button" value="게시판" class="btn btn-secondary"></a>
		<c:if test="${role=='Admin' }">	
		<a href="getMemberListCtrl"><input type="button" value="회원목록" class="btn btn-warning"></a>
      	</c:if>
      	<c:if test="${role!='Admin' }">	
		<a href="checkPassword.jsp"><input type="button" value="정보수정" class="btn btn-info"></a>
      	</c:if>
   		<a href="./index.jsp"><input type="button" value="메인" class="btn btn-success"></a>
    </div>
</body>
</html>