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
   <title>게시판 목록</title>
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
	String name=(String)session.getAttribute("name");
	if(name==null){
%>
		<script>
			alert('로그인 한 경우에만 사용이 가능합니다.');
			history.go(-1);
		</script>
<%
	}
	
	// 1. DB 접속 => jdbc방식
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url="jdbc:oracle:thin:@localhost:1521:xe";
	Connection conn=DriverManager.getConnection(url, "hr", "hr");
	System.out.println("DB 접속");
	
	// 2. 비지니스 로직
	// 2-1. 쿼리문 준비
	String sql="select * from b_board order by seq desc";
	// 2-2. prepareStatement객체 사용
	PreparedStatement stmt=conn.prepareStatement(sql);
	// 2-3. ? 매핑 -> X
	// 2-4. 실행
	ResultSet rs=stmt.executeQuery();
%>
   <div id="wrap" class="card-body">
      <aside>
      	<%=name %>님 접속중
      	<a href="./logoutCtrl.jsp"><button class="btn">로그아웃</button></a>
      </aside>
      <header>
         <h3>게시판 목록</h3>
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
	while(rs.next()){
		int seq=rs.getInt("seq");
		String title=rs.getString("title");
		String nickname=rs.getString("nickname");
		String content=rs.getString("content");
		Date regdate=rs.getDate("regdate");
		int cnt=rs.getInt("cnt");
%>
   			<tr>
   				<td><%=seq %></td>
   				<td><a href="./getBoard.jsp?seq=<%=seq %>"><%=title %></a></td>
   				<td><%=nickname %></td>
   				<td><%=regdate %></td>
   				<td><%=cnt %></td>
   			</tr>
<%
	}
	// 2-5. 자원반납
	rs.close();
	stmt.close();
	conn.close();
%>
   		</table>
   		<a href="./addBoard.jsp"><input type="button" value="글쓰기" class="btn btn-primary"/></a>
   		<a href="./index.jsp"><input type="button" value="메인" class="btn btn-success"/></a>
      </section>
   </div>
</body>
</html>