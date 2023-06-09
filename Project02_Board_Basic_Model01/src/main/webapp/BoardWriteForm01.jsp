<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Project02 Board Basic Model1 | 01 글쓰기 게시판</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/css.css">
</head>
<body>
	<div id="wrap" class="card-body">
		<header>
			<h1>새 글 쓰기</h1>
		</header>
		<section>
			<form action="BoardWriteProc02.jsp" method="post">
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
							<input type="submit" value="글쓰기" class="btn btn-primary" />
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