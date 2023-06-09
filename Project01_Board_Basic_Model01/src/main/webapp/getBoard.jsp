<%@page import="biz.board.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	
	String name=(String)session.getAttribute("name");
	if(name==null) response.sendRedirect("./login.jsp");
	
	// 바인딩 = Ctrl에서 포워딩 해준 데이터
	BoardVO board=(BoardVO)request.getAttribute("board");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Project01 Board Basic | 게시글 보기</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/css.css">
</head>
<body>
    <div id="wrap" class="card-body">
    <aside>
    	<a href="LogoutCtrl"><button class="btn btn-secondary">로그아웃</button></a>
    </aside>
      <header>
         <h3>글쓰기</h3>
      </header>
      <section>
      	<form action="UpdateBoardCtrl" method="post">
      		<table class="table table-bordered">
      			<tr>
      				<td>제목</td>
      				<td>
      					<input type="text" name="title" value="<%=board.getTitle()%>" class="form-control" />
      				</td>
      			</tr>
      			<tr>
      				<td>작성자</td>
      				<td><%=board.getNickname() %></td>
      			</tr>
      			<tr>
      				<td>내용</td>
      				<td>
      					<textarea name="content" id="" cols="30" rows="10" class="form-control" ><%=board.getContent() %></textarea>
      				</td>
      			</tr>
      			<tr>
      				<td>등록일</td>
      				<td><%=board.getRegdate() %></td>
      			</tr>
      			<tr>
      				<td>조회수</td>
      				<td><%=board.getCnt() %></td>
      			</tr>
      			<tr>
      				<td><input type="hidden" name="seq" value="<%=board.getSeq() %>"/></td>
      				<td colspan="2"><input type="submit" value="글수정" class="btn btn-primary" onclick="alert('수정하시겠습니까?')" /></td>
      			</tr>
      		</table>
      	</form>
      	<a href="./addBoard.jsp"><input type="button" value="글쓰기" class="btn btn-secondary"/></a>&nbsp;
      	<a href="DeleteBoardCtrl?seq=<%=board.getSeq() %>" onclick="alert('삭제하시겠습니까?')"><input type="button" value="글삭제" class="btn btn-secondary"/></a>&nbsp;
      	<a href="./index.jsp"><input type="button" value="메인" class="btn btn-secondary"/></a>&nbsp;
      	<a href="GetBoardListCtrl"><input type="button" value="목록" class="btn btn-secondary"/></a>
      </section>
   </div>
</body>
</html>