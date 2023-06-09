<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section class="section-visual w1440 cf">
    <div class="box-slider">
        <!-- BxSlider 이미지 -->
        <ul class="slide_gallery">
            <li><img src="./images/main_banner_slider.png" alt="슬라이드01"></li>
            <li><img src="./images/main_banner_slider2.png" alt="슬라이드02"></li>
            <li><img src="./images/main_banner_slider3.png" alt="슬라이드03"></li>
        </ul>
        <div class="infomation">
            <div class="online-order">
                <h2>온라인 주문</h2>
                <button class="disable-btn">주문하기</button>
            </div>
            <div class="store-info">
                <h2>매장안내</h2>
                <form action="index.jsp?content=sub_findstore.jsp" method="post">
	                <input type="text" name="store" placeholder="매장명 또는 도로명주소"/>
	                <button class="search"></button>
                </form>
                <div class="more-store">
                    <button onclick="location.href='index.jsp?content=sub_findstore.jsp'">전체매장 보기</button>
                </div>
            </div>
        </div>
    </div>
</section>
<section class="section-notice w1440">
    <div class="main-notice-container">
        <div class="main-notice-box">
            <iframe
                width="473"
                height="233"
                src="https://www.youtube.com/embed/3Q8VJ2bfkNk"
                title="BBQ Garlicioso 3종 : 갈리시오소 바삭갈릭, 단짠갈릭, 착착갈릭 - long ver"
                frameborder="0"
                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                allowfullscreen="allowfullscreen">
            </iframe>
        </div>
        <div class="main-notice-box main-side-menu">
            <h2>사이드메뉴</h2>
            <button onclick="location.href='index.jsp?content=sub.jsp?category=사이드메뉴&onNum=10'">메뉴보기</button>
        </div>
        <div class="main-notice-box ">
            <div class="main-notice-title">
                <h2>공지사항</h2>
                <button class="more disable-btn"></button>
            </div>
            <div class="main-notice-p">
                <p>“올리브토큰(OLV)”의 불법성과 관련한 고지</p>
                <p>2022-05-18</p>
            </div>
            <div class="main-notice-p">
                <p>카이카스 지갑 생성 방법</p>
                <p>2022-02-03</p>
            </div>
            <div class="main-notice-p">
                <p>제너시스 BBQ, 끊임없는 혁신 통해 2022년을...</p>
                <p>2022-01-07</p>
            </div>
        </div>
    </div>
</section>
<section class="section-event w1440">
    <div class="main-event-container">
        <div class="main-event-card">
            <p>이벤트</p>
            <img src="./images/main_event.png" alt="이벤트 이미지">
        </div>
        <div class="main-event-card">
            <p>멤버쉽</p>
            <img src="./images/main_membership.png" alt="이벤트 이미지">
        </div>
        <div class="main-event-card">
            <p>창업문의</p>
            <img src="./images/main_startup.png" alt="이벤트 이미지">
        </div>
    </div>
</section>
<!-- 박스 슬라이더 JS -->
<script src="./js/jquery.bxslider.js"></script>
<script>
	$(".slide_gallery").bxSlider({
	    mode:"fade",
	    pager:true,
	    auto:true,
	    slideWidth:957,
	    slideHeight:448
	})
</script>