<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
</head>
<body>
    <div id="wrap" class="card-body">
    	<h1>ID 확인</h1>
        <form action="CheckMemberCtrl" method="post" autocomplete="off">
			<table class="table table-bordered">
				<tr>
					<td>아이디</td>
					<td>
						<input type="text" name="id" class="form-control" placeholder="아이디를 입력하세요" required/>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="확인" class="btn btn-primary">
					</td>
				</tr>
			</table>
		</form>
    </div>
</body>
</html>