<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//한글처리
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>게시글 상세보기 | 게시글 업데이트</title>
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
   <style>
      #wrap {
         width: 960px;
         margin: 40px auto;
         text-align: center;
         border: 1px solid #ccc;
         padding: 40px 0;
      }
   </style>
</head>
<body>
<%
	// 로그인 처리
	String name = (String) session.getAttribute("name");
	if(name==null) response.sendRedirect("./login.jsp");
	// 넘겨준 파라미터값 받아서 할당
	int num = Integer.parseInt(request.getParameter("seq")); // 넘어오는 seq값을 정수로 사용하는 것이 중요
	
	// 1. DB 접속 => jdbc방식
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url="jdbc:oracle:thin:@localhost:1521:xe";
	Connection conn=DriverManager.getConnection(url, "hr", "hr");
	System.out.println("DB 접속");
	
	// 기능 #1. 조회수 증가 처리
	// 2. 비즈니스 로직
	// 2-1. 쿼리문 준비
	String sql="update b_board set cnt=(select cnt+1 from b_board where seq=?) where seq=?";
	// 2-2. prepareStatement객체 사용
	PreparedStatement stmt=conn.prepareStatement(sql);
	// 2-3. ? 매핑
	stmt.setInt(1, num);
	stmt.setInt(2, num);
	// 2-4. 실행
	stmt.executeUpdate();
	
	// 기능 #2. 해당 글번호 레코드 셋 가져와서 처리
	// 2. 비즈니스 로직
	// 2-1. 쿼리문 준비
	sql="select * from b_board where seq=?";
	// 2-2. prepareStatement객체 사용
	stmt=conn.prepareStatement(sql);
	// 2-3. ? 매핑
	stmt.setInt(1, num);
	// 2-4. 실행
	ResultSet rs=stmt.executeQuery();
	// 전역변수로 지정 -> 그래야 while을 닫아도 html에서 변수 사용 가능
	int seq = 0;
	String nickname = "";
	String content = "";
	String title = "";
	Date regdate = null;
	int cnt = 0;
	String userid = "";
	   
	while(rs.next()){
		seq = rs.getInt("seq");
	    nickname = rs.getString("nickname");
	    content = rs.getString("content");
	    title = rs.getString("title");
	    regdate = rs.getDate("regdate");
	    cnt = rs.getInt("cnt");
	    userid = rs.getString("userid");
	}
	// 2-5. 자원반납
	rs.close();
	stmt.close();
	conn.close();
%>

   <div id="wrap" class="card-body">
      <aside>
      	<%=name %>님 접속중
      	<a href="./logoutCtrl.jsp"><button class="btn ">로그아웃</button></a>
      </aside>
      <header>
         <h3>게시글 상세보기 | 게시글 업데이트</h3>
      </header>
      <section>
      	<form action="./updateBoardCtrl.jsp" method="post">
      		<!-- 수정 처리를 위해 hidden seq값 넘겨줌 -->
      		<input type="hidden" name="seq" value="<%=seq %>"/>
	   		<table class="table table-bordered">
	   			<tr>
	   				<td>제목</td>
	   				<td>
	   					<input type="text" name="title" class="form-control" value="<%=title %>" />
	   				</td>
	   			</tr>
	   			<tr>
	   				<td>작성자</td>
	   				<td>
	   					<%=nickname %>
	   				</td>
	   			</tr>
	   			<tr>
	   				<td>내용</td>
	   				<td>
	   					<textarea name="content" cols="40" rows="10" class="form-control"><%=content %></textarea>
	   				</td>
	   			</tr>
	   			<tr>
	   				<td>등록일</td>
	   				<td>
	   					<%=regdate %>
	   				</td>
	   			</tr>
	   			<tr>
	   				<td>조회수</td>
	   				<td>
	   					<%=cnt %>
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
   		<a href="./addBoard.jsp"><input type="button" value="글쓰기" class="btn btn-info"/></a>
   		<a href="./deleteBoardCtrl.jsp?seq=<%=seq %>" onclick="alert('삭제하시겠습니까?')"><input type="button" value="삭제" class="btn btn-warning"/></a>
   		<a href="./getBoardList.jsp"><input type="button" value="목록" class="btn btn-secondary"/></a>
      </section>
   </div>
</body>
</html>