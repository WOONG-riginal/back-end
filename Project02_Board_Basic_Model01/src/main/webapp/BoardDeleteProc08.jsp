<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 한글처리
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	
	int num=Integer.parseInt(request.getParameter("num"));
	String pass=request.getParameter("password");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>08 글 삭제하기 처리 페이지</title>
</head>
<body>
<%
	BoardDAO bdao=new BoardDAO();
	// 비밀번호 확인 메서드 호출 = db에 있는 비밀번호를 얻어옴
	String passChk=bdao.getPass(num);
	// db 비밀번호와 글 삭제시 폼에서 입력한 비밀번호 같은지 비교
	if(pass.equals(passChk)){
		bdao.deleteBoard(num);
%>
	<script>
		alert("삭제 완료");
		location.href="BoardList03.jsp";
	</script>
<%
	}else{
%>
	<script>
		alert("비밀번호를 확인하세요");
		history.go(-1);
	</script>
<%
	}
%>
</body>
</html>