<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JSP 처리 페이지</title>
</head>
<body>
	이름 : <%=request.getParameter("name") %><br><br>
	아이디 : <%=request.getParameter("id") %><br><br>
	비밀번호 : <%=request.getParameter("password") %><br><br>
	주소 : <%=request.getParameter("address") %><br><br>
	주문개수 : <%=request.getParameter("qty") %><br><br>
	이메일 : <%=request.getParameter("email") %><br><br>
	URL : <%=request.getParameter("url") %><br><br>
	날짜 : <%=request.getParameter("date") %><br><br>
	코멘트 : <%=request.getParameter("comment") %><br><br>
	좋아하는 취미 : <%=request.getParameter("fvThing") %><br><br>
	좋아하는 영화 : 
<%
	String[] arr1=request.getParameterValues("fvMovie");
	for(String fvThing:arr1) {
		out.print(fvThing+"<br>");
	}
%><br>
	가장 좋아하는 가수 : <%=request.getParameter("choice") %><br><br>
	좋아하는 가수 :
<%
	String[] arr2=request.getParameterValues("choiceMulti");
	for(String choiceMulti:arr2) {
		out.print(choiceMulti+"<br>");
	}
%><br>
	파일 : <%=request.getParameter("file") %>
</body>
</html>