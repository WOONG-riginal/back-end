package dao;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servletgetpost")
public class ServletGetPost extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// doGet(), doPost() 2개 동시 처리 메서드 호출
		doGetPost(request,response);
		System.out.println("doGet 메서드 호출");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// doGet(), doPost() 2개 동시 처리 메서드 호출
		doGetPost(request,response);
		System.out.println("doPost 메서드 호출");
	}
	
	// doGet() doPost() 선택 처리 메서드
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글처리
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		// 브라우저 출력 메서드
		PrintWriter out=response.getWriter();
		System.out.println("doGetPost 메서드 호출");
		
		String id=request.getParameter("user_id");
		String pw=request.getParameter("user_pw");
		
		// 데이터 콘솔 확인
		System.out.println("아이디 : "+id+"\n비밀번호 : "+pw);
		
		// 데이터 브라우저 출력
		String data="<html>";
		data+="<body>";
		data+="아이디 : "+id;
		data+="<br>";
		data+="비밀번호 : "+pw;
		data+="</body>";
		data+="</html>";
		
		out.print(data);
		out.close();
	}

}
