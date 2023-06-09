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
    <title>Project02 Board Basic Model1 | 05 글 수정하기</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/css.css">
</head>
<body>
<%
	BoardDAO bdao=new BoardDAO();
	BoardBean bean=bdao.getOneUpdateBoard(num);
%>
	<div id="wrap" class="card-body">
		<header>
			<h1>글 수정하기</h1>
		</header>
		<section>
			<form action="BoardUpdateProc06.jsp" method="post">
				<table class="table table-bordered">
					<tr>
						<td>작성자</td>
						<td>
							<%=bean.getWriter() %>
						</td>
						<td>작성일</td>
						<td>
							<%=bean.getReg_date() %>
						</td>
					</tr>
					<tr>
						<td>제목</td>
						<td colspan="3">
							<input type="text" name="subject" size="10" value="<%=bean.getSubject() %>" class="form-control"/>
						</td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td colspan="3">
							<input type="password" name="password" size="10" class="form-control"/>
						</td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="3">
							<textarea name="content" cols="40" rows="10" class="form-control"><%=bean.getContent() %></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="4">
							<input type="hidden" name="num" value="<%=bean.getNum() %>"/>
							<input type="submit" value="수정하기" class="btn btn-primary" />
						</td>
					</tr>
				</table>
			</form>
		</section>
		<button onclick='location.href="BoardList03.jsp"' class="btn btn-success">글목록</button>
	</div>
</body>
</html>