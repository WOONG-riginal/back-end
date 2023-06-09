package binding02;
/*
	RequestDispatcher를 이용한 바인딩
 */
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/bindingdispatcher")
public class Binding02RequestDispatcher extends HttpServlet {

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
		
		// 1. Scope = request, 데이터 바인딩
		request.setAttribute("address", "서울시 노원구");
		
		// 2. Scope = request, 두번째 서블릿으로 포워드
		RequestDispatcher dis=request.getRequestDispatcher("bindingdispatcher2");
		dis.forward(request, response);
	}

}
