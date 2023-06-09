<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//한글처리
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	// 파라미터값 할당
	String title=request.getParameter("title");
	String nickname=request.getParameter("nickname");
	String content=request.getParameter("content");
%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>글쓰기 처리 페이지</title>
</head>
<body>
<%
	// 로그인 한 회원만 글쓰기 가능
	// 이미 할당된 세션 이용
	String name=(String)session.getAttribute("name");
	if(name==null){
%>
		<script>
			alert('로그인 한 경우에만 사용이 가능합니다.');
			location.href="./index.jsp";
		</script>
<%
	}else{
	
	// 1. DB 접속 => jdbc방식
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url="jdbc:oracle:thin:@localhost:1521:xe";
	Connection conn=DriverManager.getConnection(url, "hr", "hr");
	System.out.println("DB 접속");
	
	// 2. 비지니스 로직
	// 2-1. 쿼리문 준비
	String sql="insert into b_board(seq,title,nickname,content) values("+
		    "(select nvl(max(seq),0)+1 from b_board),?,?,?"+
			")";
	// 2-2. prepareStatement객체 사용
	PreparedStatement stmt=conn.prepareStatement(sql);
	// 2-3. ? 매핑
	stmt.setString(1, title);
	stmt.setString(2, nickname);
	stmt.setString(3, content);
	// 2-4. 실행
	int cnt=stmt.executeUpdate(); // 쿼리 실행문이 성공이면 정수값 1을 리턴
	if(cnt!=0) {
		response.sendRedirect("getBoardList.jsp");
	}
	// 2-5. 자원반납
	stmt.close();
	conn.close();
	}
%>
</body>
</html>