<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	
	String content=request.getParameter("content");
	// null 처리
	if(content==null){
		content="/include/mainContents.jsp";
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
    <title>Web Java</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="shortcut icon" href="./images/favicon/W32.png">
    <link rel="apple-touch-icon=precomposed" href="./images/favicon/W180.png">
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/font.css">
    <!-- JS 플러그인 파일 -->
    <script src="./js/jquery-1.12.4.min.js"></script>
    <script src="./js/jquery-3.3.1.min.js"></script>
    <script src="./js/jquery-3.4.1.min.js"></script>
    <script src="./js/prefixfree.min.js"></script>
    <!-- 페이지 CSS -->
    <link rel="stylesheet" href="./css/index.css">
</head>
<body>
    <div id="wrap">
        <header>
            <jsp:include page="/include/header.jsp" />
        </header>
        <main>
            <section class="contents">
                <jsp:include page="<%=content %>" />
            </section>
        </main>
        <footer>
            <jsp:include page="/include/footer.jsp" />
        </footer>
    </div>
</body>
</html>