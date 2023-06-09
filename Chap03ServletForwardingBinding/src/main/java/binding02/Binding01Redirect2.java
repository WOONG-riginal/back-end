package binding02;
/*
	[결론]
	Redirect는 브라우저를 통한 데이터 전달이므로 완전히 서로 다른 요청 = request객체가 서로 다름
	=> 서블릿 간에 데이터 공유가 안됨 = null 출력
 */
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.connector.Response;

@WebServlet("/bindingredirect2")
public class Binding01Redirect2 extends HttpServlet {

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
		// 바인딩 데이터 사용 = request객체에서 넘어오는 데이터가 Object타입이므로 문자형으로 캐스팅 필요
		String name=(String)request.getAttribute("name");
		
		out.print("<html><body>");
		out.print("가져온 데이터 : "+name+"<br>");
		out.print("바인딩실습 : sendRedirect 이용 바인딩 실습<br>");
		out.print("</body></html>");
		out.close();
		
	}

}
