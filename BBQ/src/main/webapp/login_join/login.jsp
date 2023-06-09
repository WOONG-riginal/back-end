<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="HoRim">
    <meta name="description" content="포트폴리오, 플롯레이아웃">
    <title>로그인</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"> 
    <link rel="stylesheet" href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">   
    <!-- 기본 코딩 JS 파일 -->
    <script src="./js/jquery-1.12.4.min.js"></script>
    <script src="./js/jquery-3.3.1.min.js"></script>
    <script src="./js/jquery-3.4.1.min.js"></script>
    <script src="./js/prefixfree.min.js"></script>
    <!-- 기본 코딩 CSS 파일 -->
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/notosans_kr_CDN.css">    
    <link rel="stylesheet" href="./css/login.css">
    
</head>
<body>
    <div id="wrap">
        <header>
            <div class="logo">
                <a href="#"><img src="./images/logo_bbq.png" alt="비비큐로고"></a>            
            </div>           
        </header>
        <main>            
            <section class="contents">                
                <form action="MemberLoginCtrl.jsp" method="post" class="login">
                    <ul>
                        <li>                            
                            <input type="text" class="form-control" name="id" id="id" placeholder="아이디" autocomplete="off">
                        </li>
                        <li>                            
                            <input type="password" class="form-control" name="pw" id="pw" placeholder="비밀번호">
                        </li>   
                    </ul>                             
                    <div class="sns_login">
                        <div class="even">
                            <input type="checkbox" name="chk" id="checkId" />
                            <label for="checkId"><i class="fa fa-check-circle"></i><p>아이디 저장</p></label>                             
                            <input type="checkbox" name="none" id="c" />
                            <label for="c"><i class="fa fa-check-circle"></i><p>로그인 상태유지</p></label>  
                        </div>
                    </div>      
                    <ul>
                        <li>
                            <input type="submit" value="로그인" class="login-btn" style="width:100%; height:50px">
                        </li>
                    </ul>
                    <ul class="find">
                        <li>
                            <a href="#">아이디 찾기</a>
                            <span>|</span>
                        </li>
                        <li>
                            <a href="#">비밀번호 찾기</a> 
                            <span>|</span>
                        </li>                
                        <li>
                            <a href="./join1.jsp">회원가입 </a>                            
                        </li>
                    </ul>
                    <div class="horizontal-line">
                        <hr>
                        <span>또는</span>
                    </div>                    
                    <div class="sns_login">
                          
                        <button class="sns-btn"><span class="kakao">kakao</span>로 로그인</button> <br>
                        <button class="sns-btn"><span class="fb">facebook</span>으로 로그인</button> <br>
                        <button class="sns-btn"><span class="payco">PAYCO</span>로 로그인</button> <br>
                        <button class="sns-btn"><span class="apple"><i class="fa fa-apple"></i>&nbsp;Apple</span>로 로그인</button>
                    </div>                                    
                </form>
            </section>
        </main>        
    </div>


</body>
<script>   
      // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
       var key = getCookie("key");
       $("#id").val(key); 
        
       // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
       if($("#id").val() != ""){ 
           $("#checkId").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
       }
        
       $("#checkId").change(function(){ // 체크박스에 변화가 있다면,
           if($("#checkId").is(":checked")){ // ID 저장하기 체크했을 때,
               setCookie("key", $("#id").val(), 1); // 1일 동안 쿠키 보관
           }else{ // ID 저장하기 체크 해제 시,
               deleteCookie("key");
           }
       });
        
       // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
       $("#id").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
           if($("#checkId").is(":checked")){ // ID 저장하기를 체크한 상태라면,
               setCookie("key", $("#id").val(), 1); // 1일 동안 쿠키 보관
           }
       });
   
      // 쿠키 저장하기 
      // setCookie => saveid함수에서 넘겨준 시간이 현재시간과 비교해서 쿠키를 생성하고 지워주는 역할
      function setCookie(cookieName, value, exdays) {
         var exdate = new Date();
         exdate.setDate(exdate.getDate() + exdays);
         var cookieValue = escape(value)
               + ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
         document.cookie = cookieName + "=" + cookieValue;
      }
   
      // 쿠키 삭제
      function deleteCookie(cookieName) {
         var expireDate = new Date();
         expireDate.setDate(expireDate.getDate() - 1);
         document.cookie = cookieName + "= " + "; expires="
               + expireDate.toGMTString();
      }
        
      // 쿠키 가져오기
      function getCookie(cookieName) {
         cookieName = cookieName + '=';
         var cookieData = document.cookie;
         var start = cookieData.indexOf(cookieName);
         var cookieValue = '';
         if (start != -1) { // 쿠키가 존재하면
            start += cookieName.length;
            var end = cookieData.indexOf(';', start);
            if (end == -1){
               // 쿠키 값의 마지막 위치 인덱스 번호 설정 
               end = cookieData.length;
            }
                console.log("end위치  : " + end);
            cookieValue = cookieData.substring(start, end);
         }
         return unescape(cookieValue);
      }
   
</script>
</html>