<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Model2 회원가입</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/css.css">
</head>
<body>
    <div id="wrap" class="card-body">
    	<h1>회원가입</h1>
        <form action="MemberJoinCtrl.do" method="post" autocomplete="off">
			<table class="table table-bordered">
				<tr>
					<td>아이디</td>
					<td>
						<input type="text" name="id" class="form-control inputid" placeholder="id입력" required/>
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="pass1" class="form-control" placeholder="비밀번호 입력" required/></td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td><input type="password" name="pass2" class="form-control" placeholder="비밀번호 입력" required/></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="email" name="email" class="form-control" placeholder="이메일@호스트명"  required></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" name="tel" class="form-control" placeholder="전화번호 입력" required></td>
				</tr>
				<tr>
					<td>취미</td>
					<td>
						<input type="checkbox" name="hobby" value="캠핑">캠핑&nbsp;&nbsp;
						<input type="checkbox" name="hobby" value="레고">레고&nbsp;&nbsp;
						<input type="checkbox" name="hobby" value="음악">음악&nbsp;&nbsp;
						<input type="checkbox" name="hobby" value="영화">영화
					</td>
				</tr>
				<tr>
					<td>직업</td>
					<td>
						<select name="job"  size="1">
							<option value="기획자">기획자</option>
							<option value="디자이너">디자이너</option>
							<option value="개발자">개발자</option>
							<option value="훈련교사">훈련교사</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>나이</td>
					<td>
						<input type="radio" name="age" value="10" >10대&nbsp;&nbsp;
						<input type="radio" name="age" value="20" >20대&nbsp;&nbsp;
						<input type="radio" name="age" value="30" >30대&nbsp;&nbsp;
						<input type="radio" name="age" value="40" >40대
					</td>
				</tr>
				<tr>
      				<td>나의 정보</td>
      				<td>
      					<textarea name="info" cols="30" rows="10" class="form-control"></textarea>
      				</td>
      			</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="회원가입" class="btn btn-primary">
						<input type="reset" value="취소" class="btn btn-danger">
					</td>
				</tr>
			</table>
		</form>
    </div>
</body>
</html>