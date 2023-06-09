package forward01;
/*
	Servlet01ForwardRedirect 서블릿에서 데이터 포워딩한 데이터 처리 서블릿
	= 웹브라우저를 통해 이 서블릿으로 포워딩
	= 웹브라우저의 주소창은 매핑된 값(=여기서는 annotation?)이 표시됨
 */
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/redirect2")
public class Servlet01ForwardRedirect2 extends HttpServlet {
	
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
		
		out.print("<html><head></head><body>");
		out.print("<h3>포워딩 실습 : sendRedirect이용 redirect실습</h3>");
		// 포워딩한 데이터 받기
		// redirect로 전달받은 데이터는 ???
		out.print("redirect로 전달받은 데이터는 "+request.getParameter("name"));
		out.print("</body></html>");
		
		out.close();
		
	}

}
