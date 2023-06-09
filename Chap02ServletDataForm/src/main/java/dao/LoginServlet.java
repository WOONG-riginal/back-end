package dao;
/*
	02_login.html 데이터 처리 서블릿
 */
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글처리
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		// 데이터 출력 = PrintWriter객체 사용
		PrintWriter out=response.getWriter(); // HttpServletResponse의 문자열 추출+출력 메서드
		
		// 폼에서 보낸 데이터 받기
		String id=request.getParameter("user_id");
		String pw=request.getParameter("user_pw");
		
		// 출력할 폼 HTML 형식으로 만듬
		String data="<html>";
		data+="<body>";
		data+="아이디 : "+id;
		data+="<br>";
		data+="비밀번호 : "+pw;
		data+="</body>";
		data+="</html>";
		
		// 브라우저 출력
		out.print(data);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
