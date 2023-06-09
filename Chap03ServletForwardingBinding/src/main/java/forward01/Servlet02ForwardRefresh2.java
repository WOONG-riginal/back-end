package forward01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/refresh2")
public class Servlet02ForwardRefresh2 extends HttpServlet {

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
		// refresh 포워딩
		out.print("<html><body>");
		out.print("포워드 실습 : addHeader() 이용 refresh 실습<br>");
		out.print("전달받은 데이터 "+request.getParameter("name"));
		out.print("</body></html>");
		out.close();
		
		
		
	}

}
