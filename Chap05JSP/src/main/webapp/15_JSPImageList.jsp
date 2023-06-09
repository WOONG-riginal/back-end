<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
	<title>이미지 리스트</title>
	<style>
		li{list-style:none;}
		.list{
			width: 80%;
			padding: 0 10px 10px;
			margin: 0 auto;
		}
		.list li{
			margin: 10px 0;
		}
		.list li span{
			margin-right: 20px;
			font-size: 20px;
		}
		img{
			width: 60px;
			height: 60px;
		}
		.list li a{
			margin-right: 24px;
		}
	</style>
</head>
<body>
	<div id="wrap">
		<header>
			<ul class="list">
				<li>
					<span>이미지</span>
					<span>이미지 이름</span>
					<span>선택</span>
				</li>
<%
	for(int i=1;i<=8;i++){
%>
				<li>
					<a href="#">
						<img src="./images/img0<%=i %>.png" alt="이미지">
					</a>
					<a href="#">이미지 이름 : 상품<%=i %></a>
					<a href="#"><input type="checkbox" name="checkbox"></a>
				</li>
<%
	}
%>				
				
			</ul>
		</header>
	</div>
</body>
</html>