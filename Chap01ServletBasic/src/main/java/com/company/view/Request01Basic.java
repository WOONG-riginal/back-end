package com.company.view;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Request01Basic")
public class Request01Basic extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글처리
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		out.print("<html>");
		out.print("<head>");
		out.print("</head>");
		out.print("<body>");
		// 기본 request 메서드 => 주로 주소창과 관련된 메서드
		out.print("request.getScheme() = "+request.getScheme()+"<br>");
		out.print("request.getRequestURI() = "+request.getRequestURI()+"<br>");
		out.print("request.getRequestURL() = "+request.getRequestURL()+"<br>");
		out.print("request.getServletPath() = "+request.getServletPath()+"<br>");
		out.print("request.getServletContext() = "+request.getServletContext()+"<br>"); // 서블릿 실행 환경 정보
		
		out.print("<h3>Header 정보</h3>");
		out.print("request.getHeader(\"Accept\") = "+request.getHeader("Accept")+"<br>");
		
		out.print("</body>");
		out.print("</html>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
