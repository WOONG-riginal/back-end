<%@page import="model.BoardBean"%>
<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	
	int num=Integer.parseInt(request.getParameter("num"));
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Project02 Board Basic Model1 | 04 글 상세보기</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/css.css">
</head>
<body>
<%
	BoardDAO bdao=new BoardDAO();
	BoardBean bean=bdao.getOneBoard(num);
%>
	<div id="wrap" class="card-body">
		<header>
			<h1>글 상세보기</h1>
		</header>
		<section>
			<table class="table table-bordered">
				<tr>
					<td>글번호</td>
					<td><%=bean.getNum() %></td>
					<td>조회수</td>
					<td><%=bean.getReadcount() %></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td><%=bean.getWriter() %></td>
					<td>작성일</td>
					<td><%=bean.getReg_date() %></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td colspan="3"><%=bean.getEmail() %></td>
				</tr>
				<tr>
					<td>제목</td>
					<td colspan="3"><%=bean.getSubject() %></td>
				</tr>
				<tr>
					<td>글내용</td>
					<td colspan="3"><%=bean.getContent() %></td>
				</tr>
				<tr>
					<td colspan="4">
						<input type="button" value="답글쓰기" class="btn btn-primary" onclick='location.href="BoardReWriteForm09.jsp?num=<%=bean.getNum()%>&ref=<%=bean.getRef()%>&re_step=<%=bean.getRe_step()%>&re_level=<%=bean.getRe_level()%>"'/>
						<input type="button" value="글수정" class="btn btn-secondary" onclick='location.href="BoardUpdateForm05.jsp?num=<%=bean.getNum()%>"'/>
						<input type="button" value="글삭제" class="btn btn-warning" onclick='location.href="BoardDeleteForm07.jsp?num=<%=bean.getNum()%>"'/>
						<input type="button" value="글목록"  class="btn btn-success" onclick='location.href="BoardList03.jsp"'/>
					</td>
				</tr>
			</table>
		</section>
	</div>
</body>
</html>