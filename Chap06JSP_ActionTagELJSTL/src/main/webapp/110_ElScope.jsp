<!-- 
	스코프 우선순위
	: 각 내장객체의 바인딩 속성이름이 같은 경우 우선순위가 있음 (작은 범위 우선)
	= page < request < session < application
	
	-- 실습 -- 
	바인딩 데이터 세팅  
    request객체 : id = gim , pw = 1111, adress = 서울시 강남구
    session객체 : name = 김쌤
    application : email = ezen@ezen.com
   
    포워딩 페이지 = 110_ELScopeCtrl.jsp
    (추가)바인딩
    session객체 : address = 서울시 노원구
   
    위의 데이터를 바이딩을 이용하여 테이블 형태로 출력
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");

	request.setAttribute("id", "gim");
	request.setAttribute("pw", "1111");
	session.setAttribute("address", "서울시 노원구");
	session.setAttribute("name", "김쌤");
	application.setAttribute("email", "ezen@ezen.com");
%>
<jsp:forward page="110_ElScopeCtrl.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL Scope 우선순위 포워드 바인딩</title>
</head>
<body>

</body>
</html>