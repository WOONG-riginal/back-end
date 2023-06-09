<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 한글처리
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	// 로그아웃 = 세션연결 끊어주면 됨
	session.invalidate();
	response.sendRedirect("index.jsp");
%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>로그아웃 처리 페이지</title>
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
   <style>
      #wrap {
         width: 960px;
         margin: 40px auto;
         text-align: center;
         border: 1px solid #ccc;
         padding: 40px 0;
      }
   </style>
</head>
<body>
   
</body>
</html>