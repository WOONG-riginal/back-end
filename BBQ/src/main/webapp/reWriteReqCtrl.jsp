<%@page import="biz.board.bbqBoardDAO"%>
<%@page import="biz.board.bbqBoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	int ref=Integer.parseInt(request.getParameter("ref"));
	int re_step=Integer.parseInt(request.getParameter("re_step"));
	int re_level=Integer.parseInt(request.getParameter("re_level"));
	
	bbqBoardVO rewrite=new bbqBoardVO();
	rewrite.setTitle(title);
	rewrite.setContent(content);
	rewrite.setRef(ref);
	rewrite.setRe_step(re_step);
	rewrite.setRe_level(re_level);
	
	bbqBoardDAO bdao=new bbqBoardDAO();
	int result=bdao.writeAnswer(rewrite);
	if(result!=0){
%>
	<script>
		alert('답변이 등록되었습니다.');
		location.href='index.jsp?content=adminpage.jsp';
	</script>
<%
	}else{
%>
	<script>
		alert('답변이 올바르지 않습니다.');
		history.back();
	</script>
<%	
	}
%>
