<%@page import="java.util.ArrayList"%>
<%@page import="biz.GhibliViewVO"%>
<%@page import="biz.GhibliRentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	
	String id=(String)session.getAttribute("id");
	if(id==null){
%>
<script>
	alert('로그인이 필요한 서비스입니다.');
	location.href='index.jsp?content=login.jsp';
</script>
<%		
	}	
	// 로그인 시 예약정보 가져옴
	GhibliRentDAO dao=new GhibliRentDAO();
	ArrayList<GhibliViewVO> view=dao.getAllReserve(id);
%>
<h2>Ghibli Studio Movies Reserve Result Page</h2>
<form action="#" method="post">
    <div class="reserve_title">
        <ul>
            <li>이미지</li>
            <li>이름</li>
            <li>대여기간</li>
            <li>대여일</li>
            <li>금액</li>
            <li>수량</li>
            <li>옵션1</li>
            <li>옵션2</li>
            <li>옵션3</li>
            <li>옵션4</li>
            <li>예약취소</li>
        </ul>
    </div>
    <div class="reserve_result">
<% 
	for(int i=0;i<view.size();i++) {
		GhibliViewVO reserve=view.get(i);
		
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
%>
        <ul>
            <li><img src="./images/<%=reserve.getImg() %>" alt="영화포스터" width="120" height="70"></li>
            <li><%=reserve.getName() %></li>
            <li><%=reserve.getDday() %></li>
            <li><%=reserve.getRday() %></li>
            <li><%=reserve.getPrice() %></li>
            <li><%=reserve.getQty() %></li>
            <li><%=usein %></li>
            <li><%=usewifi %></li>
            <li><%=usenavi %></li>
            <li><%=useseat %></li>
<!-- 접속자 id와 대여일 파라미터로 넘겨줌 = 같은 날짜에 예약되어 있으면 모두 삭제 -->
            <li><button type="button" onclick="alert('해당 날짜 모든 예약을 취소하시겠습니다?')">
            	<a href="reserveDel.jsp?id=<%=id %>&rday=<%=reserve.getRday() %>">취소</a></button>
           	</li>
        </ul>
<%
	}
%>
    </div>
</form>