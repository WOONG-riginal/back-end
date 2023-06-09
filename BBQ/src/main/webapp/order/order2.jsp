<%@page import="biz.menu.bbqMenuVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="biz.menu.bbqMenuDAO"%>
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
    <title>주문 정보 입력</title>
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
    <link rel="stylesheet" href="./css/order2.css">
</head>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	
	bbqMenuDAO dao=new bbqMenuDAO();
	ArrayList<bbqMenuVO> menuList1=dao.getCategoryMenu("신메뉴 (갈리시오소)");
	ArrayList<bbqMenuVO> menuList2=dao.getCategoryMenu("후라이드");
	ArrayList<bbqMenuVO> menuList3=dao.getCategoryMenu("반반");
	ArrayList<bbqMenuVO> menuList4=dao.getCategoryMenu("시즈닝");
	ArrayList<bbqMenuVO> menuList5=dao.getCategoryMenu("양념");
	ArrayList<bbqMenuVO> menuList6=dao.getCategoryMenu("구이");
	ArrayList<bbqMenuVO> menuList7=dao.getCategoryMenu("황올 콤보시리즈");
	ArrayList<bbqMenuVO> menuList8=dao.getCategoryMenu("세트메뉴");
	ArrayList<bbqMenuVO> menuList9=dao.getCategoryMenu("1인분 메뉴");
	ArrayList<bbqMenuVO> menuList10=dao.getCategoryMenu("피자/버거");
	
	String ordername=request.getParameter("ordername");
	String ordercontact=request.getParameter("ordercontact");
	String orderstore=request.getParameter("orderstore");
	
	if(orderstore.equals("")||orderstore.equals("null")){
%>
	<script>
		alert('주문할 매장을 선택하세요.');
		history.back();
	</script>
<%
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
                    <p>매장 선택</p>
                    <p>주문 정보 입력</p>
                    <p>주문 완료</p>
                </div>
            </div>
        </header>
        <main>            
            <section class="contents">                
                <form action="order3.jsp" method="post" class="login">
                    <ul>
                        <li>
                            <input type="text" class="form-control" id="fform" name="ordername" value="<%=ordername %>" readonly>
                        </li>
                        <li>                            
                            <input type="text" class="form-control" id="ffform" name="ordercontact" value="<%=ordercontact %>" readonly>
                        </li>   
                        <li>                            
                            <input type="text" class="form-control" id="fffform" name="orderstore" value="<%=orderstore %>" readonly>
                        </li>   
                        <hr>
                        <li>
                            주문 정보
                        </li>
                        <li class="menu-select">
                        	&nbsp;메뉴 선택
                        	<ul>
                        		<h3>신메뉴 (갈리시오소)</h3>
                        		<li>
<%
	for(int i=0;i<menuList1.size();i++){
		bbqMenuVO menu=menuList1.get(i);
%>
                        			<input type="radio" value="<%=menu.getMenuno()%>" id="<%=menu.getMenuno()%>" name="ordermenu" class="form-control">
                        			<label for="<%=menu.getMenuno()%>">
                        				<img src="../images/<%=menu.getImg() %>" alt="메뉴이미지">
                        				<p><%=menu.getMenu() %></p>
                        				<p><%=menu.getPrice() %></p>
                       				</label>
<%
	}
%>
                       			</li>
                       		</ul>
                        	<ul>
                        		<h3>후라이드</h3>
                        		<li>
<%
	for(int i=0;i<menuList2.size();i++){
		bbqMenuVO menu=menuList2.get(i);
%>
                        			<input type="radio" value="<%=menu.getMenuno()%>" id="<%=menu.getMenuno()%>" name="ordermenu" class="form-control">
                        			<label for="<%=menu.getMenuno()%>">
                        				<img src="../images/<%=menu.getImg() %>" alt="메뉴이미지">
                        				<p><%=menu.getMenu() %></p>
                        				<p><%=menu.getPrice() %></p>
                       				</label>
<%
	}
%>
                       			</li>
                       		</ul>
                        	<ul>
                        		<h3>반반</h3>
                        		<li>
<%
	for(int i=0;i<menuList3.size();i++){
		bbqMenuVO menu=menuList3.get(i);
%>
                        			<input type="radio" value="<%=menu.getMenuno()%>" id="<%=menu.getMenuno()%>" name="ordermenu" class="form-control">
                        			<label for="<%=menu.getMenuno()%>">
                        				<img src="../images/<%=menu.getImg() %>" alt="메뉴이미지">
                        				<p><%=menu.getMenu() %></p>
                        				<p><%=menu.getPrice() %></p>
                       				</label>
<%
	}
%>
                       			</li>
                       		</ul>
                        	<ul>
                        		<h3>시즈닝</h3>
                        		<li>
<%
	for(int i=0;i<menuList4.size();i++){
		bbqMenuVO menu=menuList4.get(i);
%>
                        			<input type="radio" value="<%=menu.getMenuno()%>" id="<%=menu.getMenuno()%>" name="ordermenu" class="form-control">
                        			<label for="<%=menu.getMenuno()%>">
                        				<img src="../images/<%=menu.getImg() %>" alt="메뉴이미지">
                        				<p><%=menu.getMenu() %></p>
                        				<p><%=menu.getPrice() %></p>
                       				</label>
<%
	}
%>
                       			</li>
                       		</ul>
                        	<ul>
                        		<h3>양념</h3>
                        		<li>
<%
	for(int i=0;i<menuList5.size();i++){
		bbqMenuVO menu=menuList5.get(i);
%>
                        			<input type="radio" value="<%=menu.getMenuno()%>" id="<%=menu.getMenuno()%>" name="ordermenu" class="form-control">
                        			<label for="<%=menu.getMenuno()%>">
                        				<img src="../images/<%=menu.getImg() %>" alt="메뉴이미지">
                        				<p><%=menu.getMenu() %></p>
                        				<p><%=menu.getPrice() %></p>
                       				</label>
<%
	}
%>
                       			</li>
                       		</ul>
                        	<ul>
                        		<h3>구이</h3>
                        		<li>
<%
	for(int i=0;i<menuList6.size();i++){
		bbqMenuVO menu=menuList6.get(i);
%>
                        			<input type="radio" value="<%=menu.getMenuno()%>" id="<%=menu.getMenuno()%>" name="ordermenu" class="form-control">
                        			<label for="<%=menu.getMenuno()%>">
                        				<img src="../images/<%=menu.getImg() %>" alt="메뉴이미지">
                        				<p><%=menu.getMenu() %></p>
                        				<p><%=menu.getPrice() %></p>
                       				</label>
<%
	}
%>
                       			</li>
                       		</ul>
                        	<ul>
                        		<h3>황올 콤보시리즈</h3>
                        		<li>
<%
	for(int i=0;i<menuList7.size();i++){
		bbqMenuVO menu=menuList7.get(i);
%>
                        			<input type="radio" value="<%=menu.getMenuno()%>" id="<%=menu.getMenuno()%>" name="ordermenu" class="form-control">
                        			<label for="<%=menu.getMenuno()%>">
                        				<img src="../images/<%=menu.getImg() %>" alt="메뉴이미지">
                        				<p><%=menu.getMenu() %></p>
                        				<p><%=menu.getPrice() %></p>
                       				</label>
<%
	}
%>
                       			</li>
                       		</ul>
                        	<ul>
                        		<h3>세트메뉴</h3>
                        		<li>
<%
	for(int i=0;i<menuList8.size();i++){
		bbqMenuVO menu=menuList8.get(i);
%>
                        			<input type="radio" value="<%=menu.getMenuno()%>" id="<%=menu.getMenuno()%>" name="ordermenu" class="form-control">
                        			<label for="<%=menu.getMenuno()%>">
                        				<img src="../images/<%=menu.getImg() %>" alt="메뉴이미지">
                        				<p><%=menu.getMenu() %></p>
                        				<p><%=menu.getPrice() %></p>
                       				</label>
<%
	}
%>
                       			</li>
                       		</ul>
                        	<ul>
                        		<h3>1인분 메뉴</h3>
                        		<li>
<%
	for(int i=0;i<menuList9.size();i++){
		bbqMenuVO menu=menuList9.get(i);
%>
                        			<input type="radio" value="<%=menu.getMenuno()%>" id="<%=menu.getMenuno()%>" name="ordermenu" class="form-control">
                        			<label for="<%=menu.getMenuno()%>">
                        				<img src="../images/<%=menu.getImg() %>" alt="메뉴이미지">
                        				<p><%=menu.getMenu() %></p>
                        				<p><%=menu.getPrice() %></p>
                       				</label>
<%
	}
%>
                       			</li>
                       		</ul>
                        	<ul>
                        		<h3>피자/버거</h3>
                        		<li>
<%
	for(int i=0;i<menuList10.size();i++){
		bbqMenuVO menu=menuList10.get(i);
%>
                        			<input type="radio" value="<%=menu.getMenuno()%>" id="<%=menu.getMenuno()%>" name="ordermenu" class="form-control">
                        			<label for="<%=menu.getMenuno()%>">
                        				<img src="../images/<%=menu.getImg() %>" alt="메뉴이미지">
                        				<p><%=menu.getMenu() %></p>
                        				<p><%=menu.getPrice() %></p>
                       				</label>
<%
	}
%>
                       			</li>
                        	</ul>
                        </li>
                        <li class="select">
                        	&nbsp;배달 여부 선택
                            <input type="radio" value="1" id="delivery" name="delivery" class="form-control"><label for="delivery">배달</label>
                            <input type="radio" value="2" id="pickup" name="delivery" class="form-control"><label for="pickup">포장</label>
                        </li>
                        <li class="float cf">
                            <input type="text" placeholder="배달지 주소" name="orderaddress" id="addressValue" class="form-control" style="width:225px; height:44px" readonly>
                            <h5 id="search-address" onclick="findAddr()">주소 찾기</h5>
                        </li>
                    </ul>
                    <input type="submit" value="주문하기" class="order-btn" style="width:330px; height:50px">
                </form>
            </section>
        </main>        
    </div>
<script src="./js/login.js"></script>
<script>
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
$('.menu-select ul li').hide();
$('.menu-select ul li').eq(0).show();

$('.menu-select ul h3').click(function(){
	$('.menu-select ul li').slideUp();
	$(this).next().slideDown();
});
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>
</html>
