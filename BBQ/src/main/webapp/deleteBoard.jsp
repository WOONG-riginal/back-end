<%@page import="java.io.PrintWriter"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.Redirect"%>
<%@page import="biz.board.bbqBoardVO"%>
<%@page import="biz.board.bbqBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	
	int num = Integer.parseInt(request.getParameter("num"));
	if(num!=0) {
	    bbqBoardDAO bdao = new bbqBoardDAO();
	    bdao.deleteBoard(num);
%>
	     <script>
		 	alert('삭제되었습니다.');
		 	location.href='index.jsp?content=mypage.jsp';
	     </script>
<%
	}
%>
