<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
	<title>회원가입 폼</title>
	<style>
		#wrap{
			width: 960px;
			margin: 20px auto;
			border: 1px solid #ccc;
			border-radius: 8px;
			padding: 20px;
		}
	</style>
</head>
<body>
	<div class="card-body">
		<div id="wrap">
			<div class="panel-heading">
				<h2>회원가입</h2>
			</div>
			<div class="panel-body">
				<form action="./member01ctrl.jsp" method="post" autocomplete="off">
					<table class="table">
						<tr>
							<td>아이디</td>
							<td><input type="text" name="id" id="id" placeholder="ID"></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="pwd" id="pwd" placeholder="비밀번호"></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input type="text" name="name" id="name" placeholder="이름"></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input type="email" name="email" id="email" placeholder="이메일"></td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="submit" value="회원가입" class="btn btn-primary">
								<input type="reset" value="취소" class="btn btn-secondary">
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>