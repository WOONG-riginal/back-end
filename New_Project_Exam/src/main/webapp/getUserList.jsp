<%@page import="biz.board.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="biz.common.JDBCConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   request.setCharacterEncoding("utf-8");
   response.setContentType("text/html;charset=utf-8");
   
   String name=(String)session.getAttribute("name");
   if(name==null) response.sendRedirect("./login.jsp");
   
   // # DB 비즈니스 로직
   Connection conn=null;
   PreparedStatement stmt=null;
   ResultSet rs=null;
   
   try {
      // 0. DB 접속
      conn=JDBCConnection.getConnection();
      // 1. 쿼리문 준비
      String sql="select * from exam_users";
      // 2. prepareStatement
      stmt=conn.prepareStatement(sql);
      // 3. ? 매핑 X
      // 4. 실행
      rs=stmt.executeQuery();
      // 5. 반복문 레코드 가져오기
      // 데이터 담을 객체배열 선언
      ArrayList<MemberVO> memberList=new ArrayList<>();
      while(rs.next()) {
         // DB에 있는 컬럼값
         String id=rs.getString("id");
         String password=rs.getString("password");
         String userName=rs.getString("name");
         String role=rs.getString("role");
         
         // 자바빈에 DB에서 얻어온 컬럼값 세팅
         MemberVO members=new MemberVO();
         members.setId(id);
         members.setPassword(password);
         members.setName(userName);
         members.setRole(role);
         // 패키징
         memberList.add(members);
      }
      // 스코프 request에 바인딩
      request.setAttribute("memberList", memberList);
      // 포워딩 = 처리할 view단에 바인딩 데이터 넘겨줌
   } catch (Exception e) {
      e.printStackTrace();
   } finally {
      JDBCConnection.close(rs, stmt, conn);
   }
   
   
   ArrayList<MemberVO> memberList=(ArrayList<MemberVO>)request.getAttribute("memberList");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 리스트</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
</head>
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
</style>
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
            <td>아이디</td>
            <td>비밀번호</td>
            <td>이름</td>
            <td>구분</td>
         </tr>
<!-- for문 사용, 배열객체의 데이터를 출력 -->
<% 
   for(int i=0;i<memberList.size();i++) {
      MemberVO member=memberList.get(i);
%>
         <tr>
            <td><%=member.getId() %></td>
            <td><%=member.getPassword() %></td>
            <td><%=member.getName() %></td>
            <td><%=member.getRole() %></td>
         </tr>
<%
   }
%>
         </table>
         <a href="./adminIndex.jsp"><input type="button" value="메인" class="btn btn-success"></a>
      </section>
   </div>
</body>
</html>