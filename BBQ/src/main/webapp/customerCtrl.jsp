<%@page import="biz.board.bbqBoardDAO"%>
<%@page import="biz.board.bbqBoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	
	// 로그인 확인
	String id = (String)session.getAttribute("id");
	if(id==null){
		response.sendRedirect("index.jsp");
	}
	
	String store = request.getParameter("store");
	String type = request.getParameter("type");
	String writer = request.getParameter("writer");
	String contact = request.getParameter("contact");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	bbqBoardVO bvo = new bbqBoardVO();
	bvo.setStore(store);
	bvo.setType(type);
	bvo.setWriter(writer);
	bvo.setContact(contact);
	bvo.setTitle(title);
	bvo.setContent(content);
	bbqBoardDAO bdao = new bbqBoardDAO();
	bdao.addBoard(bvo,id);

	response.sendRedirect("index.jsp?content=mypage.jsp");

	
	
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터 처리 페이지</title>
</head>
<body>

</body>
</html>