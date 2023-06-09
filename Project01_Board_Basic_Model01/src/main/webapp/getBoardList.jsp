<%@page import="biz.board.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	
	String name=(String)session.getAttribute("name");
	if(name==null) response.sendRedirect("./login.jsp");
	
	// 바인딩 = Ctrl에서 포워딩 해준 데이터
	ArrayList<BoardVO> boardList=(ArrayList<BoardVO>)request.getAttribute("boardList");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Project01 Board Basic | 목록보기</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/css.css">
</head>
<body>
    <div id="wrap" class="card-body">
    <aside>
    	<%=name %>님 접속중
    	<a href="LogoutCtrl"><button class="btn btn-secondary">로그아웃</button></a>
    </aside>
      <header>
         <h3>목록보기</h3>
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
<!-- for문 사용, 백열객체의 데이터를 출력 -->
<% 
	for(int i=0;i<boardList.size();i++) {
		BoardVO board=boardList.get(i);
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
   		<a href="./addBoard.jsp"><input type="button" value="글쓰기" class="btn btn-primary"></a>
      </section>
   </div>
</body>
</html>