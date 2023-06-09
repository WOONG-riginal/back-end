<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <header>
         <h3>회원목록보기</h3>
      </header>
      <section>
   		<table class="table table-bordered">
			<tr>
				<td>아이디</td>
				<td>이메일</td>
				<td>전화번호</td>
				<td>취미</td>
				<td>직업</td>
				<td>나이</td>
			</tr>
			<c:forEach var="member" items="${memberList }" varStatus="status">
			<tr>
				<td><a href="#">${member.id }</a></td>
				<td>${member.email }</td>
				<td>${member.tel }</td>
				<td>${member.hobby }</td>
				<td>${member.job }</td>
				<td>${member.age }</td>
			</tr>
			</c:forEach>
   		</table>
      </section>
   </div>
</body>
</html>