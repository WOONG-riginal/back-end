<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	
	String content=request.getParameter("content");
	// null 처리
	if(content==null){
		content="/include/contents_main.jsp";
	}
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="floatleft">
    <meta name="description" content="Portfolio">
    <title>BBQ치킨</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="shortcut icon" href="./images/favicon/bbq36.png">
    <link rel="apple-touch-icon=precomposed" href="./images/favicon/bbq36.png">
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/jquery.bxslider.css">
    <!-- 페이지 CSS -->
    <link rel="stylesheet" href="./css/css.css">
    <!-- JS 코어파일 -->
    <script src="./js/jquery-1.12.4.min.js"></script>
    <script src="./js/jquery-3.3.1.min.js"></script>
    <script src="./js/jquery-3.4.1.min.js"></script>
    <script src="./js/prefixfree.min.js"></script>
</head>
<body>
	<div id="curtain"></div>
    <div class="wrap">
        <header>
        	<jsp:include page="include/header.jsp" />
        </header>
        <main role="main">
        	<jsp:include page="<%=content %>" />
        </main>
        <aside class="quickmenu">
        	<jsp:include page="include/aside.jsp" />
        </aside>
        <footer>
        	<jsp:include page="include/footer.jsp" />
        </footer>
    </div>
</body>
<!-- 페이지 JS -->
<script src="./js/js.js"></script>
<script>
	$('body').append("<div class='ready'>죄송합니다. 해당 페이지는 준비중 입니다.</div>");
</script>
</html>