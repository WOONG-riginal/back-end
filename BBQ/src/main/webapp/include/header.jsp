<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	
	// 세션 사용 로그인
	String id = (String)session.getAttribute("id");
	String role = (String)session.getAttribute("role");
	if(id==null){
		id = "Guest";
	}
%>
<div class="gnb w1440 cf">
    <nav class="familyBrand">
        <ul class="cf">
            <li class="bbq">비비큐치킨</li>
            <li>비비큐몰</li>
            <li>닭익는마을</li>
            <li>우쿠야</li>
            <li>올떡</li>
            <li>창업</li>
        </ul>
    </nav>
    <nav class="user-tab">
        <ul class="cf">
<%
	if(id.equals("Guest")){
%>
            <li><a href="javascript:login()">로그인</a></li>
            <li><a href="javascript:join()">회원가입</a></li>
            <li><a href="index.jsp?content=customer.jsp">고객센터</a></li>
<%		
	} else if(role.equals("A")) {
%>
            <li><a href="login_join/MemberLogoutCtrl.jsp">로그아웃</a></li>
            <li><a href="index.jsp?content=adminpage.jsp">관리자페이지</a></li>
            <li><a href="#" class="disable-btn">주문센터</a></li>
<%		
	} else {
%>
            <li><a href="login_join/MemberLogoutCtrl.jsp">로그아웃</a></li>
            <li><a href="index.jsp?content=mypage.jsp">마이페이지</a></li>
            <li><a href="index.jsp?content=customer.jsp">고객센터</a></li>
<%		
	}
%>        
        </ul>
    </nav>
</div>
<div class="navigation w1440 cf">
    <div class="navigation-left">
        <div class="main_con_popular">
            <h1>
                <a href="<%=request.getContextPath() %>"><img src="./images/logo_header_bbq.png" alt=""></a>
            </h1>
            <div class="best">
                <img src="./images/popular_img01.png" alt="" />
                <span>실시간 인기</span>
            </div>
        </div>
        <div class="kind-wrap">
            <div class="kind-slider">
                <ul class="slider">
                	<li class="on"><a href="index.jsp?content=contents.jsp?no=4">1. 황금올리브치킨™</a></li>
                    <li><a href="index.jsp?content=contents.jsp?no=5">2. 황금올리브치킨™순살</a></li>
                    <li><a href="index.jsp?content=contents.jsp?no=40">3. 자메이카 통다리구이</a></li>
                    <li><a href="index.jsp?content=contents.jsp?no=6">4. 황금올리브™닭다리</a></li>
                    <li><a href="index.jsp?content=contents.jsp?no=32">5. 오리지날 양념치킨</a></li>
                    <li><a href="index.jsp?content=contents.jsp?no=10">6. 핫황금올리브치킨™</a></li>
                    <li><a href="index.jsp?content=contents.jsp?no=33">7. 황금올리브 순살양념</a></li>
                    <li><a href="index.jsp?content=contents.jsp?no=11">8. 크런치 순살크래커</a></li>
                    <li><a href="index.jsp?content=contents.jsp?no=43">9. 황금올리브치킨™콤보</a></li>
                    <li><a href="index.jsp?content=contents.jsp?no=41">10. 스모크 치킨</a></li>
                </ul>
            </div>
            <div class="arrow">
                <a href="#" class="prev">이전</a>
                <a href="#" class="next">다음</a>
            </div>
        </div>
        
    </div>
    <nav class="lnb">
        <ul>
            <li class="lnb-main">
                <a href="index.jsp?content=sub.jsp&onNum=0">메뉴소개</a>
                <ul class="lnb-serve">
                    <li><a href="index.jsp?content=sub.jsp&category=신메뉴 (갈리시오소)&onNum=0">신메뉴(갈리시오소)</a></li>
                    <li><a href="index.jsp?content=sub.jsp&category=후라이드&onNum=1">후라이드</a></li>
                    <li><a href="index.jsp?content=sub.jsp&category=반반&onNum=2">반반</a></li>
                    <li><a href="index.jsp?content=sub.jsp&category=시즈닝&onNum=3">시즈닝</a></li>
                    <li><a href="index.jsp?content=sub.jsp&category=양념&onNum=4">양념</a></li>
                    <li><a href="index.jsp?content=sub.jsp&category=구이&onNum=5">구이</a></li>
                </ul>
            </li>
            <li class="lnb-main">
                <a href="index.jsp?content=sub_findstore.jsp">매장찾기</a>
                <ul class="lnb-serve">
                    <li><a href="index.jsp?content=sub_findstore.jsp">매장찾기</a></li>
                </ul>
            </li>
            <li class="lnb-main brand disable-btn">
                브랜드
                <ul class="lnb-serve">
                    <li>브랜드 스토리</li>
                    <li>공지사항</li>
                    <li>사회공헌활동</li>
                </ul>
            </li>
            <li class="lnb-main start-up disable-btn">
                창업정보
                <ul class="lnb-serve">
                    <li>창업정보</li>
                </ul>
            </li>
            <li class="lnb-main event disable-btn">
                이벤트
                <ul class="lnb-serve">
                    <li>진행중인이벤트</li>
                    <li>지난이벤트</li>
                </ul>
            </li>
            <li class="order lnb-main"  onclick="javascript:neworder()">온라인주문</li>
        </ul>
    </nav>
    <div class="bg-lnb"></div>
</div>
<script type="text/javascript">
    function join(){
        window.open("<%= request.getContextPath() %>/login_join/join1.jsp", "join", "width=450, height=680")
    }
    function login(){
        window.open("<%= request.getContextPath() %>/login_join/login.jsp", "login", "width=450, height=680")
    }
    function neworder(){
        window.open("<%= request.getContextPath() %>/order/order1.jsp", "order", "width=450, height=680")
    }
</script>