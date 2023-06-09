<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="id" value="${id }" scope="session" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/css.css">
</head>
<body>
<script type="text/javascript">
            function memberCheck(){
                window.open("<%= request.getContextPath() %>/memberCheck.jsp", "member", "width=640, height=400")
            }
</script>
    <div id="wrap" class="card-body">
    	<h1>회원가입</h1>
        <form action="JoinMemberCtrl" method="post" autocomplete="off">
			<table class="table table-bordered">
				<tr>
					<td>아이디</td>
					<td class="inputid">
						<input type="text" name="id" class="form-control inputid" placeholder="아이디 중복여부를 확인하세요" value="${id }" readonly required/>
						<a href="javascript:memberCheck()" class="btn btn-warning">ID 확인</a>
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="password" class="form-control" placeholder="비밀번호를 입력하세요" required/></td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td><input type="password" name="pwcheck" class="form-control" placeholder="비밀번호를 입력하세요" required/></td>
				</tr>
				<tr>
					<td>이름</td>
					<td>
						<input type="text" name="name" class="form-control" placeholder="이름을 입력하세요" required/>
					</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="email" name="email" class="form-control" placeholder="이메일을 입력하세요"  required></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" name="tel" class="form-control" placeholder="전화번호를 입력하세요" required></td>
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
      					<textarea name="info" cols="40" rows="10" class="form-control"></textarea>
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