<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${empty id }">
	<c:redirect url="login.jsp"/>
</c:if>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 확인</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/css.css">
</head>
<body>
    <div id="wrap" class="card-body">
      <header>
         <h3>비밀번호 확인</h3>
      </header>
      <section>
      	<form action="CheckInfo" method="post">
      		<table class="table table-bordered">
      			<tr>
      				<td>아이디</td>
      				<td>
      					<input type="hidden" name="id"  value="${id }"/>${id }
      				</td>
      			</tr>
      			<tr>
      				<td>비밀번호</td>
      				<td>
      					<input type="password" name="password" />
      				</td>
      			</tr>
      			<tr>
      				<td colspan="2">
      					<input type="submit" value="확인" class="btn btn-primary"/>
      					<input type="reset" value="취소" class="btn btn-secondary"/>
      				</td>
      			</tr>
      		</table>
      	</form>
      	<a href="./index.jsp"><input type="button" value="메인" class="btn btn-success"></a>
      </section>
   </div>
</body>
</html>