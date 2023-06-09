<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>
	JSP 등장
	: 초반 서블릿 이용 구현
	  인터넷 이용이 늘고 발전하면서 화면의 기능이나 구성이 복잡해짐
	  서블릿은 화면 구현이 불편하기 때문에
	  화면 기능 구현을 좀 더 쉽게 하기 위해 JSP가 등장
	  
	서블릿과 JSP의 차이점
	  a. 서블릿
	   = 자바 코드 기반으로 HTML과 JS로 화면을 구현
	  b. JSP
	   = HTML, CSS, JS를 기반으로 JSP요소를 사용해 화면을 구현
	   
	JSP 등장 배경
	  a. 서블릿 비즈니스 로직과 결과를 보여주는 화면과 기능을 분리하기 위해
	  b. 백엔드 개발자와 프론트엔드 개발자의 업무 영역을 확실히 분리하기 위해
	  c. 재사용성과 유지관리가 수월해짐
	  
	JSP 구성요소
	  a. HTML, CSS, JS
	  b. JSP 기본 태그
	  c. JSP 액션 태그
	  d. 커스텀 태그 => 개발자가 직접 제작하여 사용하는 태그와 프레임워크 제공하는 태그를 말함
	  
	JSP는 기본적으로 get/post 구분이 없음
	  = 쿼리스트링에 대한 처리는 서블릿이 담당
	  = 입력화면과 결과화면은 JSP가 담당
</title>
</head>
<body>
	<h1>First JSP</h1>
	<p>
		<img src="./images/moon.jpg" alt="사진1">
	</p>
</body>
</html>