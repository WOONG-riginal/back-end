<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
   <title>관리자 페이지</title>
   <style>
      #wrap {
         width: 960px;
         margin: 40px auto;
         text-align: center;
         border: 1px solid #ccc;
         padding: 40px 0;
      }
      a:hover {
         color:red;
      }
   </style>
</head>
<body>
    <div id="wrap" class="card-body">
        <header>
            <h1>관리자 페이지</h1>
            <div>
                <a href="LogoutCtrl">로그아웃</a> |
                <a href="./getUserList.jsp">회원목록</a> |
                <a href="GetBoardListCtrl">글목록</a> |
                <a href="./addBoard.jsp">글쓰기</a>
            </div>
        </header>
    </div>
</body>
</html>