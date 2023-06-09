<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>글쓰기</title>
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
   <style>
      #wrap {
         width: 960px;
         margin: 40px auto;
         text-align: center;
         border: 1px solid #ccc;
         padding: 40px 0;
      }
   </style>
</head>
<body>
   <div id="wrap" class="card-body">
      <header>
         <h3>글쓰기</h3>
      </header>
      <section>
      	<form action="./addBoardCtrl.jsp" method="post">
      		<table class="table table-bordered">
      			<tr>
      				<td>제목</td>
      				<td>
      					<input type="text" name="title" class="form-control" />
      				</td>
      			</tr>
      			<tr>
      				<td>작성자</td>
      				<td>
      					<input type="text" name="nickname" size="10" class="form-control" />
      				</td>
      			</tr>
      			<tr>
      				<td>내용</td>
      				<td>
      					<textarea name="content" cols="40" rows="10" class="form-control"></textarea>
      				</td>
      			</tr>
      			<tr>
      				<td colspan="2">
      					<input type="submit" value="등록" class="btn btn-primary"/>
      					<input type="reset" value="취소" class="btn btn-danger"/>
      				</td>
      			</tr>
      		</table>
      	</form>
      	<a href="./index.jsp"><input type="button" value="메인" class="btn btn-success"/></a>
      	<a href="./getBoardList.jsp"><input type="button" value="목록" class="btn btn-secondary"/></a>
      </section>
   </div>
</body>
</html>