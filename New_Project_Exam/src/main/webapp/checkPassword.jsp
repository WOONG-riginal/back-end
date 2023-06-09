<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="biz.common.JDBCConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//한글처리
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	
	String checkName=request.getParameter("name");
	
	// # DB 비즈니스 로직
	Connection conn=null;
  	PreparedStatement stmt=null;
  	ResultSet rs=null;
   
  	try {
      // 0. DB 접속
      conn=JDBCConnection.getConnection();
      // 1. 쿼리문 준비
      String sql="select * from exam_users where name=?";
      // 2. prepareStatement
      stmt=conn.prepareStatement(sql);
      // 3. ? 매핑 X
	  stmt.setString(1, checkName);
      // 4. 실행
      rs=stmt.executeQuery();
      if(rs.next()){
    	  String id=rs.getString("id");
    	  String checkPw=rs.getString("password");
%>    
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>로그인 페이지</title>
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
   <style>
      #wrap {
         width: 960px;
         margin: 40px auto;
         text-align: center;
         padding: 40px 0;
         
      }
	</style>
</head>
<body>
   <div id="wrap" class="card-body">
         <form action="CheckPasswordCtrl" method="post">
         	<h1>비밀번호 확인</h1>
            <table class="table">
               <tr>
                  <td class="text">아이디</td>
                  <td>
                     <%=id %>
                  </td>
               </tr>   
               <tr>
                  <td class="text">비밀번호</td>
                  <td>
                     <input type="password" name ="password">
                  </td>
               </tr>
               <tr>
                  <td colspan="2">
                     <input type="submit"  value="확인" class="btn btn-primary">
                     <input type="reset"  value="취소" class="btn btn-secondary">
                  </td>
               </tr>
            </table>
<%
      }
      }catch (ClassNotFoundException e) {
	         e.printStackTrace();
      }catch (SQLException e) {
            e.printStackTrace(); 
         }
      finally {
         JDBCConnection.close(rs, stmt, conn);
      }
%>
         </form>
   </div>
</body>
</html>