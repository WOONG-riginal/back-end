<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>테스트 게시판</title>
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
   <div id="wrap" class="card-body">
      <header>
         <h3>로그인</h3>
      </header>
      <section>
      	<form action="LoginCtrl" method="post">
      		<table class="table table-bordered">
      			<tr>
      				<td>아이디</td>
      				<td>
      					<input type="text" name="id" />
      				</td>
      			</tr>
      			<tr>
      				<td>비밀번호</td>
      				<td>
      					<input type="password" name="password" />
      				</td>
      			</tr>
      			<tr>
      				<td colspan="2">
      					<input type="submit" value="로그인" class="btn btn-primary"/>
      					<input type="reset" value="취소" class="btn btn-secondary"/>
      				</td>
      			</tr>
      		</table>
      	</form>
      </section>
   </div>
</body>
</html>