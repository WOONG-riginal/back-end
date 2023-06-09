<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원정보수정/탈퇴</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/css.css">
</head>
<body>
    <div id="wrap" class="card-body">
    	<h1>회원정보수정/탈퇴</h1>
        <form action="UpdateMemberCtrl" method="post" autocomplete="off">
			<table class="table table-bordered">
				<tr>
					<td>아이디</td>
					<td>
						<input type="hidden" name="id"  value="${member.id }" required/>${member.id }
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="password" class="form-control" value="${password }" required/></td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td><input type="password" name="pwcheck" class="form-control" value="${password }" required/></td>
				</tr>
				<tr>
					<td>이름</td>
					<td>
						<input type="text" name="name" class="form-control" value="${member.name }" required/>
					</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="email" name="email" class="form-control" value="${member.email }" required></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" name="tel" class="form-control" value="${member.tel }" required></td>
				</tr>
				<tr>
					<td>취미</td>
					<td>
						<input type="checkbox" name="hobby" value="캠핑">캠핑
						<input type="checkbox" name="hobby" value="레고">레고
						<input type="checkbox" name="hobby" value="음악">음악
						<input type="checkbox" name="hobby" value="영화">영화
					</td>
				</tr>
				<tr>
					<td>직업</td>
					<td>
						<select name="job"  size="1">
							<option value="훈련교사">훈련교사</option>
							<option value="훈련생">훈련생</option>
							<option value="웹개발자">웹개발자</option>
							<option value="웹디자이너">웹디자이너</option>
						</select>	
					</td>
				</tr>
				<tr>
					<td>나이</td>
					<td>
						<input type="radio" name="age" value="10대" >10대
						<input type="radio" name="age" value="20대" >20대
						<input type="radio" name="age" value="30대" >30대
						<input type="radio" name="age" value="40대" >40대
					</td>
				</tr>
				<tr>
      				<td>나의 정보</td>
      				<td>
      					<textarea name="info" cols="40" rows="10" class="form-control">${member.info }</textarea>
      				</td>
      			</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="수정" class="btn btn-info">
						<input type="reset" value="취소" class="btn btn-danger">
					</td>
				</tr>
			</table>
		</form>
		<a href="DeleteMemberCtrl?id=${member.id }"><input type="button" value="회원탈퇴" class="btn btn-warning"></a>
		<a href="./index.jsp"><input type="button" value="메인" class="btn btn-success"></a>
    </div>
</body>
</html>