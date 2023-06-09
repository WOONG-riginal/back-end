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
	<title>회원정보 업데이트</title>
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
	String id=request.getParameter("id");
	MemberDAO dao=new MemberDAO();
	MemberVO mbean=dao.oneselectMember(id);
%>
	<div class="card-body">
		<div id="wrap">
			<div class="panel-heading">
				<h2>회원정보 업데이트</h2>
			</div>
			<div class="panel-body">
				<form action="./member04updatectrl.jsp" method="post">
					<table class="table">
						<tr>
							<th>아이디</th>
							<td><%=mbean.getId() %></td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td>
								<input type="password" name="pwd" id="pwd" />
							</td>
						</tr>
						<tr>
							<th>이름</th>
							<td>
								<input type="text" name="name" id="name" value="<%=mbean.getName() %>" />
							</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>
								<input type="email" name="email" id="email" value="<%=mbean.getEmail() %>" />
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="hidden" name="id" value="<%=mbean.getId() %>" />
								<input type="submit" value="회원정보수정" class="btn btn-danger" />
							</td>
						</tr>
					</table>
				</form>
				<button onclick="location.href='member02list.jsp'">목록보기</button>
			</div>
		</div>
	</div>
</body>
</html>