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
		response.sendRedirect("index.jsp");
	}
	
	bbqMemberDAO mdao = new bbqMemberDAO();
	bbqMemberVO mbean = mdao.getMyPage(id);
	
	ArrayList<bbqMemberVO> memberList=mdao.getMemberList();
	
	bbqBoardDAO bdao = new bbqBoardDAO();
	ArrayList<bbqBoardVO> boardList = bdao.getAllBoardList();

	bbqOrderDAO odao=new bbqOrderDAO();
    ArrayList<bbqOrderVO> allOrderList=odao.getAllOrderList();
%>
<section class="content">
    <div class="mp_position">
	      <ul class="w1440" >
	          <li>bbq home</li>
	          <li><img src="./images/lnb_arrow.png" alt="화살표">마이페이지</li>
	      </ul>
    </div>
    <h1 class="mp_header w1196">관리자페이지</h1>
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
                <dd><img src="./images/point.png" alt="포인트"></dd>
                <dd><%=mbean.getPoint() %>P</dd>
        </dl>
        <dl class="mp_box2">
                <dt>쿠폰</dt>
                <dd><img src="./images/coupon.png" alt="쿠폰"></dd>
                <dd><%=mbean.getCoupon() %>장</dd>
        </dl>
        <dl class="mp_box3">
                <dt>카드</dt>
                <dd><img src="./images/card.png" alt="카드"></dd>
                <dd><%=mbean.getCard() %>장</dd>
        </dl>
    </div>
   <!--  <div class="mp_table w1196">               
        <ul class="mp_membership no_pl">
            <li><a href="index.jsp?content=myorder.jsp">주문내역</a></li>
            <li><a class="mp_pipe2"  href="index.jsp?content=coupon.jsp">쿠폰</a></li>
            <li><a class="mp_pipe2"  href="index.jsp?content=point.jsp">포인트</a></li>
            <li><a class="mp_pipe2"  href="index.jsp?content=card.jsp">카드</a></li>
            <li><a class="mp_pipe2" href="index.jsp?content=mywriting.jsp">나의 작성글</a></li>
            <li><a class="mp_pipe2" href="#"><strong>딹</strong> 멤버십 안내</a></li>
        </ul>             
    </div> -->
    <div class="order_flex w1196">
        <h2>회원목록</h2>
        <h3 class="disable-btn">더보기</h3>
    </div>
        <table class="table mp_order w1196">
            <tr>
                <th>아이디</th>
                <th>이름</th>
                <th>생년월일</th>
                <th>연락처</th>
                <th>이메일</th>
                <th>멤버십</th>
            </tr>
<%
	if(memberList.size()!=0){
		for(int i=0; i<memberList.size();i++){
			bbqMemberVO member=memberList.get(i);
			String birth="미기입";
			if(member.getBirth()!=null){
				birth=member.getBirth();
			}
			String membership=member.getRole();
			if(membership.equals("A")){
				membership="관리자";
			}else if(membership.equals("G")){
				membership="골드";
			}else if(membership.equals("S")){
				membership="실버";
			}else {
				membership="브론즈";
			}
%>
            <tr class="members">
                <td><%=member.getId() %></td>
                <td><%=member.getName() %></td>
                <td><%=birth %></td>
                <td><%=member.getTel()%></td>
                <td><%=member.getEmail() %></td>
                <td><%=membership %></td>
            </tr>
<%
		}
	}
%>            
        </table>
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
                <th>주문자(주문자ID)</th>
            </tr>
<%
	if(allOrderList.size()!=0){
		for(int i=0;i<allOrderList.size();i++){
			bbqOrderVO order=allOrderList.get(i);
			String delivery="포장";
			if(order.getDelivery().equals("1")){
				delivery="배달";
			}
%>
            <tr>
                <td><%=order.getOrderdate() %>/<%=order.getOrdernum() %></td>
                <td><%=order.getOrdermenu() %></td>
                <td><%=order.getOrderprice() %>원</td>
                <td><%=delivery %></td>
                <td><%=order.getOrderstore() %></td>
                <td><%=order.getOrdername() %>(<%=order.getOrderid() %>)</td>
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
        <div class="writing_flex cf w1196">
            <h2>문의내역</h2>
        </div>
        <table class="table mp_writing w1196">
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성일</th>
                <th>상태</th>
            </tr>
<%
	if(boardList.size()!=0){
		for(int i=0; i<boardList.size();i++){
			bbqBoardVO bvo = boardList.get(i);
			int ref=bvo.getRef();
			int check=bdao.checkAnswer(ref);

			if(check>1){
				int re_step=bvo.getRe_step();
				if(re_step==1){
%>
            <tr class="mainDown">
            	<td><%=bvo.getNum() %></td>
                <td>
                	<span><%=bvo.getType() %></span>&nbsp;&nbsp;
                	<%=bvo.getTitle() %>
               	</td>
<%
				}else{
%>
			<tr class="mainDown">
				<td><%=bvo.getNum() %></td>                        
                <td>&nbsp;&nbsp;<%=bvo.getTitle() %></td>
<%
				}
%>                
                <td><%=bvo.getReg_date() %></td>
                <td class="answer_complete">
					답변 완료
                </td>
            </tr>
            <tr class="subDown answer_complete" style="display:none">
            	<td></td>
            	<td><%=bvo.getContent() %></td>
            	<td class="storeName"><%=bvo.getStore() %></td>
           		<td class="answerBtnArea"></td>
            </tr>
<%
			}else{
%>
			<tr class="mainDown">                        
               	<td><%=bvo.getNum() %></td>
                <td>
                	<span><%=bvo.getType() %></span>&nbsp;&nbsp;
                	<%=bvo.getTitle() %>
               	</td>
                <td><%=bvo.getReg_date() %></td>
                <td>
					답변 전
                </td>
            </tr>
            <tr class="subDown" style="display:none">
            	<td></td>
            	<td><%=bvo.getContent() %></td>
            	<td class="storeName"><%=bvo.getStore() %></td>
           		<td class="answerBtnArea">
           			<a href="index.jsp?content=checkReq.jsp?num=<%=bvo.getNum() %>" class="btn answer-btn">답변하기</a>
           		</td>
            </tr>
<%					
			}
		}
	}else{
%>
            <tr>
                <td colspan="4" class="nowriting">문의 내역이 없습니다.</td>
            </tr>
<%		
	}
%>            
        </table>
</section>
<script>
	$(".mainDown").click(function() {
	    $(this).next(".subDown").stop().slideToggle();
	    $(this).next().next(".subAnswer").stop().slideToggle();
	});
</script>