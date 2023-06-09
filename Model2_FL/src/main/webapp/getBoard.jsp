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
    <title>글 상세보기</title>
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
         <h3>글 상세보기</h3>
      </header>
      <section>
      		<table class="table table-bordered">
      			<tr>
      				<td>제목</td>
      				<td>
      					${board.title }
      				</td>
      			</tr>
      			<tr>
      				<td>작성자</td>
      				<td>
      					${board.nickname }
      				</td>
      			</tr>
      			<tr>
      				<td>내용</td>
      				<td>
      					${board.content }
      				</td>
      			</tr>
      			<tr>
      				<td>등록일</td>
      				<td>
      					${board.regdate }
      				</td>
      			</tr>
      			<tr>
      				<td>조회수</td>
      				<td>
      					${board.cnt }
      				</td>
      			</tr>
      		</table>
      	<a href="CheckBoardCtrl?seq=${board.seq }"><input type="button" value="수정" class="btn btn-primary"/></a>
      	<a href="DeleteBoardCtrl?seq=${board.seq }"><input type="button" value="삭제" class="btn btn-warning"/></a>
      	<a href="addBoard.jsp"><input type="button" value="새 글 등록" class="btn btn-success"/></a>
      	<a href="GetBoardListCtrl"><input type="button" value="목록" class="btn btn-secondary"/></a>
      </section>
   </div>
</body>
</html>