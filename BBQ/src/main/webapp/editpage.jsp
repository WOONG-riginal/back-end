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
	String writer = mbean.getName();
	String address = mbean.getAddress();
	String birth = mbean.getBirth();
	if(address==null){
		address="";
	}
	if(birth==null){
		birth="";
	}
	
	bbqBoardDAO bdao = new bbqBoardDAO();
	ArrayList<bbqBoardVO> boardList = bdao.getMemberBoardList(id,writer);

%>    
<section class="content">
    <div class="mp_position">
	      <ul class="w1440" >
	          <li>bbq home</li>
	          <li><img src="./images/lnb_arrow.png" alt="화살표">마이페이지</li>
	          <li><img src="./images/lnb_arrow.png" alt="화살표">회원정보변경</li>
	      </ul>
    </div>
    <div class="mp_info w1196">
        <ul>
            <li>
                <img src="./images/ddac.png" alt="딹">
            </li>
            <li>
                <h2><strong><%=mbean.getName() %></strong>님 안녕하세요!</h2>
                <h3>세상에서 가장 건강하고 맛있는 치킨 bbq 입니다.</h3>
                <div class="mp_btn_p">   
                    <button>개인정보 변경</button>
                    <button>치킨캠프 신청내역</button>
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
    <div class="mp_table w1196">               
        <ul class="mp_membership no_pl">
            <li><a href="#">주문내역</a></li>
            <li><a class="mp_pipe2"  href="#">쿠폰</a></li>
            <li><a class="mp_pipe2"  href="#">포인트</a></li>
            <li><a class="mp_pipe2"  href="#">카드</a></li>
            <li><a class="mp_pipe2" href="#">나의 작성글</a></li>
            <li><a class="mp_pipe2" href="#"><strong>딹</strong> 멤버십 안내</a></li>
        </ul>              
    </div>
    <div class="order_flex w1196">
        <h2>회원정보변경</h2>
    </div>
    <form action="editCtrl.jsp" method="post">
        <table class="w1196 updateInfo">
        	<caption>기본 정보</caption>
            <tr class="bg-gray">
                <th>이름</th>
				<td><%=mbean.getName() %></td>
            </tr>                    
<%
	if(birth.equals("")){
%>
            <tr>
                <th>생년월일</th>
				<td><input type="text" class="edit_form" name="birth" maxlength="8" placeholder="생년월일을 입력해주세요." value="<%=birth %>"></td>
            </tr>                    
<%
	}else{
%>
            <tr class="bg-gray">
                <th>생년월일</th>
          		<td><input type="hidden" name="birth" value="<%=birth %>" ><%=birth %></td>
            </tr>              
<%
	}
%>				
            <tr class="bg-gray">
                <th>아이디</th>
				<td><%=mbean.getId() %></td>
            </tr>                    
            <tr>
                <th>비밀번호</th>
				<td><a id="editpass" class="btn">변경</a></td>
            </tr>                    
            <tr>                    
                <th>휴대폰번호</th>
                <td><input type="tel" name="tel" class="edit_form" value="<%=mbean.getTel() %>" ></td>
            </tr>
            <tr>
            	<th>이메일 주소</th>
            	<td><input type="email" name="email" class="edit_form" value="<%=mbean.getEmail() %>" /></td>
            </tr>
        </table>
       
   		<div class="order_flex w1196"><p>주소지 관리</p></div>
    	<table class="w1196 addr">
    		<tr>
    			<th class="w180"></th>
    			<th colspan="2" class="addrmid">주소</th>
    			<th class="w180">관리</th>
    		</tr>
    		<tr>
    			<td class="w180"><input type="checkbox"></td>
    			<td colspan="2" class="addrmid"><input type="text" id="addressValue" name="address" placeholder="주소를 입력해주세요." value="<%=address %>" readonly></td>
<%
	if(address.equals("")){
%>
    			<td class="w180 add_addr"><a class="btn addrbtn" onclick="findAddr()">주소지 추가</a></td>
<%
	}else{
%>
    			<td class="w180">
    				<a class="btn" onclick="findAddr()">수정</a>&nbsp;
    				<a class="btn delete_addr" onclick="location.href='deleteAddrCtrl.jsp?id=<%=id %>&address=<%=address %>';">삭제</a>
   				</td>
<%
	}
%>   				
    		</tr>
    	</table>
    	<div class="w1196 submit">
    		<input type="submit" value="확인"/>
    		<input type="reset" value="취소"/>
    	</div>
    </form>
    <div class="del w1196">
	   <a href="deleteCtrl.jsp" type="button" onclick="return confirm('탈퇴하시겠습니까?');">
	       <button>제너시스BBQ그룹 통합 멤버십 회원탈퇴
	           <small>불편사항이 있으셨나요? 고객센터(1588-9282)로 연락주시면 서비스개선을 위해 최선을 다하겠습니다.</small>
	           <i class="fa fa-chevron-right" aria-hidden="true"></i>
	       </button>
	   </a>
    </div>
</section>
<script>
	const passEditBtn = document.getElementById("editpass");
	passEditBtn.addEventListener("click",()=>{
    	window.open("<%= request.getContextPath() %>/editpass.jsp", "editPass", "width=500, height=400");
    });
	
	const urlParams = new URL(location.href).searchParams;
	const address = urlParams.get('address');
	const deleteAddrBtn = document.getElementByClassName("delete_addr");
	
	function findAddr(){
		new daum.Postcode({
	        oncomplete: function(data) {
	        	$('#addressValue').prop('readonly', false);
	        	
	        	console.log(data);
	        	var roadAddr = data.roadAddress; // 도로명 주소 변수
	            var jibunAddr = data.jibunAddress; // 지번 주소 변수
	            
	            if(roadAddr !== ''){
	            	document.getElementById("addressValue").value=roadAddr+" ";
	                $('#addressValue').focus();
	            } 
	            else if(jibunAddr !== ''){
	            	document.getElementById("addressValue").value=jibunAddr+" ";
	                $('#addressValue').focus();
	            }
	        }
	    }).open();
	}
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>