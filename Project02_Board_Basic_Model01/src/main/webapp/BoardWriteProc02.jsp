<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 한글처리
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>02 글쓰기 처리 페이지</title>
</head>
<body>
<!-- 액션태그 자바빈에 폼 데이터 할당 -->
	<jsp:useBean id="boardbean" class="model.BoardBean">
		<jsp:setProperty name="boardbean" property="*"/>
	</jsp:useBean>
<!-- 액션태그 자바빈에 할당된 데이터 불러오기 -->
	<jsp:getProperty property="writer" name="boardbean"/>
	<jsp:getProperty property="subject" name="boardbean"/>
	<jsp:getProperty property="email" name="boardbean"/>
	<jsp:getProperty property="password" name="boardbean"/>
	<jsp:getProperty property="content" name="boardbean"/>
<%
	// DAO 생성
	BoardDAO bdao=new BoardDAO();
	// 새 글 등록 메서드 
	bdao.insertBoard(boardbean);
	// 글 목록으로 이동
	response.sendRedirect("BoardList03.jsp");
%>

	
</body>
</html>