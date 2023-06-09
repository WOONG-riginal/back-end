<%@page import="biz.menu.bbqMenuVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="biz.menu.bbqMenuDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	
	String category=request.getParameter("category");
	if(category==null){
		category="신메뉴 (갈리시오소)";
	}
	
	bbqMenuDAO dao=new bbqMenuDAO();
	ArrayList<bbqMenuVO> menuList=dao.getCategoryMenu(category);
	
	int onNum=0;
	onNum=Integer.parseInt(request.getParameter("onNum"));
%>
<section class="content">
    <div class="sub_page">
        <div class="lnb">
            <ul class="w1440">
                <li>bbq home</li>
                <li><img src="./images/lnb_arrow.png" alt="화살표">메뉴</li>
                <li><img src="./images/lnb_arrow.png" alt="화살표">치킨</li>
                <li class="menu"><img src="./images/lnb_arrow.png" alt="화살표"><%=category %></li>
            </ul>
        </div>
        <div class="sub_content w1196">
            <div class="sub_content_header">
                <h3><%=category %></h3>
            </div>
            <div class="sub_content_body">
                <ul class="menu_tab">
                    <li><a href="index.jsp?content=sub.jsp&category=신메뉴 (갈리시오소)&onNum=0">신메뉴 (갈리시오소)</a></li>
                    <li><a href="index.jsp?content=sub.jsp&category=후라이드&onNum=1">후라이드</a></li>
                    <li><a href="index.jsp?content=sub.jsp&category=반반&onNum=2">반반</a></li>
                    <li><a href="index.jsp?content=sub.jsp&category=시즈닝&onNum=3">시즈닝</a></li>
                    <li><a href="index.jsp?content=sub.jsp&category=양념&onNum=4">양념</a></li>
                    <li><a href="index.jsp?content=sub.jsp&category=구이&onNum=5">구이</a></li>
                    <li><a href="index.jsp?content=sub.jsp&category=황올 콤보시리즈&onNum=6">황올 콤보시리즈</a></li>
                    <li><a href="index.jsp?content=sub.jsp&category=세트메뉴&onNum=7">세트메뉴</a></li>
                    <li><a href="index.jsp?content=sub.jsp&category=1인분 메뉴&onNum=8">1인분 메뉴</a></li>
                    <li><a href="index.jsp?content=sub.jsp&category=피자/버거&onNum=9">피자/버거</a></li>
                    <li><a href="index.jsp?content=sub.jsp&category=사이드메뉴&onNum=10">사이드메뉴</a></li>
                    <li><a href="index.jsp?content=sub.jsp&category=소스류&onNum=11">소스류</a></li>
                    <li><a href="index.jsp?content=sub.jsp&category=음료/주류&onNum=12">음료/주류</a></li>
                </ul>
                <div class="menu_list">
<%
	for(int i=0;i<menuList.size();i++){
		bbqMenuVO menu=menuList.get(i);
%>                
                    <div class="box">
                        <div class="img">
                            <img src="./images/<%=menu.getImg() %>" alt="메뉴이미지">
                            <button onclick="location.href='index.jsp?content=contents.jsp?no=<%=menu.getMenuno()%>'">
                            	<div class="over">
	                                <img src="./images/bg_linkcycle_more.png" alt="버튼">
	                                <a href="#">온라인주문</a>
                            	</div>
                           	</button>
                        </div>
                        <div class="info">
                            <p class="name"><%=menu.getMenu() %></p>
                            <p class="txt"><%=menu.getInfo() %></p>
                            <p class="price"><%=menu.getPrice() %></p>
                        </div>
                    </div>
<%
	}
%>
                </div>
            </div>
        </div>
    </div>
</section>
<script>
	const urlParams = new URL(location.href).searchParams;
	const onNum = urlParams.get('onNum');
    $('.menu_tab li').eq(onNum).addClass('on');
    
	$('.box .img').mouseenter(function(){
        $(this).find('.over').css({'z-index':1});
        $(this).find('.over a').animate({bottom:0},300);
    });
    $('.box .img').mouseleave(function(){
        $(this).find('.over').css({'z-index':-1});
        $(this).find('.over a').animate({bottom:-50},300);
    });
</script>