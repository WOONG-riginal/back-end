<%@page import="biz.board.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 한글처리
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	// 로그인 유무
	String name = (String)session.getAttribute("name");
	if(name==null){
		response.sendRedirect("./login.jsp");
	}
	// 바인딩
	ArrayList<BoardVO> boardList = (ArrayList<BoardVO>)request.getAttribute("boardList");
	ArrayList<BoardVO> popBoardList = (ArrayList<BoardVO>)request.getAttribute("popBoardList");
%>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>글목록</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
    <style>
	   #wrap {
	      width: 960px;
	      margin: 40px auto;
	      text-align: center;
	      padding: 40px 0;
	   }
	   .flex_header {
	   display: flex;
	   flex-flow:row nowrap;
	   justify-content: space-between;
	   }
	   h3 {
	      margin-top: 5px;
	   }
	   span{
	   border: 1px solid lightgray;
	   border-radius:10px;
	   padding: 8px;
	   }
	   .pop{
	   background: silver;
	   }
	</style>
	    
</head>
<body>
	<div id="wrap" class="card-body">
		<div class="flex_header">
			<header>
				<h3>글 목록</h3>
			</header>
			<aside>
				<span><%=name %> 님</span>
				<a href="./checkPassword.jsp?name=<%=name%>"><button class="btn btn-secondary">회원정보</button></a>
				<a href="LogoutCtrl"><button class="btn btn-secondary">로그아웃</button></a>
			</aside>
		</div>
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
	for(int i=0; i<popBoardList.size(); i++){
		BoardVO popBoard = popBoardList.get(i);
%>		
				<tr class="pop">
					<td>최다 조회수</td>
					<td><a href="GetBoardCtrl?seq=<%=popBoard.getSeq()%>"><%=popBoard.getTitle() %></a></td>
					<td><%=popBoard.getNickname() %></td>
					<td><%=popBoard.getRegdate() %></td>
					<td><%=popBoard.getCnt() %></td>
				</tr>
<%				
	}
	for(int i=0; i<boardList.size(); i++){
		BoardVO board = boardList.get(i);
%>		
				<tr>
					<td><%=board.getSeq() %></td>
					<td><a href="GetBoardCtrl?seq=<%=board.getSeq()%>"><%=board.getTitle() %></a></td>
					<td><%=board.getNickname() %></td>
					<td><%=board.getRegdate() %></td>
					<td><%=board.getCnt() %></td>
				</tr>
<%				
	}
%>
			</table>
			<a href="addBoard.jsp"><input type="button" value="글쓰기" class="btn btn-primary"></a>
<%
	String role = (String)session.getAttribute("role");
	if(role.equals("Admin")){
%>
			<a href="adminIndex.jsp"><input type="button" value="메인" class="btn btn-success"></a>
<%
	}else{
%>			
			<a href="index.jsp"><input type="button" value="메인" class="btn btn-success"></a>
<%
	}
%>
			
		</section>
	</div>
</body>
</html>