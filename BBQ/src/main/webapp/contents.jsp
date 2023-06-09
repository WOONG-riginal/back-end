<%@page import="biz.menu.bbqMenuVO"%>
<%@page import="biz.menu.bbqMenuDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	
	int menuno=Integer.parseInt(request.getParameter("no"));
	bbqMenuDAO dao = new bbqMenuDAO();
	bbqMenuVO menu = dao.getMenuInfo(menuno);
	
	String temp1="";
	String temp2="";
	String temp3="";
	String temp4="";
	String temp5="";
	if(menu.getNutri1()!=0){
		temp1+=menu.getNutri1();
	}
	if(menu.getNutri2()!=0){
		temp2+=menu.getNutri2();
	}
	if(menu.getNutri3()!=0){
		temp3+=menu.getNutri3();
	}
	if(menu.getNutri4()!=0){
		temp4+=menu.getNutri4();
	}
	if(menu.getNutri5()!=0){
		temp5+=menu.getNutri5();
	}
	String origin="";
	if(menu.getOrigin()!=null){
		origin=menu.getOrigin();
	}
	String allergy="";
	if(menu.getAllergy()!=null){
		allergy=menu.getAllergy();
	}
%>     
<section class="content">
    <div class="contents_page">
        <div class="lnb">
            <ul class="w1440">
                <li>bbq home</li>
                <li><img src="./images/lnb_arrow.png" alt="화살표">메뉴</li>
                <li><img src="./images/lnb_arrow.png" alt="화살표">치킨</li>
                <li class="menu"><img src="./images/lnb_arrow.png" alt="화살표"><%=menu.getCategory() %></li>
            </ul>
        </div>
    </div>
    <!-- Contents -->
    <article class="contents content-wide">
        <section class="section">
            <!-- 메뉴 보기 -->
            <div class="menu-viewTop" style="height:680px;">
                <div class="inner">
                    <!--상품이미지-->
                    <div class="menu_detail_img">
                        <img src="./images/<%=menu.getImg() %>" alt="<%=menu.getMenu() %>" width="488px" height="479px" class="jackInTheBox">
                    </div>
                    <!--//상품정보-->
                    <div class="info">
                        <h3><%=menu.getMenu() %></h3>
                        <dl class="nut">
                            <dt>영양정보</dt>
                            <dd>
                                <ul>
                                    <li class="circle1">
                                        <span>
                                            <strong>열량</strong>
                                            <em>(kcal)</em>
                                        </span>
                                        <p><%=temp1 %></p>
                                    </li>
                                    <li class="circle2">
                                        <span>
                                            <strong>당류</strong>
                                            <em>(g)</em>
                                        </span>
                                        <p><%=temp2 %></p>
                                    </li>
                                    <li class="circle3">
                                        <span>
                                            <strong>단백질</strong>
                                            <em>(g)</em>
                                        </span>
                                        <p><%=temp3 %></p>
                                    </li>
                                    <li class="circle4">
                                        <span>
                                            <strong>포화지방</strong>
                                            <em>(g)</em>
                                        </span>
                                        <p><%=temp4 %></p>
                                    </li>
                                    <li class="circle5">
                                        <span>
                                            <strong>나트륨</strong>
                                            <em>(mg)</em>
                                        </span>
                                        <p><%=temp5 %></p>
                                    </li>
                                </ul>
                            </dd>
                        </dl>
                        <ul class="alert">
                            <li>원산지 <%=origin %></li>
                            <li>100g 당 함량 기준으로 표기</li>
                        </ul>
                        <div class="caution">
                            매장별로 가격이 상이 할 수 있습니다.<br/>
                            매장방문 식사시 가격이 상이 할 수 있습니다.<br/>
                            사진은 실제 상품과 다를 수 있습니다.
                        </div>
                        <div class="allergy">
                        <p class="allergy_tit">알레르기 정보</p>
                        <p class="allergy_desc"><%=allergy %></p>
                        </div>	
                    </div>
                </div>
            </div>
        </section>
    </article>
    <!-- 장바구니 담기 -->
    <div class="cart">
        <div class="inner">
            <button type="button" class="btn btn_other_menu" onclick="history.back()">다른메뉴보기</button>
            <button type="button" class="btn btn_cart_go onlien-order" onclick="javascript:neworder()">온라인주문</button>
        </div>
    </div>
</section>
<script>
	function neworder(){
	    window.open("<%= request.getContextPath() %>/order/order1.jsp", "order", "width=450, height=680")
	}
</script>