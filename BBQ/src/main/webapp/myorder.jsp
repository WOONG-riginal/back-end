<%@page import="biz.order.bbqOrderVO"%>
<%@page import="biz.order.bbqOrderDAO"%>
<%@page import="biz.board.bbqBoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="biz.board.bbqBoardDAO"%>
<%@page import="biz.member.bbqMemberVO"%>
<%@page import="biz.member.bbqMemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("utf-8");
    response.setContentType("text/html;charset=utf-8");
    
    // 로그인 확인
    String id = (String)session.getAttribute("id");
    if(id==null){
%>
<script>
    alert('로그인이 필요한 서비스입니다.');
    location.href='index.jsp';
</script>
<%
    }
        
    bbqMemberDAO mdao = new bbqMemberDAO();
    bbqMemberVO mbean = mdao.getMyPage(id);
    String writer = mbean.getName();
    
    bbqBoardDAO bdao = new bbqBoardDAO();
    ArrayList<bbqBoardVO> boardList = bdao.getMemberBoardList(id,writer);

    bbqOrderDAO odao=new bbqOrderDAO();
    ArrayList<bbqOrderVO> myOrderList=odao.getMyOrderList(id);
%>
<section class="content">
    <div class="mp_position">
          <ul class="w1440" >
              <li>bbq home</li>
              <li><img src="./images/lnb_arrow.png" alt="화살표">마이페이지</li>
          </ul>
    </div>
    <h1 class="mp_header w1196">마이페이지</h1>
    <div class="mp_info w1196">
        <ul>
            <li>
                <img src="./images/ddac.png" alt="딹">
            </li>
            <li>
                <h2><strong><%=mbean.getName() %></strong>님 안녕하세요!</h2>
                <h3>세상에서 가장 건강하고 맛있는 치킨 bbq 입니다.</h3>
                <div class="mp_btn_p">   
                    <button id="checkpass" onclick="">개인정보 변경</button>
                    <button class="disable-btn">치킨캠프 신청내역</button>
                </div> 
            </li>
        </ul>
        <dl class="mp_box1">
                <dt>포인트</dt>
                <dd><a href="index.jsp?content=point.jsp"><img src="./images/point.png" alt="포인트"></a></dd>
                <dd><%=mbean.getPoint() %>P</dd>
        </dl>
        <dl class="mp_box2">
                <dt>쿠폰</dt>
                <dd><a href="index.jsp?content=coupon.jsp"><img src="./images/coupon.png" alt="쿠폰"></a></dd>
                <dd><%=mbean.getCoupon() %>장</dd>
        </dl>
        <dl class="mp_box3">
                <dt>카드</dt>
                <dd><a href="index.jsp?content=card.jsp"><img src="./images/card.png" alt="카드"></a></dd>
                <dd><%=mbean.getCard() %>장</dd>
        </dl>
    </div>
    <div class="mp_table w1196">               
        <ul class="mp_membership no_pl">
            <li><a href="index.jsp?content=myorder.jsp">주문내역</a></li>
            <li><a class="mp_pipe2"  href="index.jsp?content=coupon.jsp">쿠폰</a></li>
            <li><a class="mp_pipe2"  href="index.jsp?content=point.jsp">포인트</a></li>
            <li><a class="mp_pipe2"  href="index.jsp?content=card.jsp">카드</a></li>
            <li><a class="mp_pipe2" href="index.jsp?content=mywriting.jsp">나의 작성글</a></li>
            <li><a class="mp_pipe2 disable-btn" href="#"><strong>딹</strong> 멤버십 안내</a></li>
        </ul>              
    </div>
    <div class="order_flex w1196">
        <h2>주문내역</h2>
        <h3 class="disable-btn">더보기</h3>
    </div>
    <table class="table mp_order w1196">
            <tr>
                <th>주문일/주문번호</th>
                <th>상품정보</th>
                <th>결제금액</th>
                <th>배달여부</th>
                <th>주문매장</th>
                <th>주문상태</th>
            </tr>
<%
	if(myOrderList.size()!=0){
		for(int i=0;i<myOrderList.size();i++){
			bbqOrderVO myOrder=myOrderList.get(i);
			String delivery="포장";
			if(myOrder.getDelivery().equals("1")){
				delivery="배달";
			}
%>
            <tr>
                <td><%=myOrder.getOrderdate() %>/<%=myOrder.getOrdernum() %></td>
                <td><%=myOrder.getOrdermenu() %></td>
                <td><%=myOrder.getOrderprice() %>원</td>
                <td><%=delivery %></td>
                <td><%=myOrder.getOrderstore() %></td>
                <td>주문완료</td>
            </tr>
<%
		}
	}else{
%>
            <tr>
                <td colspan="6" class="nowriting">주문 내역이 없습니다.</td>
			</tr>
<%		
	}
%>
        </table>
</section>
<script>
   const editBtn = document.getElementById("checkpass");
   editBtn.addEventListener("click",()=>{
       window.open("<%= request.getContextPath() %>/checkpass.jsp", "checkpass", "width=500, height=400");
    });
</script>