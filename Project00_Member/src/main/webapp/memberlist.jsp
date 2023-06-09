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
    <title>회원목록보기</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/css.css">
</head>
<body>
    <div id="wrap" class="card-body">
    <aside>
    	${name }님
    	<a href="LogoutCtrl"><button class="btn btn-secondary">로그아웃</button></a>
    </aside>
      <header>
         <h3>회원목록보기</h3>
      </header>
      <section>
   		<table class="table table-bordered">
			<tr>
				<td>아이디</td>
				<td>이름</td>
				<td>이메일</td>
				<td>전화번호</td>
				<td>취미</td>
				<td>직업</td>
				<td>나이</td>
			</tr>
			<c:forEach var="member" items="${memberList }" varStatus="status">
			<tr>
				<td><a href="GetMemberInfoCtrl?id=${member.id }">${member.id }</a></td>
				<td>${member.name }</td>
				<td>${member.email }</td>
				<td>${member.tel }</td>
				<td>${member.hobby }</td>
				<td>${member.job }</td>
				<td>${member.age }</td>
			</tr>
			</c:forEach>
   		</table>
   		<a href="./addBoard.jsp"><input type="button" value="글쓰기" class="btn btn-primary"></a>
   		<a href="GetBoardListCtrl"><input type="button" value="글목록" class="btn btn-secondary"/></a>
   		<a href="./index.jsp"><input type="button" value="메인" class="btn btn-success"></a>
      </section>
   </div>
</body>
</html>