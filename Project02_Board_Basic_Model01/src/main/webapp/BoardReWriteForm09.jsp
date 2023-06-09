<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	
	int num=Integer.parseInt(request.getParameter("num"));
	int ref=Integer.parseInt(request.getParameter("ref"));
	int re_step=Integer.parseInt(request.getParameter("re_step"));
	int re_level=Integer.parseInt(request.getParameter("re_level"));
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Project02 Board Basic Model1 | 09 답글쓰기</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/css.css">
</head>
<body>
	<div id="wrap" class="card-body">
		<header>
			<h1>답글쓰기</h1>
		</header>
		<section>
			<form action="BoardReWriteProc10.jsp" method="post">
				<input type="hidden" name="num" value="<%=num%>"/>
				<input type="hidden" name="ref" value="<%=ref%>"/>
				<input type="hidden" name="re_step" value="<%=re_step%>"/>
				<input type="hidden" name="re_level" value="<%=re_level%>"/>
				<table class="table table-bordered">
					<tr>
						<td>작성자</td>
						<td>
							<input type="text" name="writer" class="form-control"/>
						</td>
					</tr>
					<tr>
						<td>제목</td>
						<td>
							<input type="text" name="subject" size="10" class="form-control"/>
						</td>
					</tr>
					<tr>
						<td>이메일</td>
						<td>
							<input type="email" name="email" size="10" class="form-control"/>
						</td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td>
							<input type="password" name="password" size="10" class="form-control"/>
						</td>
					</tr>
					<tr>
						<td>내용</td>
						<td>
							<textarea name="content" cols="40" rows="10" class="form-control"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="답글쓰기" class="btn btn-primary" />
							<input type="reset" value="다시쓰기" class="btn btn-secondary" />
						</td>
					</tr>
				</table>
			</form>
		</section>
		<button onclick='location.href="BoardList03.jsp"' class="btn btn-success">글목록</button>
	</div>
</body>
</html>