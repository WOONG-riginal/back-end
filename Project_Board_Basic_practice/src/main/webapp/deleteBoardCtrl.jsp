<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // 한글처리
    request.setCharacterEncoding("utf-8");
    response.setContentType("text/html;charset=utf-8");
    // 로그인 처리
    String name = (String) session.getAttribute("name");
    if(name==null) response.sendRedirect("./login.jsp");
    // 폼 데이터 받기
    int num=Integer.parseInt(request.getParameter("seq")); // hidden

    // 1. DB 접속 (Connection 객체 이용)
    Class.forName("oracle.jdbc.driver.OracleDriver");
    String url = "jdbc:oracle:thin:@localhost:1521:xe";
    Connection conn = DriverManager.getConnection(url, "hr", "hr");
    System.out.println("DB 접속");

    // 2. 비즈니스 로직
    // 2-1. 쿼리문 준비
    String sql="delete from b_board where seq=?";
    // 2-2. prepareStatement객체 사용
    PreparedStatement stmt = conn.prepareStatement(sql);
    // 2-3. ? 매핑
    stmt.setInt(1, num);
    // 2-4. 실행
    int result=stmt.executeUpdate();
    if(result!=0) response.sendRedirect("./getBoardList.jsp");

    // 2-5. 자원반납
    stmt.close();
    conn.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 삭제 처리 페이지</title>
</head>
<body>

</body>
</html>