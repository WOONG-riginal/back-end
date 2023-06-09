<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	
	// 로그아웃
	String logout=request.getParameter("logout");
	if(logout!=null){
		session.setAttribute("id", null);
		session.setMaxInactiveInterval(0); // 세션 시간 종료
	}
	
	// 세션값
	String id=(String)session.getAttribute("id");
	// 로그인이 안되어있으면
	if(id==null){
		id="GUEST";
	}
%>
<div class="logo">
    <h1><a href="<%=request.getContextPath()%>">GHIBLI</a></h1>
    <aside>
        <p><strong><%=id %></strong> 님 반갑습니다</p>
<%
	if(id.equals("GUEST")){
%>
        <button class="btn" onclick='location.href="index.jsp?content=login.jsp"'>LOGIN</button>
		
<%
	}else{
%>
        <button class="btn" onclick='location.href="index.jsp?logout=1"'>LOGOUT</button>
<%
	}
%>
    </aside>
</div>
<nav class="gnb">
    <ul>
        <li><a href="index.jsp?content=company/company.jsp">회사소개</a></li>
        <li><a href="index.jsp?content=reserveMain.jsp">검색하기</a></li>
        <li><a href="index.jsp?content=reserveView.jsp">대여확인</a></li>
        <li><a href="index.jsp?content=board/board.jsp">게시판</a></li>
        <li><a href="index.jsp?content=contact/contact.jsp">고객센터</a></li>
    </ul>
</nav>