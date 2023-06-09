<%@page import="java.io.PrintWriter"%>
<%@page import="biz.member.bbqMemberDAO"%>
<%@page import="biz.member.bbqMemberVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
    <title>가입 완료</title>
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
    <link rel="stylesheet" href="./css/join3.css">
</head>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	
	int agree = 0;
    agree = Integer.parseInt(request.getParameter("agree"));
    
    String id=request.getParameter("id");
    String password=request.getParameter("pw");
    String name=request.getParameter("name");
    String tel=request.getParameter("tel");
    String email=request.getParameter("email");
    String mstore=request.getParameter("mstore");
    String birth=request.getParameter("birth");
    String gender=request.getParameter("gender");
    String address=request.getParameter("address");
    
    response.setContentType("text/html; charset=utf-8");
	PrintWriter write=response.getWriter();
	
    bbqMemberDAO mdao=new bbqMemberDAO();
    int result=mdao.checkIdOverlap(id);
    if(result>0){
    	write.println("<script>");
		write.println("alert('이미 사용중인 아이디입니다.');");
		write.println("history.back();");
		write.println("</script>");
		write.close();
    }
    
    bbqMemberVO member=new bbqMemberVO();
    member.setId(id);
    member.setPassword(password);
    member.setName(name);
    member.setTel(tel);
    member.setEmail(email);
    member.setMstore(mstore);
    member.setBirth(birth);
    member.setGender(gender);
    member.setAddress(address);
    
    mdao.joinMember(member);
%>
<body>
    <div id="wrap">
        <header>
            <div class="logo">
                <a href="#"><img src="./images/logo_bbq.png" alt="비비큐로고"></a>
            </div>           
            <div class="shape">
                <img src="./images/shape3.png" alt="도형">
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
                <div class="login cf">
                    <h2>
                        <span>BBQ 회원</span>이 <br>
                        되신 것을 환영합니다.
                    </h2>
                    <p class="first">
                        BBQ에서 제공하는 <br>
                        다양한 서비스를 이용하실 수 있습니다.
                    </p>
                    <%
                    	if(agree>0){
                    		%>
                 		   <p class="last">BBQ 홍보성 정보 수신 동의 : </p>
                           <div id="date"></div>
                           <script type="text/javascript">
	                           date = new Date();
	                           year = date.getFullYear();
	                           month = date.getMonth() + 1;
	                           day = date.getDate();
	                           document.getElementById("date").innerHTML = year + "." + month + "." + day + " 처리 완료";
							</script>
                           <%
                    	}
                    %>

	                  
                    <button type="button" class="login-btn" style="width:330px; height:50px" onclick="location.href='login.jsp'">로그인</button>
                </div>
            </section>
        </main>
    </div>
</body>
<script src="./js/login.js" > </script>
</html>