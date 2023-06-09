<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>답글쓰기 처리 페이지</title>
</head>
<body>
	<jsp:useBean id="boardbean" class="model.BoardBean">
		<jsp:setProperty name="boardbean" property="*"/>
	</jsp:useBean>
<%
	BoardDAO bdao=new BoardDAO();
	bdao.reWriteBoard(boardbean);
	// 답글 추가 후 글목록으로 이동
	response.sendRedirect("BoardList03.jsp");
%>
</body>
</html>