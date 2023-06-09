package forward01;
/*
	RequsetDispatcher 이용한 포워드
	: 서버에서 포워드가 진행 => 웹브라우저 주소창 주소가 바뀌지 않음
	
	[RequsetDispatcher 작동방식]
	 a. 클라이언트 요청
	 b. 해당 서블릿에서 RequsetDispatcher객체를 이용해 annotation으로 설정한 서블릿으로 포워딩
	 c. 데이터를 전달받은 서블릿에서 최종 처리
 */
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/dispatcher")
public class Servlet04ForwardDispatcher extends HttpServlet {

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
		// RequsetDispatcher 이용 데이터 전송
		RequestDispatcher dis=request.getRequestDispatcher("dispatcher2?name=ezen");
		dis.forward(request, response);
		
	}
}
