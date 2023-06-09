<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
	<title>EL 페이지컨텍스트</title>
<style>
		#wrap{
			width: 80%;
			margin: 20px auto;
			border: 1px solid #ccc;
			border-radius: 10px;
		}
	</style>
</head>
<body>
	<div class="card-body">
		<div id="wrap">
			<div class="panel-heading">
				<h2>로그인</h2>
			</div>
			<div class="panel-body">
				<form action="105_ElPageContextCtrl.jsp" method="post" autocomplete="off">
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
							<td colspan="2">
								<input type="submit" value="로그인" class="btn btn-primary">
								<input type="reset" value="취소" class="btn btn-secondary">
							</td>
						</tr>
					</table>
				</form>
				<!-- EL pageContext -->
				<!-- a. 직접 컨텍스트 이름 입력 요청 -->
				<a href="http://localhost:8090/Chap06JSP_ActionTag/103_ElForm.jsp" target="_blank">회원가입(주소창입력)</a><br>
				<!-- b. JSP 방식 -->
				<a href="<%=request.getContextPath()%>/103_ElForm.jsp" target="_blank">회원가입(JSP방식)</a><br>
				<!-- c. EL 방식 -->
				<a href="${pageContext.request.contextPath }/103_ElForm.jsp"  target="_blank">회원가입(EL방식)</a>
			</div>
		</div>
	</div>
</body>
</html>