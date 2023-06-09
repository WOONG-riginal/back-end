<%@page import="biz.GhibliListVO"%>
<%@page import="biz.GhibliRentDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	
	int no=Integer.parseInt(request.getParameter("no"));
	int qty=Integer.parseInt(request.getParameter("qty"));
%>
<jsp:useBean id="reserve" class="biz.GhibliReserveVO">
	<jsp:setProperty name="reserve" property="*" />
</jsp:useBean>
<!-- 로그인 처리 -->
<%
	String id=(String)session.getAttribute("id");
	if(id==null){
%>
<script>
	alert('로그인이 필요한 서비스입니다.');
	location.href='index.jsp?content=login.jsp';
</script>
<%		
	}
%>
<!-- 날짜 처리 -->
<%
	Date prevDay=new Date(); // java.util 소속
	Date nowDay=new Date();
	// 날짜형식 년-월-일 형식으로 포멧하는 클래스
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	
	// 폼 데이터 -> 날짜 형식으로 캐스팅
	prevDay=sdf.parse(reserve.getRday()); // 폼에서 입력받은 날짜
	nowDay=sdf.parse(sdf.format(nowDay)); // 현재 날짜
	
	// 두 날짜 비교 : compareTo() 메서드
	// 예약하는 날짜가 현재 날짜보다 작으면 -1
	// 예약하는 날짜가 현재 날짜와 같으면 0
	// 예약하는 날짜가 현재 날짜보다 크면 1
	int compare=prevDay.compareTo(nowDay);
	if(compare<1){ // 예약일이 오늘이거나 오늘보다 이전이라면 예약 불가능
		System.out.println(compare);
%>
	<script>
		alert('올바른 예약일을 입력하세요.');
		history.go(-1);
	</script>
<%		
	}
	reserve.setId(id);
	
	// 예약 날짜가 유효하면 비즈니스 로직 실행
	GhibliRentDAO dao=new GhibliRentDAO();
	dao.setReserveMovie(reserve);
	
	// 예약 영화 정보 가져오기
	GhibliListVO movie=dao.getOneMovie(no);
	// 예약 관련 정보 계산
	int moviePrice=movie.getPrice() * reserve.getQty() * reserve.getDday();
	int usein=0;
	if(reserve.getUsein()==1){
		usein=10000;
	}
	int usewifi=0;
	if(reserve.getUsewifi()==1){
		usewifi=10000;
	}
	int usenavi=0;
	if(reserve.getUsenavi()==1){
		usenavi=10000;
	}
	int useseat=0;
	if(reserve.getUseseat()==1){
		useseat=10000;
	}
	int optionPrice=usein+usewifi+usenavi+useseat;
	int totalPrice=moviePrice+optionPrice;
%>


<h2>Ghibli Studio Movies Result</h2>
<div class="info">
    <ul>
        <li>
            <a href="#"><img src="./images/<%=movie.getImg() %>" alt="영화포스터"></a>
        </li>
    </ul>
    <ul class="movie_info">
        <li>
            영화 기본 대여 금액 : &nbsp;&nbsp;&nbsp;
            <%=moviePrice %>원
        </li>
        <li>
            영화 옵션 대여 금액 : &nbsp;&nbsp;&nbsp;
            <%=optionPrice %>원
        </li>
        <li>
            영화 총 대여 금액 : &nbsp;&nbsp;&nbsp;
            <%=totalPrice %>원
        </li>
    </ul>
</div>
<div>
    <button type="button" class="btn btn-success">
    	<a href="index.jsp?content=reserveView.jsp">영화대여확인하기</a>
    </button>
</div>