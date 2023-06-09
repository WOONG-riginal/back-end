<%@page import="biz.board.BoardDAO"%>
<%@page import="biz.board.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>글 수정하기</title>
    <link rel="stylesheet" href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
    <style>
    .btn{
    	width: 100px;
    	margin: 0 10px;
    }
    </style>
</head>
<body>
<%
	String name=(String)session.getAttribute("name");
	if(name==null){
%>
		<script>
			alert('로그인 한 경우에만 사용이 가능합니다.');
			location.href="./index.jsp";
		</script>
<%
	}
	
	int num=Integer.parseInt(request.getParameter("seq"));

	BoardVO vo=new BoardVO();
	vo.setSeq(num);
	BoardDAO bdao=new BoardDAO();
	BoardVO board=bdao.checkBoard(vo);
%>
	<div id="wrap" class="card-body">
    <aside>
    	<%=name %>님
    	<a href="LogoutCtrl"><button class="btn btn-secondary">로그아웃</button></a>
    </aside>
      <header>
         <h3>글 수정하기</h3>
      </header>
      <section>
      	<form action="UpdateBoardCtrl" method="post">
      	<input type="hidden" name="seq" value="<%=board.getSeq() %>" />
      		<table class="table table-bordered">
      			<tr>
      				<td>제목</td>
      				<td>
      					<input type="text" name="title" class="form-control"  value="<%=board.getTitle() %>"/>
      				</td>
      			</tr>
      			<tr>
      				<td>작성자</td>
      				<td>
      					<%=board.getNickname() %>
      				</td>
      			</tr>
      			<tr>
      				<td>내용</td>
      				<td>
      					<textarea name="content" cols="40" rows="10" class="form-control"><%=board.getContent() %></textarea>
      				</td>
      			</tr>
      			<tr>
      				<td colspan="2">
      					<input type="submit" value="수정" class="btn btn-primary"/>
      					<input type="reset" value="취소" class="btn btn-danger"/>
      				</td>
      			</tr>
      		</table>
      	</form>
      	<a href="./getBoardList.jsp"><input type="button" value="목록" class="btn btn-secondary"/></a>
      </section>
   </div>
</body>
</html>