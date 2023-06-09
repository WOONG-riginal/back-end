<!-- 
	포워드 액션태그 사용
	: 기존 하나의 서블릿에서 다른 서블릿, JSP로 포워딩하는 방법 => RequestDispatcher 사용
	  같은 기능을 더 간편하게 액션태그 포워드로 사용 가능
	[형식]
	jsp:forward page="포워딩할페이지"/
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
	<title>액션태그 포워드 로그인</title>
</head>
<body>
	<h2>타이틀</h2>
	<div class="panel-heading">
		<h3>로그인</h3>
	</div>
	<div class="panel-body">
		<form action="./02_ActionTag02ForwardCtrl.jsp" method="post" autocomplete="off">
			<table class="table">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="id"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="password"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="로그인">
						<input type="reset" value="취소">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>