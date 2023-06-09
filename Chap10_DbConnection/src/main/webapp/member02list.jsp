<%@page import="java.util.Vector"%>
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
	<title>회원정보 리스트</title>
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
	MemberDAO mdao=new MemberDAO();
	/* MemberDAO에서 작성한 메서드 호출하여 DB에 레코드셋 할당 */
	Vector<MemberVO> vec=mdao.allSelectMember();
%>
	<div class="card-body">
		<div id="wrap">
			<div class="panel-heading">
				<h2>회원정보 리스트</h2>
			</div>
			<div class="panel-body">
				<table class="table">
					<tr>
						<th>아이디</th>
						<th>비밀번호</th>
						<th>이름</th>
						<th>이메일</th>
					</tr>
<%
	for(int i=0;i<vec.size();i++){ // 배열 인덱스 번호 0부터 객체배열 벡터에 할당된 객체배열 크기만큼 반복
		MemberVO bean=vec.get(i);
%>
					<tr>
						<td>
							<a href="./member03info.jsp?id=<%=bean.getId() %>"><%=bean.getId() %></a>
						</td>
						<td><%=bean.getPwd() %></td>
						<td><%=bean.getName() %></td>
						<td><%=bean.getEmail() %></td>
					</tr>
<%
	}
%>					
					<tr>
						<td colspan="4">
							<button onclick="location.href='member01.jsp'" class="btn btn-primary">회원가입</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>