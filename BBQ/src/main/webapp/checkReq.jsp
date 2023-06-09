<%@page import="biz.board.bbqBoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="biz.board.bbqBoardDAO"%>
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
	
	int num=Integer.parseInt(request.getParameter("num"));
	bbqBoardDAO bdao=new bbqBoardDAO();
	bbqBoardVO board=bdao.getThisBoardList(num);
	
	
%>    
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6852d5832b95791484c3a15c165edf6c&libraries=services"></script>
<section class="content">
<div class="customer_wrap">
<div class="voc_customer">
	<div class="lnb">
        <ul class="w1440">
            <li>bbq home</li>
            <li><img src="./images/lnb_arrow.png" alt="화살표">고객센터</li>
        </ul>
    </div>
</div> <!-- customer div class end-->

<div class="voc_wrap w1196">
    <div class="voc_main w1196">
        <div class="voc_section1">
            <h1>고객센터</h1><br>
            <ul>
                <li>자주 듣는 질문</li>
                <li>고객의 소리</li>
            </ul>
    	</div><!-- section1 div class end-->

	    <div class="voc_section2 w1196">
	        <div class="voc_img">
	                <img src="./images/speaker.png" alt="확성기">
	        </div> <!-- img div class end-->
	        <div class="voc_text ">
	            <h2>언제나 고객님을 향해 열려 있습니다. 사소한 질문이라도 정성껏 대답하여 드리겠습니다</h2>
	            <h3>고객의 소리를 통해 질문하신 내용에 대한 답변은 마이 페이지를 통해 확인하실 수 있습니다. 광고성 글은 관리자가 임의로 삭제처리 합니다. <br>
	            고객의 소리는 더 나은 서비스와 품질개선을 위하여 가맹점과 공유 중에 있습니다. 본문 상에 고객정보 입력은 자제하여 주시기 바랍니다.</h3>
	            <p class="voc_uderline w1196"></p>
	        </div>  <!-- text div class end-->              
	    </div><!-- section2 div class end-->
	</div>
	
    <div class="voc_hr"></div>
    
    <div class="answer_section w1196">
        <form action="reWriteReqCtrl.jsp" method="post">
           <table class="checkReq">
                <tr>
                    <th>매장명</th>
                    <th>분류</th>
                    <th>고객명</th>
                    <th>연락처</th>
                </tr>
                <tr>
                    <td><%=board.getStore() %></td>
                    <td><%=board.getType() %></td>
                    <td><%=board.getWriter() %></td>
                    <td><%=board.getContact() %></td>
                </tr>
                <tr>
                </tr>
                <tr>
                </tr>
                <tr>
                    <th class="ppp">글제목</th>
                    <th>작성일</th>
                </tr>
                <tr>
                    <td class="ppp">
                        <%=board.getTitle() %>
                    </td>
                    <td>
                        <%=board.getReg_date() %>
                    </td>
                </tr>
                <tr>
                    <th class="pppp">문의내용</th>
                </tr>
                <tr>
                    <td class="pppp">
                        <%=board.getContent() %>
                    </td>
                </tr>
                <tr>
                    <th class="pppp">답변하기</th>
                </tr>
                <tr>
                    <td class="pppp re_content">
                        <textarea name="content" id="re_content" cols="30" rows="10" class="form-control"></textarea>
                    </td>
                </tr>
            </table>
	        <div class="answer_btn">
	        	<input type="hidden" name="title" value="<%=board.getTitle() %>">
	            <input type="hidden" name="ref" value="<%=board.getRef() %>">
	            <input type="hidden" name="re_step" value="<%=board.getRe_step() %>">
	            <input type="hidden" name="re_level" value="<%=board.getRe_level() %>">
	            <input type="submit" class="btn do_answer" value="입력">
	            <input type="reset" class="btn do_answer" value="취소">
	        </div>
        </form>
    </div>
</div>
</div>
</section>

<script>
    const searchBtn = document.getElementById("search-modal");
    searchBtn.addEventListener("click",()=>{
	    window.open('findstore.jsp','팝업','width=1000, height=700');
    });
</script>
</html>