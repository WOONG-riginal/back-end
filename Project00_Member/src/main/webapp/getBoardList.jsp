<%@page import="biz.board.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 로그인 체크 -->
<c:if test="${empty id }">
	<c:redirect url="login.jsp"/>
</c:if>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>글 목록보기</title>
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
    	<a href="GetMemberInfoCtrl?id=${id }"><button class="btn btn-warning">회원정보</button></a>
    	<a href="LogoutCtrl"><button class="btn btn-secondary">로그아웃</button></a>
    </aside>
      <header>
         <h3><a href="GetBoardListCtrl">글 목록보기</a></h3>
      </header>
      <section>
   		<table class="table table-bordered">
			<tr>
				<td>번호</td>
				<td>제목</td>
				<td>작성자</td>
				<td>등록일</td>
				<td>조회수</td>
			</tr>
		<c:forEach var="popBoard" items="${popBoardList }">
			<tr class="pop">
				<td>최다 조회수</td>
				<td><a href="GetBoardCtrl?seq=${popBoard.seq }">${popBoard.title }</a></td>
				<td>${popBoard.nickname }</td>
				<td>${popBoard.regdate }</td>
				<td>${popBoard.cnt }</td>
			</tr>
		</c:forEach>
		<!-- JSTL 반복문 이용 DB에 있는 데이터 있는 만큼 출력 -->
		<c:forEach var="board" items="${boardList }">
			<tr>
				<td>${board.seq }</td>
				<td><a href="GetBoardCtrl?seq=${board.seq }">${board.title }</a></td>
				<td>${board.nickname }</td>
				<td>${board.regdate }</td>
				<td>${board.cnt }</td>
			</tr>
		</c:forEach>
   		</table>
   		<div class="searchform">
			<form action="SearchBoardListCtrl" method="post">
				<select name="condition"  size="1">
					<option value="title">제목</option>
					<option value="nickname">작성자</option>
					<option value="content">내용</option>
				</select>
				<input type="text" name="search" />
				<input type="submit" value="검색" class="btn btn-light" />
			</form>
		</div>
   		<a href="./addBoard.jsp"><input type="button" value="글쓰기" class="btn btn-primary"></a>
   		<a href="./index.jsp"><input type="button" value="메인" class="btn btn-success"></a>
      </section>
   </div>
</body>
</html>