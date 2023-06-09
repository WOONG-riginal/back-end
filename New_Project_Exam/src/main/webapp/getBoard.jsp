<%@page import="biz.board.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 한글처리
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	// 로그인 유무
	String name = (String)session.getAttribute("name");
	String role = (String)session.getAttribute("role");
	if(name==null){
		response.sendRedirect("./login.jsp");
	}
	// 바인딩
	BoardVO board = (BoardVO) request.getAttribute("board");
	
%>     
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Exam_글 목록</title>
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
	   td{
	   	text-align: left;
	   }
	</style>
</head>
<body>
	<div id="wrap" class="card-body">
		<div class="flex_header">
			<header>
         		<h3>글 상세보기</h3>
      		</header>
      		<aside>
      			<span><%=name %> 님</span>
         		<a href="LogoutCtrl"><button class="btn btn-secondary">로그아웃</button></a>
      		</aside>
		</div>
		<section>
<%
	if(name.equals(board.getNickname())){
%>					
			<form action="UpdateBoardCtrl" method="post">
				<!-- 수정처리를 위해 hidden seq값 넘겨줌 -->
				<input type="hidden" name="seq" value="<%=board.getSeq()%>">
				<table class="table table-bordered">
					<tr>
						<td>제목</td>
						<td>
							<input type="text" name="title" value="<%=board.getTitle()%>" class="form-control">
						</td>
					</tr>
					<tr>
						<td>작성자</td>
						<td><%=board.getNickname() %></td>
					</tr>
					<tr>
						<td>내용</td>
						<td>
							<textarea name="content" rows="20" cols="10" class="form-control"><%=board.getContent() %></textarea>
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
						<td colspan="2">
							<input type="submit" value="글 수정" class="btn btn-primary" onclick="return confirm('수정하시겠습니까?')">
						</td>
					</tr>
				</table>
			</form>
			<a href="./addBoard.jsp"><input type="button" value="새 글 등록" class="btn btn-secondary"></a> &nbsp;&nbsp;&nbsp;
			<a href="DeleteBoardCtrl?num=<%=board.getSeq()%>" onclick="return confirm('삭제하시겠습니까?')"><input type="button" value="글 삭제" class="btn btn-secondary"></a> &nbsp;&nbsp;&nbsp;
			<a href="GetBoardListCtrl"><input type="button" value="글 목록" class="btn btn-secondary"></a>
<%
	}else if(role.equals("Admin")){
%>
		<form action="UpdateBoardCtrl" method="post">
		<!-- 수정처리를 위해 hidden seq값 넘겨줌 -->
			<input type="hidden" name="seq" value="<%=board.getSeq()%>">
			<table class="table table-bordered">
				<tr>
					<td>제목</td>
					<td>
						<%=board.getTitle()%>
					</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td><%=board.getNickname() %></td>
				</tr>
				<tr>
					<td>내용</td>
					<td rows="40" cols="10" class="form-control"><%=board.getContent() %></td>
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
				</tr>
			</table>
		</form>
		<a href="./addBoard.jsp"><input type="button" value="새 글 등록" class="btn btn-secondary"></a> &nbsp;&nbsp;&nbsp;
		<a href="DeleteBoardCtrl?num=<%=board.getSeq()%>" onclick="return confirm('삭제하시겠습니까?')"><input type="button" value="글 삭제" class="btn btn-secondary"></a> &nbsp;&nbsp;&nbsp;
		<a href="GetBoardListCtrl"><input type="button" value="글 목록" class="btn btn-secondary"></a>
<%
	}else{
%>
		<form action="UpdateBoardCtrl" method="post">
		<!-- 수정처리를 위해 hidden seq값 넘겨줌 -->
			<input type="hidden" name="seq" value="<%=board.getSeq()%>">
			<table class="table table-bordered">
				<tr>
					<td>제목</td>
					<td>
						<%=board.getTitle()%>
					</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td><%=board.getNickname() %></td>
				</tr>
				<tr>
					<td>내용</td>
					<td rows="40" cols="10" class="form-control"><%=board.getContent() %></td>
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
				</tr>
			</table>
		</form>
		<a href="./addBoard.jsp"><input type="button" value="새 글 등록" class="btn btn-secondary"></a> &nbsp;&nbsp;&nbsp;
		<a href="GetBoardListCtrl"><input type="button" value="글 목록" class="btn btn-secondary"></a>
<%
	}
%>
		</section>
	</div>
</body>
</html>