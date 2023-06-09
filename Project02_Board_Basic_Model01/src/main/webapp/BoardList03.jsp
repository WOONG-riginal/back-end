<%@page import="model.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Project02 Board Basic Model1 | 03 글 목록</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/css.css">
</head>
<body>
	<div id="wrap" class="card-body">
		<header>
			<h1>글 목록</h1>
		</header>
		<section>
			<table class="table table-bordered">
				<tr>
					<td>번호</td>
					<td>제목</td>
					<td>작성자</td>
					<td>작성일</td>
					<td>조회수</td>
				</tr>
<!-- DB에 저장된 글 가져오기 -->					
<%
	BoardDAO bdao=new BoardDAO();
	ArrayList<BoardBean> vbean=bdao.getAllBoard();
%>
<% 
	for(int i=0;i<vbean.size();i++) {
		BoardBean bean=vbean.get(i);
%>
				<tr>
					<td><%=bean.getNum() %></td>
					<td align="left">
<!-- 답글 들여쓰기 -->
<%
	if(bean.getRe_step()>1){ // 답글은 re_step값이 무조건 1보다 큼
		for(int j=0;j<(bean.getRe_step()-1)*5;j++){ // 댓글과 대댓글을 구분
%>
						&nbsp;
<%
		}
	}
%>
						<a href="BoardInfo04.jsp?num=<%=bean.getNum() %>">
							<%=bean.getSubject() %>
						</a>
					</td>
					<td><%=bean.getWriter() %></td>
					<td><%=bean.getReg_date() %></td>
					<td><%=bean.getReadcount() %></td>
				</tr>
<%
	}
%>
				<tr>
					<td colspan="5">
						<input type="submit" value="글쓰기" onclick='location.href="BoardWriteForm01.jsp"' class="btn btn-primary" />
					</td>
				</tr>
			</table>
		</section>
	</div>
</body>
</html>