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
    <title>글 상세보기</title>
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
	BoardVO board=bdao.getBoard(vo);
%>
	<div id="wrap" class="card-body">
    <aside>
    	<%=name %>님
    	<a href="LogoutCtrl"><button class="btn btn-secondary">로그아웃</button></a>
    </aside>
      <header>
         <h3>글 상세보기</h3>
      </header>
      <section>
      		<table class="table table-bordered">
      			<tr>
      				<td>제목</td>
      				<td>
      					<%=board.getTitle() %>
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
      					<%=board.getContent() %>
      				</td>
      			</tr>
      			<tr>
      				<td>등록일</td>
      				<td>
      					<%=board.getRegdate() %>
      				</td>
      			</tr>
      			<tr>
      				<td>조회수</td>
      				<td>
      					<%=board.getCnt() %>
      				</td>
      			</tr>
      		</table>
      	<a href="./updateBoard.jsp?seq=<%=board.getSeq() %>"><input type="button" value="수정" class="btn btn-primary"/></a>
      	<a href="DeleteBoardCtrl?seq=<%=board.getSeq() %>"><input type="button" value="삭제" class="btn btn-warning"/></a>
      	<a href="addBoard.jsp"><input type="button" value="새 글 등록" class="btn btn-success"/></a>
      	<a href="getBoardList.jsp"><input type="button" value="목록" class="btn btn-secondary"/></a>
      </section>
   </div>
</body>
</html>