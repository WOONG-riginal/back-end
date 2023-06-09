<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Floatleft 로그인</title>
	<link rel="stylesheet" href="assets/css/main.css" />
	<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
</head>
<body class="is-preload">
	<div id="wrapper">
		<article id="contact">

			<h2 class="major">로그인</h2>
			<div class="content">
				<form action="LoginCtrl" method="post">
					<div class="fields">
						<div class="field half">
							<label for="id">아이디</label>
							<input type="text" name="id">
						</div>
						<div class="field half">
							<label for="password">비밀번호</label>
							<input type="text" name="password" />
						</div>
					</div>
					<ul class="actions">
						<li><input type="submit" value="로그인" /></li>
						<li><input type="reset" value="취소" /></li>
					</ul>
				</form>
			</div>
			<pre><code>
	   Welcome to FloatLeft!
	   
	      Login 해주세요!
			</code></pre>
		</article>
	</div>
	<!-- BG -->
	<div id="bg"></div>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>	
</body>
</html>