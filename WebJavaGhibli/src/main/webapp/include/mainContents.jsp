<%@page import="biz.GhibliRentDAO"%>
<%@page import="biz.GhibliListVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");

	GhibliRentDAO dao=new GhibliRentDAO();
	ArrayList<GhibliListVO> movieList=dao.getAllMovie();
%>
<h2>Ghibli Studio All Movies</h2>
<div class="list">
    <ul>
<% 
	for(int i=0;i<movieList.size();i++) {
		GhibliListVO movie=movieList.get(i);
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
<div class="searchText">
    <h3>영화 검색하기</h3>
    <form action="index.jsp?content=searchTextList.jsp" method="post">
        <div class="search_form">
            <select name="searchCondition">
                <option value="name">제목</option>
                <option value="info">내용</option>
            </select>
            &nbsp;&nbsp;&nbsp;<input type="text" name="searchWord" >
            <input type="submit" value="검색" class="btn btn-primary">
        </div>
    </form>
</div>