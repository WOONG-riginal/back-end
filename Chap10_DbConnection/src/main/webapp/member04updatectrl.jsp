<%@page import="vo.MemberVO"%>
<%@page import="biz.MemberDAO"%>
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
	<title>회원정보 업데이트 처리 페이지</title>
</head>
<body>
	<!-- 액션태그 사용 자바빈 생성 -->
	<jsp:useBean id="mbean" class="vo.MemberVO">
		<jsp:setProperty name="mbean" property="*"/>
	</jsp:useBean>
<%
	// hidden값으로 넘겨받음
	String id=request.getParameter("id");
	MemberDAO mdao=new MemberDAO();
	// 특정 회원의 비밀번호를 DB에서 가져와서 할당
	String pwd=mdao.getPass(id);
	
	// 회원정보 수정을 위해 폼에서 입력받은 비밀번호와 DB에서 가져온 비밀번호 비교
	if(mbean.getPwd().equals(pwd)){
		mdao.updateMember(mbean);
		response.sendRedirect("member02list.jsp");
	}else{
%>
		<script>
			alert('정보수정 불가! 다시 비밀번호 입력');
			<%-- location.href="member04update.jsp?id=<%=id%>"; --%>
			history.go(-1); // 이전 단계로 돌아가기
		</script>
<%
	}
%>
</body>
</html>