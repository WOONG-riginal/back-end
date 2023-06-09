package jspservlet;
/*
	하나의 서블릿에서 JSP파일로 바인딩
 */
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/sessionbinding")
public class SessionBinding extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글처리
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		// PrintWriter
		PrintWriter out=response.getWriter();
		// session 생성
		HttpSession session=request.getSession();
		// session에 값 할당
		session.setAttribute("name", "김명철");
		// 태그로 브라우저 출력 = 링크 클릭 시 16_JSPBinding.jsp로 이동
		out.print("<html><body>");
		out.print("<h1>서블릿 세션 이용 JSP 바인딩</h1>");
		out.print("<a href='16_JSPBinding.jsp'>JSP바인딩</a>");
		out.print("</body></html>");
		out.close();
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
