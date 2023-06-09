package view;
/*
	Annotation 서블릿 매핑
	: 기존의 web.xmp은 설정 시 번거롭고 불편
	  서블릿 클래스에 @WebServlet("/서블릿매핑이름")을 이용해 표시하면 가독성도 좋고 편리함
	  톰캣 7버전부터 사용
	  단, 반드시 HttpServlet을 상속받은 클래스에서만 사용 가능
 */
import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/third")
public class HelloServlet3 extends HttpServlet {

	public void init(ServletConfig config) throws ServletException {
		System.out.println("세번째 init 호출");
	}

	public void destroy() {
		System.out.println("세번째 destroy");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("세번째 doGet()!!");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("세번째 doPost()!!");
	}

}
