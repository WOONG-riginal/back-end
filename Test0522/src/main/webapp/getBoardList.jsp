<%@page import="biz.board.BoardDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="biz.board.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>글 목록보기</title>
    <link rel="stylesheet" href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
	<style>
    .btn{
    	width: 100px;
    	margin: 0 10px;
    }
    .pop{
    	background: silver;
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
	BoardDAO bdao=new BoardDAO(); 
	ArrayList<BoardVO> boardList=bdao.getBoardList();
	ArrayList<BoardVO> popBoardList=bdao.getPopBoardList();
%>
    <div id="wrap" class="card-body">
    <aside>
    	${name }님
    	<a href="LogoutCtrl"><button class="btn btn-secondary">로그아웃</button></a>
    </aside>
      <header>
         <h3>글 목록보기</h3>
      </header>
      <section>
   		<table class="table table-bordered">
			<tr>
				<td>번호</td>
				<td>제목</td>
				<td>작성자</td>
				<td>등록일</td>
				<td>조회수</td>
			</tr>
<%
	for(int i=0;i<popBoardList.size();i++) {
		BoardVO popBoard=popBoardList.get(i);
%>
			<tr class="pop">
				<td>인기글</td>
				<td><a href="getBoard.jsp?seq=<%=popBoard.getSeq() %>"><%=popBoard.getTitle() %></a></td>
				<td><%=popBoard.getNickname()%></td>
				<td><%=popBoard.getRegdate()%></td>
				<td><%=popBoard.getCnt()%></td>
			</tr>
<%
	}
%>
<%
	for(int i=0;i<boardList.size();i++) {
		BoardVO board=boardList.get(i);
%>
			<tr>
				<td><%=board.getSeq()%></td>
				<td><a href="getBoard.jsp?seq=<%=board.getSeq() %>"><%=board.getTitle() %></a></td>
				<td><%=board.getNickname()%></td>
				<td><%=board.getRegdate()%></td>
				<td><%=board.getCnt()%></td>
			</tr>
<%
	}
%>
   		</table>
   		<a href="./addBoard.jsp"><input type="button" value="글쓰기" class="btn btn-primary"></a>
   		<a href="./index.jsp"><input type="button" value="메인" class="btn btn-success"></a>
      </section>
   </div>
</body>
</html>