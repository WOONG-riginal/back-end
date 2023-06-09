package dao;
/*
	formexe.html 처리 서블릿
 */
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/formexe")
public class Formexe extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request,response);
	}
	
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		PrintWriter out=response.getWriter();
		
		String id=request.getParameter("id");
		String pw=request.getParameter("pw");
		String address=request.getParameter("address");
		String email=request.getParameter("email");
		String tel=request.getParameter("tel");
		
		out.print("안녕하세요<br>로그인하셨어요!!<br><br>");
		out.print("아이디 : "+id+"<br>");
		out.print("비밀번호 : "+pw+"<br>");
		out.print("주소 : "+address+"<br>");
		out.print("email : "+email+"<br>");
		out.print("HP : "+tel+"<br>");
		out.close();
	}

}
