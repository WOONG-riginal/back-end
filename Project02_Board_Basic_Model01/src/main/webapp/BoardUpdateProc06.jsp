<%@page import="model.BoardBean"%>
<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 한글처리
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>06 글 수정하기 처리 페이지</title>
</head>
<body>
<!-- 액션태그 사용 폼에서 넘어온 데이터 자바빈 데이터에 할당 -->
<jsp:useBean id="boardbean" class="model.BoardBean">
	<jsp:setProperty name="boardbean" property="*"/>
</jsp:useBean>
<%
	BoardDAO bdao=new BoardDAO();
	// 비밀번호 확인 메서드 호출 = db에 있는 비밀번호를 얻어옴
	String pass=bdao.getPass(boardbean.getNum());
	// db 비밀번호와 글 수정시 폼에서 입력한 비밀번호 같은지 비교
	if(pass.equals(boardbean.getPassword())){
		bdao.updateBoard(boardbean);
%>
	<script>
		alert("수정 완료");
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