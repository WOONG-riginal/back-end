<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Project01 Board Basic | Index</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/css.css">
</head>
<body>
    <div id="wrap" class="card-body">
        <header>
            <h1>기초 게시판 제작 연습 | 모델1</h1>
<%
	String name=(String)session.getAttribute("name");
	if(name==null){
%>
            <div>
                <a href="./login.jsp">로그인</a> |
                <a href="GetBoardListCtrl">목록보기</a> | <!-- 서블릿으로 연결 -->
                <a href="./addBoard.jsp">글쓰기</a>
            </div>
<%
	}else{
%>            
            <div>
                <a href="LogoutCtrl">로그아웃</a> |
                <a href="GetBoardListCtrl">목록보기</a> |
                <a href="./addBoard.jsp">글쓰기</a>
            </div>
<%
	}
%>
        </header>
    </div>
</body>
</html>