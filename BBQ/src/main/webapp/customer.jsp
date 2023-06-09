
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
   
   Date nowdate = new Date();
   SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yy/MM/dd");
   String strNowDate = simpleDateFormat.format(nowdate);
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
    
    <div class="voc_section3 w1196">
        <form action="customerCtrl.jsp" method="post">
           <table class="table cf">
                <tr>
                    <th>브랜드</th>
                    <td>BBQ치킨</td>
                </tr>
                <tr>
                    <th>매장명</th>
                    <td>
<%

String intputValue = request.getParameter("intputValue");
if(intputValue == null){   
   intputValue = "매장찾기 클릭";
}
%>
                        <input type="text" id="branch_name" name="store" placeholder="매장명을 입력하세요." readonly="readonly">
                        <h5 class="voc_find_store" id="search-modal">매장찾기</h5>
                    </td>
                </tr>
                <tr>
                    <th>분류</th>
                    <td>
                        <select name="type" class="voc_select">
                            <option value="주문 거부">주문 거부</option>
                            <option value="E쿠폰/상품권 주문 거부">E쿠폰/상품권 주문 거부</option>
                            <option value="제품 품질 불만">제품 품질 불만</option>
                            <option value="이물질">이물질</option>
                            <option value="품목 미제공(치킨무 등)">품목 미제공(치킨무 등)</option>
                            <option value="자사앱/온라인 주문 불편">자사앱/온라인 주문 불편</option>
                            <option value="매장/고객센터 응대 불만">매장/고객센터 응대 불만</option>
                            <option value="현금영수증 미발급">현금영수증 미발급</option>
                            <option value="기타 불만">기타 불만</option>
                            <option value="문의사항(메뉴, 매장, 가맹, 기타)">문의사항(메뉴, 매장, 가맹, 기타)</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td>
                        <input type="text" name="writer" value="<%=mbean.getName() %>" class="voc_customerName" readonly>
                    </td>
                </tr>
                <tr>
                    <th>연락처</th>
                    <td>
                        <input type="text" name="contact" value="<%=mbean.getTel() %>" class="voc_customerNumber" readonly>
                    </td>
                </tr>
                <tr>
                    <th>작성일</th>
                    <td>
                        <input type="text" name="date" value="<%=strNowDate %>" readonly/>
                    </td>
                </tr>
                <tr>
                    <th>글제목</th>
                    <td>
                        <input type="text" name="title" class="voc_textTitle" required>
                    </td>
                </tr>
                <tr>
                    <th>파일첨부</th>
                    <td>
                        <input type="text" id="FILENAME" name="FILENAME" readonly>
                        <button type="button" class="btn file_btn" >첨부파일 등록</button>
                        <br>
                        <input type="text" id="FILENAME2" name="FILENAME2" readonly>
                        <button type="button" class="btn file_btn " >첨부파일 등록</button>
                        <br>
                        <input type="text" id="FILENAME3" name="FILENAME3" readonly>
                        <button type="button" class="btn file_btn " >첨부파일 등록</button>
                    </td>
                </tr>
                <tr>
                        <th>내용</th>
                        <td>
                            <textarea name="content" class="voc_textarea" cols="40" rows="10"  required></textarea>
                        </td>
                    </tr>
            </table>
           <div class="voc_btn">
               <input type="submit" value="제출" disabled>
               <input type="reset" value="취소">
           </div>
        </form>
    </div> <!-- section3 div class end-->
</div>
</div>
</section>

<script>
    const searchBtn = document.getElementById("search-modal");
    searchBtn.addEventListener("click",()=>{
       window.open('findstore.jsp','팝업','width=1000, height=516');
       $('input[type=submit]').attr("disabled", false);
    });
</script>
</html>