package forward01;
/*
	서버에서 포워드 작업
	=> 웹브라우저 주소창 주소 변화없음
 */
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/dispatcher2")
public class Servlet04ForwardDispatcher2 extends HttpServlet {

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
		// 출력 메서드
		PrintWriter out=response.getWriter();
		// 포워딩 데이터 받기
		out.print("포워드 실습 : RequsetDispatcher 객체 이용<br>");
		out.print("전달받은 데이터 : "+request.getParameter("name"));
		out.close();
		
	}

}
