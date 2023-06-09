package forward01;
/*
	[자바스크립트 location 작동방식]
	= 서블릿 요청이 클라이언트의 웹브라우저를 거쳐서 다시 요청되는 방식 => 웹브라우저 주소창이 달라짐
	  a. 클라이언트 요청
	  b. 해당 서블릿에서 annotation으로 설정한 곳으로 데이터 포워딩
	  c. 다시 클라이언트를 거쳐서
	  d. 데이터를 전달받은 서블릿에서 최종 처리
 */
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/location")
public class Servlet03ForwardLocation extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request,response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request,response);
	}
	
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글설정
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		// 출력 메서드
		PrintWriter out=response.getWriter();
		// 자바스크립트 location객체 이용 포워드
		out.print("<script>");
		out.print("location.href='location2'");
		out.print("</script>");
		out.close();
		
	}

}
