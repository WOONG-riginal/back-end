<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JSP 구구단 출력</title>
	<link rel="stylesheet" href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
</head>
<body>
	<h3 class="panel-heading">
		구구단수 입력
	</h3>
	<div class="panel-body">		
		<!-- <form action="14_JSPMultiCtrl.jsp" method="post" autocomplete="off"> -->
		<form action="14_JSPMultiColorCtrl.jsp" method="post" autocomplete="off">
			<table class="table">
				<tr>
					<td>출력할 구구단</td>
					<td>
						<input type="text" name="dan">
					</td>
				</tr>
				<tr>
					<td>
						<input type="submit" value="구구단 출력">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>