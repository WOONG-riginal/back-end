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
    <title>글 수정하기</title>
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
         <h3>글 수정하기</h3>
      </header>
      <section>
      	<form action="UpdateBoardCtrl" method="post">
      	<input type="hidden" name="seq" value="${board.seq }" />
      		<table class="table table-bordered">
      			<tr>
      				<td>제목</td>
      				<td>
      					<input type="text" name="title" class="form-control"  value="${board.title }"/>
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
      					<textarea name="content" cols="40" rows="10" class="form-control">${board.content }</textarea>
      				</td>
      			</tr>
      			<tr>
      				<td colspan="2">
      					<input type="submit" value="수정" class="btn btn-info"/>
      					<input type="reset" value="취소" class="btn btn-danger"/>
      				</td>
      			</tr>
      		</table>
      	</form>
      	<a href="addBoard.jsp"><input type="button" value="글쓰기" class="btn btn-success"/></a>
      	<a href="GetBoardListCtrl"><input type="button" value="글목록" class="btn btn-secondary"/></a>
      </section>
   </div>
</body>
</html>