<%@page import="java.util.ArrayList"%>
<%@page import="biz.GhibliRentDAO"%>
<%@page import="biz.GhibliListVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	
	int category=Integer.parseInt(request.getParameter("category"));
	String temp="";
	if(category==1){
		temp="소";
	}else if(category==2){
		temp="중";
	}else if(category==3){
		temp="대";
	}
	
	GhibliRentDAO dao=new GhibliRentDAO();
	/* 최신순으로 3개의 영화정보를 리턴하는 메서드 */
	ArrayList<GhibliListVO> movies=dao.getCategoryMovie(category);
%>
<h2>Ghibli Studio <%=temp %>박 Category Search Movies</h2>
<div class="list">
    <ul>
<%
	for(int i=0;i<movies.size();i++){
		GhibliListVO movie=movies.get(i);
%>
        <li>
            <a href="index.jsp?content=reserveInfo.jsp?no=<%=movie.getNo() %>">
                <img src="./images/<%=movie.getImg() %>" alt="이미지">
            </a>
            <p>영화명 : <%=movie.getName() %></p>
        </li>
<%
	}
%>
    </ul>
</div>
<div class="search">
    <h3>영화 검색하기</h3>
    <form action="index.jsp?content=searchCategoryList.jsp" method="post">
        <div class="search_form">
            <select name="category" class="form-control">
                <option value="1">소박</option>
                <option value="2">중박</option>
                <option value="3">대박</option>
            </select>
            <input type="submit" value="검색" class="btn btn-primary">&nbsp;&nbsp;
        </div>
    </form>
    <button type="button" onclick="location.href='index.jsp?content=searchAllList.jsp'" class="btn btn-primary">전체검색</button>
</div>