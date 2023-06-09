<!-- 
	JSP 스크립트 요소
	: HTML태그는 컨테이너 작업없이 바로 브라우저로 전송됨
	  => 동적 구성이 아님
	  
	  JSP는 톰캣컨테이너에서 자바로 변환되는 과정을 거치므로
	  => JSP 제공 스크립트 요소를 이용하여
	  => 조건, 상황에 맞게 HTML태그를 선택적으로 전송 가능
	  => 즉, 화면이 동적으로 구성
	  
	JSP 스크립트 요소 = <% %>안에 자바코드를 구현
	  a. 선언문 = JSP에서 변수나 메서드 선언 시 사용
	  <%! %>
	  b. 스크립틀릿(Scriptlet) = JSP에서 자바코드 작성 시 사용
	  c. 표현식(expression tag) = JSP에서 변수값 출력 시 사용
	  
	JSP 스크립트 요소 모드 서블릿의 자바코드로 변환
	  => 즉, 스크립트 요소는 브라우저로 전송되지 않음
	  => 브라우저에는 HTML, CSS, JS만 전달
 -->
<!-- 
	선언문(declaration tag)
	: 선언문 안에 변수 = 서블릿으로 변환 시 서블릿 클래스의 멤버변수로 변환
	[형식]<%! %>
	일반적으로 상단에 코딩 | (! 코딩주의)
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	/* 변수선언 */
	String name="JSP 선언문";
	/* 메서드 */
	public String name(){
		return name;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>
	JSP 선언부
</title>
</head>
<body>
	안녕하세요<br>
	<%= name %>님!!<br>
	<%= name() %>
</body>
</html>