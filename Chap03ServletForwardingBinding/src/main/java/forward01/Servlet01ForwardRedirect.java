package forward01;
/*
	서블릿 포워드 기능
	: 웹 개발 시 회원관리, 상품관리, 게시판관리 등을 연동할 경우가 반드시 필요 = 기능, 데이터 등
	  => 하나의 서블릿과 다른 서블릿들 또는 JSP들과 서로 데이터를 공유해야 개발이 편리하기 때문에 필요
	  
	(하나의) 서블릿에서 다른 서블릿 또는 다른 JSP와 연동하는 방법을 포워드라고 함
	
	[결론]
	포워드 기능 = 하나의 서블릿에서 다른 서블릿이나 JSP로 요청을 전달하는 기능
	            = 데이터를 추가하여 전달도 가능
	            
	[redirect 작동방식]
	= 서블릿 요청이 클라이언트의 (웹브라우저)를 거쳐서 다시 요청되는 방식 => 웹브라우저 주소창 주소가 바뀜
	
	  a. 클라이언트 요청
	  b. Servlet에서 annotation이 설정한 곳으로 데이터 전달(forward)
	  c. 다시 클라이언트를 거쳐서
	  d. 데이터를 전달받은 Servlet에서 최종 처리
	  
 */
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/redirect")
public class Servlet01ForwardRedirect extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request, response);
	
	}
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글처리
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		
		response.sendRedirect("redirect2?name=ezen");
		
	}

}
