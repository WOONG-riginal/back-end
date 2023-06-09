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
   <title>로그인 페이지</title>
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
   <style>
      #wrap {
         width: 960px;
         margin: 40px auto;
         text-align: center;
         padding: 40px 0;
         
      }
      .btn{
    	width: 12%;
    	margin: 0 10px;
      }
	</style>
</head>
<body>
   <div id="wrap" class="card-body">
         <form action="LoginCtrl" method="post">
         	<h1>로그인</h1>
            <table class="table">
               <tr>
                  <td class="text">아이디</td>
                  <td>
                     <input type="text" name ="id">
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
                     <input type="submit"  value="로그인" class="btn btn-primary">
                     <input type="button" value="취소"  onclick ="location.href='index.jsp'" class="btn btn-secondary"/>
                     <input type="button" value="회원가입"  onclick ="location.href='join.jsp'" class="btn btn-success"/>
                  </td>
               </tr>
            </table>
         </form>
   </div>
</body>
</html>