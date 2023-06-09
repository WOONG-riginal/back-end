<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="biz.common.JDBCConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//한글처리
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	
	String name=(String)session.getAttribute("name");
	if(name==null) response.sendRedirect("./login.jsp");
	String userId=(String)session.getAttribute("id");
	
	// # DB 비즈니스 로직
	Connection conn=null;
	PreparedStatement stmt=null;
	ResultSet rs=null;
 
	String id=null;
    String password=null;
    String userName=null;
    String role=null;
    
	try {
    // 0. DB 접속
    conn=JDBCConnection.getConnection();
    // 1. 쿼리문 준비
    String sql="select * from exam_users where id=?";
    // 2. prepareStatement
    stmt=conn.prepareStatement(sql);
    // 3. ? 매핑 X
	  stmt.setString(1, userId);
    // 4. 실행
    rs=stmt.executeQuery();
    
    while(rs.next()){
    	id=rs.getString("id");
        password=rs.getString("password");
        userName=rs.getString("name");
        role=rs.getString("role");
    }
	} catch (Exception e) {
        e.printStackTrace();
    } finally {
       JDBCConnection.close(rs, stmt, conn);
    }
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 변경</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
    <style>
	   #wrap {
	      width: 960px;
	      margin: 40px auto;
	   }   
	</style>
</head>
<body>
    <div id="wrap" class="card-body">
      <header>
         <h3>비밀번호 변경</h3>
      </header>
      <section>
         <form action="UserInfoUpdateCtrl" method="post">
            <table class="table table-bordered">
               <tr>
                  <td>아이디</td>
                  <td>
                  <input type="hidden" name="id" value="<%=id %>" />
                     <%=id %>
                  </td>
               </tr>
               <tr>
                  <td>비밀번호</td>
                  <td>
                     <input type="text" name="password" size="10" class="form-control" />
                  </td>
               </tr>
               <tr>
                  <td>이름</td>
                  <td>
                     <input type="hidden" name="name"  value="<%=userName%>"/><%=userName%>
                  </td>
               </tr>
               <tr>
                  <td>구분</td>
                  <td>
                  	<input type="hidden" name="role" value="<%=role %>" />
                     <%=role %>
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
<%  
    if(role.equals("Admin")){
%>
    	<a href="./adminIndex.jsp"><input type="button" value="메인" class="btn btn-secondary"></a>
<%
    }else{
%>
    	<a href="./index.jsp"><input type="button" value="메인" class="btn btn-secondary"></a>
<%
    }
    
%>
	<a href="UserDeleteCtrl?id=<%=userId%>"onclick="return confirm('탈퇴하시겠습니까?')"><input type="button" value="탈퇴하기" class="btn btn-warning"></a>
      </section>
   </div>
</body>
</html>