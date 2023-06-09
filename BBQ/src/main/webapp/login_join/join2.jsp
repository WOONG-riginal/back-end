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
    <title>회원 정보 입력</title>
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
    <link rel="stylesheet" href="./css/join2.css">
</head>
<%
	int agree=0;
	if(request.getParameter("agree")!=null){
		agree=1;
	}
%>
<body>
    <div id="wrap">
        <header>
            <div class="logo">
                <a href="#"><img src="./images/logo_bbq.png" alt="비비큐로고"></a>            
            </div>           
            <div class="shape">
                <img src="./images/shape2.png" alt="도형">
                <div class="info">
                    <p>
                        약관 동의 및<br>
                        본인 인증
                    </p>
                    <p>회원 정보 입력</p>
                    <p>가입 완료</p>
                </div>
            </div>
        </header>
        <main>            
            <section class="contents">                
                <form action="join3.jsp" method="post" class="login">
                    <ul>
                        <li>
                        <input type="text" class="form-control" name="id" id="id" placeholder="아이디(영문, 숫자 조합 6~16자리)" required>
                        <span id="idError" class="error"></span>
                   </li>
                   <li>
                        <input type="password" class="form-control" name="pw" id="pw" placeholder="비밀번호(영문, 숫자, 특수문자 조합 8~20자리)" required>
                        <span id="pwError" class="error"></span>
                   </li>             
                   <li>                            
                            <input type="password" class="form-control" name="pwchk" id="pwchk" placeholder="비밀번호 다시 입력" required>
                            <span id="pwchkError" class="error"></span>                            
                        </li>   
                        <li>                            
                        
                            <input type="text" class="form-control" name="name" id="name" placeholder="이름"  required>
                        </li>
                        <li>                            
                            <input type="tel" class="form-control" name="tel"id="phone" placeholder="휴대폰번호" required>
                        </li>   
                        <li>                            
                            <input type="email" class="form-control" name="email" id="email"placeholder="이메일 주소" required>
                        </li>   
                        <hr>
                        <li>
                            선택 입력
                        </li>
                      <li class="float cf">
                            <input type="text" placeholder="추천 매장 등록하기" name="mstore" id="storeValue" class="form-control" style="width:225px; height:44px" readonly>
                            <h5 id="search-store">매장 찾기</h5>
                        </li>
                        <li class="select">
                            <input type="text" placeholder="생년월일 8자리" name="birth" id="birth"class="form-control" style="width: 200px; height: 44px;">
                            <input type="radio" value="남자" name="gender" id="male" class="form-control"><label for="male">남자</label>
                            <input type="radio" value="여자" name="gender" id="female" class="form-control"><label for="female">여자</label>
                        </li>
                        <li class="float cf">
                            <input type="text" placeholder="주소 찾기" name="address" id="addressValue" class="form-control" style="width:225px; height:44px" readonly>
                            <h5 id="search-address" onclick="findAddr()">주소 찾기</h5>
                        </li>
                    </ul>                              
                    <input type="hidden" name="agree" id="agree" value ="<%=agree %>"/>
                    <h6 class="no_vali">가입</h6>
                    <input type="submit" value="가입" class="join-btn" style="width:330px; height:50px">
                </form>
            </section>
        </main>        
    </div>
<script src="./js/login.js"></script>
<script>
	const searchBtn = document.getElementById("search-store");
    searchBtn.addEventListener("click",()=>{
    	window.open("<%= request.getContextPath() %>/login_join/joinFindStore.jsp", "findStore", "width=700, height=400");
    });
</script>
<script>
function findAddr(){
	new daum.Postcode({
        oncomplete: function(data) {
        	
        	console.log(data);
        	
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var jibunAddr = data.jibunAddress; // 지번 주소 변수
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            // document.getElementById('member_post').value = data.zonecode;
            if(roadAddr !== ''){
                document.getElementById("addressValue").value=roadAddr+" ";
                $('#addressValue').prop('readonly', false);
                $('#addressValue').focus();
            } 
            else if(jibunAddr !== ''){
                document.getElementById("addressValue").value=jibunAddr+" ";
                $('#addressValue').prop('readonly', false);
                $('#addressValue').focus();
            }
        }
    }).open();
}
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>
</html>
