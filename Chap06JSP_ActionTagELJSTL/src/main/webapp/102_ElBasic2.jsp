<!-- 
	EL Empty 연산자
	: 자바 빈의 속성이 값으로 설정 되었는지 또는 컬렉션 객체에 값이 존재하는지 판단하는 연산자
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<jsp:useBean id="mbean" class="expression.MemberVO">
	<jsp:setProperty name="mbean" property="name" value="이젠컴"/>
</jsp:useBean>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>
		EL Empty 연산자
	</title>
</head>
<body>
	<!-- 유즈빈에 mbean에 값이 있으므로 false 반환 -->
	${empty mbean }<br>
	<!-- 유즈빈에 mbean에 값이 있으므로 true 반환 -->
	${not empty mbean }<br>
	
	<!-- 값이 없으면 true -->
	${empty "ezen" }<br> <!-- false -->
	${empty "" }<br> <!-- true -->
	${empty null }<br> <!-- true -->
</body>
</html>