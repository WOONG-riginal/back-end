<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
    <style>
      #wrap {
         width: 960px;
         margin: 40px auto;
      }   
   </style>
</head>
<body>
    <div id="wrap" class="card-body">
      <header>
         <h3>회원가입</h3>
      </header>
      <section>
         <form action="JoinCtrl" method="post">
            <table class="table table-bordered">
               <tr>
                  <td>아이디</td>
                  <td>
                     <input type="text" name="id" class="form-control" />
                  </td>
               </tr>
               <tr>
                  <td>비밀번호</td>
                  <td>
                     <input type="password" name="password" id="pw" size="10" class="form-control" />
                  </td>
               </tr>
               <tr>
                  <td>비밀번호확인</td>
                  <td>
                     <input type="password" name="passwordck" id="pwck" size="10" class="form-control" />
                  </td>
               </tr>
               
               <tr>
                  <td>이름</td>
                  <td>
                     <input type="text" name="name" size="10"id="name" class="form-control" />
                  </td>
               </tr>
               <tr>
                  <td>구분</td>
                  <td>
                     <select name="role" id="role">
                        <option value="Users">회원</option>
                        <option value="Admin">관리자</option>
                     </select>
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
      </section>
   </div>
</body>
<script>
   
    const pw = document.getElementById("pw");
    const pwck = document.getElementById("pwck");
    const name = document.getElementById("name");
    pwck.addEventListener("focusout",()=>{
        if(pwck.value != ""){
            if(pw.value != pwck.value) {
                alert("비밀번호가 일치하지 않습니다.")
            }
            else{
                alert("비밀번호가 일치합니다.")
            }
            name.focus();
         }
    })
</script>
</html>