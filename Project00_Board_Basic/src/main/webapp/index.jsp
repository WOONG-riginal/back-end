<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Project00_Board_Basic</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<style>
		#wrap{
			width: 960px;
			margin: 40px auto;
			text-align: center;
			border: 1px solid #ccc;
			padding: 40px 0;
		}
	</style>
</head>
<body>
	<div id="wrap" class="card-body">
		<header>
			<h1>JSP 기초 게시판 제작 연습</h1>
<%
	String name=(String)session.getAttribute("name");
	if(name==null){ // name 세션값이 없으면 로그인 표시
%>
			<div>
				<a href="./login.jsp">로그인</a>
				<a href="./getBoardList.jsp">목록보기</a>
				<a href="./addBoardCtrl.jsp">글쓰기</a>
			</div>
<%
	}else{ // name 세션값이 있으면 로그아웃 표시
%>		
			<div>
				<a href="./logoutCtrl.jsp">로그아웃</a>
				<a href="./getBoardList.jsp">목록보기</a>
				<a href="./addBoard.jsp">글쓰기</a>
			</div>
<%
	}
%>
		</header>
	</div>
</body>
</html>