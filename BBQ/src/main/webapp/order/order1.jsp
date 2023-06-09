<%@page import="biz.member.bbqMemberVO"%>
<%@page import="biz.member.bbqMemberDAO"%>
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
    <title>주문하기</title>
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
    <link rel="stylesheet" href="./css/order.css">
</head>
<%
	String id = (String)session.getAttribute("id");
	if(id==null){
%>
	<script>
		alert('로그인이 필요한 서비스입니다.');
		location.href='../login_join/login.jsp';
	</script>
<%
}

	bbqMemberDAO mdao=new bbqMemberDAO();
	bbqMemberVO member=mdao.getMyPage(id);
	
	String name=member.getName();
	String tel=member.getTel();
	String req_store=member.getMstore();
%>
<body>
    <div id="wrap">
        <header>
            <div class="logo">
                <a href="#"><img src="./images/logo_bbq.png" alt="비비큐로고"></a>            
            </div>           
            <div class="shape">
                <img src="./images/shape.png" alt="도형">
                <div class="info">
                    <p>매장 선택</p>
                    <p>주문 정보 입력</p>
                    <p>주문 완료</p>
                </div>
            </div>
        </header>
        <main>
            <section class="contents">
                <form action="order2.jsp" method="post" class="login">
                    <ul>   
                        <hr>
                        <li>매장 선택하기</li>
                      	<li class="float cf">
                            <input type="text" placeholder="주문하실 매장을 선택하세요." name="orderstore" id="storeValue" class="form-control" style="width:225px; height:44px" readonly>
                            <h5 id="search-store">다른 매장 찾기</h5>
                            <h5 id="request-store">추천 매장 선택</h5>
                        </li>
                    </ul>
                    <input type="hidden" name="ordername" value="<%=name %>">
                    <input type="hidden" name="ordercontact" value="<%=tel %>">
                    <input type="submit" value="매장 선택" class="order-btn" style="width:330px; height:50px">
                </form>
            </section>
        </main>
    </div>
<script>
	const searchBtn = document.getElementById("search-store");
    searchBtn.addEventListener("click",()=>{
    	window.open("<%= request.getContextPath() %>/order/orderFindStore.jsp", "findStore", "width=700, height=400");
    });
    
    const requestBtn = document.getElementById("request-store");
    requestBtn.addEventListener("click",()=>{
    	document.getElementById("storeValue").value = "<%=req_store %>";
    });
</script>
</body>
</html>
