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
    <title>회원 가입</title>
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
    <link rel="stylesheet" href="./css/join.css">
    <style>
        input{
            width: auto;
            margin-bottom: 16px;
            height: auto;

        }
        label{
            display: flex;
            align-items: center;
        }
        .submit {
       	    width: 330px;
   			height: 50px;
        }
    </style>
</head>

<body>

    <div id="wrap">
        <header>
            <div class="logo">
                <a href="#"><img src="./images/logo_bbq.png" alt="비비큐로고"></a>            
            </div>           
            <div class="shape">
                <img src="./images/shape.png" alt="도형">
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
        <%
        	int agree = 1;
        %>
            <section class="contents">
                <form action="join2.jsp" method="post">
                    <div class="join"> 
                        <input type="checkbox" name="all" id="all">
                        <label for="all"><i class="fa fa-check-circle"></i><p>아래 내용에 모두 동의합니다.</p></label>
                    </div>
                    <div class="box cf">
                        <div class="left">
                            <div>
                                <input type="checkbox"name="chk" id="a">
                                <label for="a"><i class="fa fa-check-circle"></i><p>BBQ 이용 약관</p></label>
                            </div>
                            <div>
                                 <input type="checkbox"name="chk" id="b">
                                 <label for="b"><i class="fa fa-check-circle"></i><p>개인 정보 수집과 이용</p></label>
                            </div>
                            <div>
                                 <input type="checkbox"name="chk" id="c">
                                 <label for="c"><i class="fa fa-check-circle"></i><p>개인정보 제3자 제공</p></label>
                            </div>
                            <div>
                                <input type="checkbox"name="chk" id="d">
                                <label for="d"><i class="fa fa-check-circle"></i><p>만 14세 이상입니다.</p></label>
                            </div>
                            <div>
                                <input type="checkbox"name="agree" id="e" value="<%=agree %>">
                                <label for="e"><i class="fa fa-check-circle"></i><p>홍보성 정보 수신동의 (선택)</p></label>
                            </div>
                        </div>
                        <div class="right">
                           <ul>
                                <li>
                                    <a href="#">전문 보기</a>
                                </li>
                                <li>
                                    <a href="#">전문 보기</a>
                                </li>
                                <li>
                                    <a href="#">전문 보기</a>
                                </li>
                           </ul>
                        </div>
                    </div>      
                    <p class="btm">회원 가입 및 본인확인을 위한 인증절차를 진행해 주세요.</p>
                    <h5 class="no_ess">휴대폰 인증</h5>
                    <input type="submit" value="휴대폰 인증" class="submit">
                </form>
            </section>
        </main>
    </div>
<script src="./js/login.js"></script>
</body>
</html>
