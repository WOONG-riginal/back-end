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
	<link rel="stylesheet" href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
	<title>회원 개별정보 확인</title>
	<style>
		#wrap{
			width: 960px;
			margin: 20px auto;
			border: 1px solid #ccc;
			border-radius: 8px;
			padding: 20px;
		}
	</style>
</head>
<body>
<%
	// member02list.jsp에서 넘겨준 파라미터값 할당
	String id=request.getParameter("id");
	// DAO 생성
	MemberDAO mdao=new MemberDAO();
	// member02list.jsp에서 파라미터로 넘겨준 동적 id를 인자로 사용 | mbean = 패키징
	MemberVO mbean=mdao.oneselectMember(id);

%>
	<div class="card-body">
		<div id="wrap">
			<div class="panel-heading">
				<h2>회원 개별정보 확인</h2>
			</div>
			<div class="panel-body">
				<table class="table">
					<tr>
						<th>아이디</th>
						<th>비밀번호</th>
						<th>이름</th>
						<th>이메일</th>
					</tr>
					<tr>
						<td><%=mbean.getId() %></td>
						<td><%=mbean.getPwd() %></td>
						<td><%=mbean.getName() %></td>
						<td><%=mbean.getEmail() %></td>
					</tr>
					<tr>
						<td colspan="4">
							<button onclick="location.href='member04update.jsp?id=<%=mbean.getId() %>'" class="btn btn-danger">정보수정</button>
							<button onclick="location.href='member05delete.jsp?id=<%=mbean.getId() %>'" class="btn btn-danger">정보삭제</button>
							<button onclick="location.href='member02list.jsp'" class="btn btn-primary">목록보기</button>
							<button onclick="location.href='member01.jsp'" class="btn btn-primary">회원가입</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>