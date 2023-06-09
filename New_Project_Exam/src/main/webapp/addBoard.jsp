<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   //한글처리
   request.setCharacterEncoding("utf-8");
   response.setContentType("text/html;charset=utf-8");
   
   String name = (String)session.getAttribute("name");
   if(name==null){
		response.sendRedirect("./login.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>새글등록</title>
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
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
      td{
	   	text-align: left;
	   }
   </style>

</head>
<body>
   <div id="wrap" class="card-body">
   		<div class="flex_header">
			<header>
         		<h3>글 상세보기</h3>
      		</header>
      		<aside>
      			<span><%=name %> 님</span>
         		<a href="LogoutCtrl"><button class="btn btn-secondary">로그아웃</button></a>
      		</aside>
		</div>
      <section>
         <form action="AddBoardCtrl" method="post">
            <table class="table table-bordered">
            <tr>
               <td>제목</td>
               <td>
                  <input type="text" name="title" class="form-control">
               </td>
            </tr>
            <tr>
               <td>작성자</td>
               <td>
                  <input type="hidden" name="nickname" value="<%=name %>" size="10" class="form-control"><%=name %>
               </td>
            </tr>
            <tr>
               <td>내용</td>
               <td>
                  <textarea name="content" cols="40" rows="10"  class="form-control"></textarea>
               </td>
            </tr>   
               <tr>
                  <td colspan="2">
                     <input type="submit" value="새글등록" class="btn btn-primary">
                     <a href="GetBoardListCtrl"><input type="button" value="글 목록" class="btn btn-secondary"></a>                     
                  </td>
               </tr>
            </table>
         </form>
      </section>
   </div>
</body>
</html>