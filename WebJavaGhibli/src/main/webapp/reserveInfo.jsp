<%@page import="biz.GhibliListVO"%>
<%@page import="biz.GhibliRentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	
	int no=Integer.parseInt(request.getParameter("no"));
	GhibliRentDAO dao=new GhibliRentDAO();
	GhibliListVO movie=dao.getOneMovie(no);
	
	// DB에서 가져온 카테고리의 1,2,3값을 문자열로 치환 => 소박, 중박, 대박
	int category=movie.getCategory();
	String temp="";
	if(category==1){
		temp="소";
	}else if(category==2){
		temp="중";
	}else if(category==3){
		temp="대";
	}
%>
<h2>Ghibli Studio Movies Info</h2>
<form action="index.jsp?content=reserveOptionSelect.jsp" method="post">
    <div class="info">
        <ul>
            <li>
                <img src="./images/<%=movie.getImg() %>" alt="영화포스터">
            </li>
        </ul>
        <ul class="movie_info">
            <li>영화 이름 : <%=movie.getName() %></li>
            <li>영화 수량 : &nbsp;&nbsp;&nbsp;
                <select name="qty" class="form-control">
<%
	for(int i=1;i<=movie.getUsepeople();i++){
%>
                    <option value="<%=i%>"><%=i%></option>
<%		
	}
%>
                </select>
            </li>
            <li>영화 분류 : <%=temp %>박</li>
            <li>영화 가격 : <%=movie.getPrice() %></li>
            <li>영화사 : <%=movie.getCompany() %></li>
            <li>영화 정보 : <%=movie.getInfo() %></li>
        </ul>
    </div>
    <div>
        <input type="hidden" name="no" value="<%=movie.getNo() %>">
        <input type="hidden" name="img" value="<%=movie.getImg() %>">
        <input type="submit" value="옵션선택 후 구매하기" class="btn btn-success">
    </div>
</form>