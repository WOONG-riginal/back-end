<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JSTL 기타</title>
	<link rel="stylesheet" href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="card-body">
		<h2>url</h2>
		<p>
			URL을 저장하기 위한 용도로 사용, 경로만 저장
		</p>
		<c:url var="login" value="205_JSTLLoginExe.jsp"/>
		
		<h2>import</h2>
		<p>
			기존 Import와 동일
		</p>
		<c:import url="${login }"/>
		
		<h2>out</h2>
		<p>
			출력, 이스케이프 문자 등 지정 가능
		</p>
		<c:set var="str" value="<h3>JSTL 수업중 입니다.</h3>"/>
		<c:out value="${str }"/> <!-- 기본값 true -->
		<c:out value="${str }" escapeXml="false"/>
	</div>
</body>
</html>