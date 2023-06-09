<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="shortcut icon" href="./images/favicon/favicon32.png">
    <link rel="apple-touch-icon=precomposed" href="./images/favicon/favicon180.png">
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
    <h2>로그인</h2>
    <form action="memberLoginCtrl.jsp" method="post" class="login">
        <ul>
            <li>
                <label for="id">아이디 : </label>
                <input type="text" name="id" id="id" placeholder="id">
            </li>
            <li>
                <label for="pw">비밀번호 : </label>
                <input type="password" name="pw" id="pw" placeholder="password">
            </li>
            <li>
                <input type="submit" value="LOGIN" class="btn btn-primary"> &nbsp;&nbsp;
                <input type="reset" value="CANCEL" class="btn btn-secondary">
            </li>
        </ul>
    </form>
</body>
</html>