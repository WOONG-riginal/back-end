<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/css.css">
    <style>
    .btn{
    	width: 12%;
    	margin: 0 10px;
    }
    </style>
</head>
<body>
    <div id="wrap" class="card-body">
      <header>
         <h3>LOGIN</h3>
      </header>
      <section>
      	<form action="LoginCtrl" method="post">
      		<table class="table table-bordered">
      			<tr>
      				<td>아이디</td>
      				<td>
      					<input type="text" name="id" class="form-control"  />
      				</td>
      			</tr>
      			<tr>
      				<td>비밀번호</td>
      				<td>
      					<input type="password" name="password" class="form-control"  />
      				</td>
      			</tr>
      			<tr>
      				<td colspan="2">
      					<input type="submit" value="로그인" class="btn btn-primary"/>
      					<input type="button" value="취소"  onclick ="location.href='index.jsp'" class="btn btn-secondary"/>
                        <input type="button" value="회원가입"  onclick ="location.href='join.jsp'" class="btn btn-success"/>
      				</td>
      			</tr>
      		</table>
      	</form>
      </section>
   </div>
</body>
</html>