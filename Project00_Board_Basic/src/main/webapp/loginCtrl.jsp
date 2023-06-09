<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 한글처리
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	// 파라미터값 할당
	String id=request.getParameter("id");
	String password=request.getParameter("password");
%>	
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>로그인 처리 페이지</title>
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
	// 1. DB 접속 => jdbc방식
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url="jdbc:oracle:thin:@localhost:1521:xe";
	Connection conn=DriverManager.getConnection(url, "hr", "hr");
	System.out.println("DB 접속");
	
	// 2. 구현
	// 2-1. SQL 준비
	String sql="select * from b_users where id=? and password=?";
	// 2-2. prepareStatement객체 사용
	PreparedStatement stmt=conn.prepareStatement(sql);
	// 2-3. ? 매핑
	stmt.setString(1, id);
	stmt.setString(2, password);
	// 2-4. 실행
	ResultSet rs=stmt.executeQuery();
	// 2-5. 메서드 실행 컬럼값 가져오기
	if(rs.next()){ // DB에서 가져오는 값이 있으면
		String name=rs.getString("name");
		session.setAttribute("name", name);
		response.sendRedirect("index.jsp");
	}else{
%>
	<script>
		alert('로그인 실패');
		history.go(-1);
	</script>
<%
	}
	// 2-6. 자원반납
	rs.close();
	stmt.close();
	conn.close();
%>
</body>
</html>