<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 구구단 처리 페이지</title>
<link rel="stylesheet" href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
</head>
<body>
<%
	// 한글처리
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	
	int dan=Integer.parseInt(request.getParameter("dan"));
%>
	<table class=table border="1" width="1000">
		<tr>
			<th colspan="2"><%=dan %>단 출력</th>
 		</tr>
<%
	for(int i=1;i<10;i++){
%>
 		<tr>
 			<td><%=dan %> X <%=i %> = <%=dan*i %></td>
 		</tr>
<%
	}
%>
	</table>
</body>
</html>