<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>
	인클루드(include)JSP 디렉티브
	: 공통으로 JSP페이지가 사용될 경우 사용
	  => 재사용성과 유지보수가 쉬움
	  => (예시)모든 페이지에 사용되는 GNB와 Footer
	  
	인클루드 작동방식
	: 인클루드 태그로 JSP페이지를 요청
	  => include.jsp와 자바코드가 03_include.jsp파일과 합쳐져서 브라우저로 전송
	  => JSP페이지에서 실행하는 자바파일은 단 한 개만 생성
	  => 자바코드로 변환
	  => 자바코드 서블릿 변환
	  => class 컴파일 후
	  => 브라우저 출력
</title>
</head>
<body>
	<h1>JSP 인클루드 적용</h1>
	<%@ include file="./include.jsp" %>
</body>
</html>