package forward01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/location2")
public class Servlet03ForwardLocation2 extends HttpServlet {

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
		// 자바스크립트 location이용 화면 이동
		out.print("<html><body>");
		out.print("포워드 실습 : 자바스크립트 location이용 이동<br>");
		out.print("</body></html>");
		out.close();
		
	}

}
