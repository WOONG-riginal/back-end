<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>테스트 게시판</title>
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
			<h1>테스트 게시판</h1>
<%
	String name=(String)session.getAttribute("name");
	if(name==null){
%>
			<div>
				<a href="./login.jsp">로그인</a>
				<a href="./getBoardList.jsp">목록보기</a>
				<a href="./addBoard.jsp">글쓰기</a>
			</div>
<%
	}else{
%>		
			<div>
				<a href="LogoutCtrl">로그아웃</a>
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