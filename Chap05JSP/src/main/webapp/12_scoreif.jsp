<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JSP 스크립틀릿 연습 : score</title>
	<link rel="stylesheet" href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="panel-heading">
		<h3>시험 점수 입력</h3>
	</div>
	<div class="panel-body">		
		<form action="12_scoreifCtrl.jsp" method="post" autocomplete="off">
			<table class="table">
				<tr>
					<td>시험점수</td>
					<td>
						<input type="text" name="score">
					</td>
				</tr>
				<tr>
					<td>
						<input type="submit" value="학점변환">
					</td>
				</tr>
			</table>
		</form>
	</div>
</html>