package forward01;
/*
	[refresh 작동방식]
	= 서블릿 요청이 클라이언트의 웹브라우저를 거쳐서 다시 요청되는 방식 => 웹브라우저 주소창 주소가 달라짐
	  a. 클라이언트 요청
	  b. 해당 서블릿에서 annotation 설정한 곳으로 데이터 포워딩
	  c. 다시 클라이언트 거쳐서
	  d. 포워딩 받은 서블릿에서 최종 처리
	
 */
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/refresh")
public class Servlet02ForwardRefresh extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request,response);
	}
	
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글처리
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		// 브라우저 출력
		PrintWriter out=response.getWriter();
		// refresh
		response.addHeader("Refresh","1;url=refresh2?name=ezen"); // 1초 후에 서블릿 refresh2로 포워딩
		
		
	}

}
