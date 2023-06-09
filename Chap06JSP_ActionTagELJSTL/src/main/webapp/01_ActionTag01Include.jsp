<!-- 
	[액션태그 = JSP파일에서 자바코드를 없애는게 목적
	: 화면이 점차 복잡히 짐에 따라 프론트엔드 개발자(=퍼블리셔)들도 자바코드를 써야하는 문제로 이슈 발생
	  그래서 JSP는 스크립틀릿의 자바코드를 제거, 더 쉽고 편리하게 작업할 수 있는 태그 형태로 기능을 제공함
	  => 이것이 자바코드의 기능을 하는 [액션태그]
	
	JSP 여러가지 액션태그 = <> 안에 작성
	 a. 인클루드 액션태그 = jsp:include page="인클루드할페이지.jsp" => 이미 있는 JSP 인클루드와 동일
	 b. 포워드 액션태그 = jsp:forward => 서블릿 RequestDispatcher 클래스의 포워딩 기능을 대신하는 태그
	 c. 유즈빈 액션태그 = jsp:useBean => 객체를 생성하기 위한 태그
	 d. 셋프로퍼티 액션태그 = jsp:setProperty => setter를 대신하는 태그
	 e. 겟프로퍼티 액션태그 = jsp:getProperty => getter를 대신하는 태그
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Action Tag 액션태그 | include</title>
</head>
<body>
	<jsp:include page="./00_included.jsp">
		<jsp:param name="name" value="포토이미지"/>
		<jsp:param name="imgName" value="img03.png"/>
	</jsp:include>
</body>
</html>