<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
	<title>액션태그 회원가입 - DB연동없음</title>
	<style>
		#wrap{
			width: 80%;
			margin: 20px auto;
			border: 1px solid #222;
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
				<form action="04_ActionTag01setgetPropertyCtrl.jsp" method="post" autocomplete="off">
					<table class="table">
						<tr>
							<td>아이디</td>
							<td><input type="text" name="id" placeholder="ID"></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="pwd" placeholder="비밀번호"></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input type="text" name="name" placeholder="이름"></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input type="text" name="email" placeholder="이메일"></td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="submit" value="회원가입" class="btn btn-primary">
								<input type="reset" value="취소" class="btn btn-primary">
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>