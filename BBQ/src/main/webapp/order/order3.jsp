<%@page import="biz.order.bbqOrderVO"%>
<%@page import="biz.order.bbqOrderDAO"%>
<%@page import="biz.menu.bbqMenuVO"%>
<%@page import="biz.menu.bbqMenuDAO"%>
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
    <title>주문완료</title>
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
    <link rel="stylesheet" href="./css/order3.css">
</head>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	
	String id = (String)session.getAttribute("id");	
	
	String ordername=request.getParameter("ordername");
	String ordercontact=request.getParameter("ordercontact");
	String orderstore=request.getParameter("orderstore");
	String ordermenuno=request.getParameter("ordermenu");
	String delivery=request.getParameter("delivery");
	String orderaddress=request.getParameter("orderaddress");
	
	if(delivery.equals("2")){
		orderaddress="포장주문";
	}
	
	if(ordername.equals("")||ordername.equals("null")||ordercontact.equals("")||ordercontact.equals("null")||orderstore.equals("")||orderstore.equals("null")||ordermenuno.equals("")||ordermenuno.equals("null")||delivery.equals("")||delivery.equals("null")||orderaddress.equals("")||orderaddress.equals("null")){
%>
		<script>
			alert('주문 정보를 확인하세요.');
			history.back();
		</script>
<%		
	}
	int num=Integer.parseInt(ordermenuno);
	bbqMenuDAO mdao=new bbqMenuDAO();
	bbqMenuVO menu=mdao.getMenuInfo(num);
	
	String ordermenu=menu.getMenu();
	String price=menu.getPrice();
	String intPrice=price.replaceAll("[^0-9]","");
	int orderprice=Integer.parseInt(intPrice);
	bbqOrderVO order=new bbqOrderVO();
	order.setOrdername(ordername);
	order.setOrdercontact(ordercontact);
	order.setOrderstore(orderstore);
	order.setOrdermenu(ordermenu);
	order.setOrderprice(orderprice);
	order.setQty(1);
	order.setDelivery(delivery);
	order.setOrderaddress(orderaddress);
	
	bbqOrderDAO odao=new bbqOrderDAO();
	odao.addOrder(order, id);
	
	int point=orderprice/100;
	
	bbqMemberDAO memdao=new bbqMemberDAO();
	memdao.plusPoint(id, point);
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
                    <p>매장 선택</p>
                    <p>주문 정보 입력</p>
                    <p>주문 완료</p>
                </div>
            </div>
        </header>
        <main>            
            <section class="contents">
                <div class="login cf">
                    <h2 class="ordercheck">
                        주문이 완료되었습니다.
                    </h2>
                    <button type="button" class="login-btn" style="width:330px; height:50px">주문내역 확인하기</button>
                </div>
            </section>
        </main>
    </div>
</body>
<script>
	$('.login-btn').click(function(){
		opener.location.href="../index.jsp?content=mypage.jsp";
		self.close();
	});
</script>
</html>