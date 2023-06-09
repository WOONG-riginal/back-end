<!-- 
	useBean
	: 쉽게 객체를 생성, 멤버에 값을 저장하거나 가져오는 방법
	  => 자바의 new로 생성하던 것을 쉽게 사용
	[형식]
	jsp:useBean id="빈이름" class="패키지명.자바빈클래스명" [scope="접근범위"]
	* scope 범위 = 자바빈에 접근할 수 있는 범위 지정
	               page[기본값] < request < session < application
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
	<title>useBean</title>
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
				<form action="03_ActionTag02UseBeanCtrl.jsp" method="post" autocomplete="off">
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
								<input type="submit" value="회원가입">
								<input type="reset" value="취소">
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>