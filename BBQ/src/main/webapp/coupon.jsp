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
            <li><a class="mp_pipe2" href="#"><strong>딹</strong> 멤버십 안내</a></li>
        </ul>              
    </div>
    <div class="point_header w1196">
        <h3>쿠폰</h3>        
        <h4>사용 가능한 쿠폰 <span><%=mbean.getCoupon() %></span>장</h4>
    </div>        
        <table border="1"  class="table w1196">                 
           <tr class="tbl">
               <th>쿠폰명</th>
               <th>유효기간</th>
               <th>할인타입</th>
               <th>사용유무</th>
           </tr>                    
           <tr>
             <td>
                 <span class="red shape mr-10">비비큐 치킨</span>
                 <a href="#">6월 따뜻한 픽업 3,000원 프로모션 </a>
            </td>           
            <td class="pt">2023-06-01 ~<br> 2023-06-30</td>
            <td class="pt">할인</td>
            <td class="pt">미사용</td>
          </tr>          
        </table>
</section>
<script>
   const editBtn = document.getElementById("checkpass");
   editBtn.addEventListener("click",()=>{
       window.open("<%= request.getContextPath() %>/checkpass.jsp", "checkpass", "width=500, height=400");
    });
</script>