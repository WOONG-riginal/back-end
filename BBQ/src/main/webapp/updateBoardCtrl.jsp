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
   int num = Integer.parseInt(request.getParameter("num"));
   String writer = request.getParameter("writer");
   String contact = request.getParameter("contact");
   String title = request.getParameter("title");
   String content = request.getParameter("content");
   
   bbqBoardVO vo = new bbqBoardVO();
   vo.setStore(store);
   vo.setType(type);
   vo.setNum(num);
   vo.setWriter(writer);
   vo.setContact(contact);
   vo.setTitle(title);
   vo.setContent(content);
   bbqBoardDAO bdao = new bbqBoardDAO();
   bdao.updateBoard(vo);

   response.sendRedirect("index.jsp?content=mypage.jsp");
%>   
<meta charset="UTF-8">
<title>업데이트 처리 페이지</title>