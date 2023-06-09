<%@page import="biz.GhibliRentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	
	String id=request.getParameter("id");
	String rday=request.getParameter("rday");
	
	GhibliRentDAO dao=new GhibliRentDAO();
	dao.removeReserve(id, rday);
	
	response.sendRedirect("index.jsp?content=reserveView.jsp");
%>