<%@page import="java.io.PrintWriter"%>
<%@page import="biz.GhibliListVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="biz.GhibliRentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	
	String condition=request.getParameter("searchCondition");
	String word=request.getParameter("searchWord");
	
	GhibliRentDAO dao=new GhibliRentDAO();
	/* 최신순으로 3개의 영화정보를 리턴하는 메서드 */
	ArrayList<GhibliListVO> movies=dao.getSearchMovie(condition, word);
	
	response.setContentType("text/html; charset=utf-8");
	PrintWriter write=response.getWriter();
		
	if(movies.size()==0){
		// 자바스크립트 경고창
		write.println("<script>");
		write.println("alert('검색결과가 없습니다.');");
		write.println("location.href='index.jsp?content=include/mainContents.jsp'");
		write.println("</script>");
		write.close();
	}
%>
<h2>Ghibli Studio Text Search Movies</h2>
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