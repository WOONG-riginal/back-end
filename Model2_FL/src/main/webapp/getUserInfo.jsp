<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${empty nickname }">
	<c:redirect url="login.jsp"/>
</c:if>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원정보 보기</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/css.css">
    <style>
    .btn{
    	width: 12%;
    	margin: 0 10px;
    }
    </style>
</head>
<body>
    <div id="wrap" class="card-body">
    <aside>
    	${nickname }님
    	<a href="LogoutCtrl"><button class="btn btn-secondary">로그아웃</button></a>
    </aside>
      <header>
         <h3>회원정보 보기</h3>
      </header>
      <section>
      		<table class="table table-bordered">
      			<tr>
      				<td>아이디</td>
      				<td>
      					${user.id }
      				</td>
      			</tr>
      			<tr>
      				<td>이름</td>
      				<td>
      					${user.name }
      				</td>
      			</tr>
      			<tr>
      				<td>별명</td>
      				<td>
      					${user.nickname }
      				</td>
      			</tr>
      			<tr>
      				<td>구분</td>
      				<td>
      					${user.role }
      				</td>
      			</tr>
      		</table>
      	<!-- <a href="#"><input type="button" value="정보수정" class="btn btn-primary"/></a> -->
      	<!-- <a href="#"><input type="button" value="회원탈퇴" class="btn btn-warning"/></a> -->
      	<a href="addBoard.jsp"><input type="button" value="새 글 등록" class="btn btn-success"/></a>
      	<a href="GetBoardListCtrl"><input type="button" value="목록" class="btn btn-secondary"/></a>
      	<a href="DeleteUser?id=${user.id}"><input type="button" value="회원탈퇴" class="btn btn-danger"/></a>
      </section>
   </div>
</body>
</html>