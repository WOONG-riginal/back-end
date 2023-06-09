<!-- 
	setProperty / getProperty 액션태그를 이용한 회원정보조회
	: useBean에 접근해 속성값을 설정하거나 가져오는 jsp:setProperty, jsp:getProperty 액션태그
	
	a. jsp:setProperty = useBean 속성에 값을 설정하는 태그
	 => name(=사용할 유즈빈 id값) | property(값 설정할 속성명) | value(속성에 설정할 설정값)
	b. jsp:getProperty = useBean 속성에 값을 가져오는 태그
	 => name(=사용할 유즈빈 id값) | property(값 가져올 속성명)
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
%>
	<!-- 유즈빈 사용 = 폼에서 전달한 회원정보 -->
	<jsp:useBean id="mbean" class="vo.MemberVO"/>
	<!-- property속성을 *로 하면 전송된 데이터 이름과 자바빈 멤버변수를 비교한 후 값을 자동으로 모두 넣어줌 -->
	<jsp:setProperty name="mbean" property="*"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>useBean 접근 처리 페이지</title>
	<link rel="stylesheet" href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="card-body">
		<div id="wrap">
			<div class="panel-heading">
				<h2>회원가입</h2>
			</div>
			<div class="panel-body">
				<table class="table">
					<tr>
						<td>아이디</td>
						<td><jsp:getProperty name="mbean" property="id"/></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><jsp:getProperty name="mbean" property="pwd"/></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><jsp:getProperty name="mbean" property="name"/></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><jsp:getProperty name="mbean" property="email"/></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>