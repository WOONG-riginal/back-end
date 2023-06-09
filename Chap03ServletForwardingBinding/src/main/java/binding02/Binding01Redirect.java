package binding02;
/*
	바인딩 (Binding)
	: 전달하는 데이터의 양이 적을 때 get방식으로 편리하게 전달 가능
	  => get은 데이터 전달 시 문제점이 있음 (보안, 적은 데이터량)
	  
	웹프로그램 실행 시 데이터를 (서블릿 관련 객체)에 저장하는 방법
	: HttpServletRequest, HttpSession, ServletContext 객체를 사용
	  => 저장된 데이터는 서블릿이나 JSP에서 서로 전달하고 공유하며 사용
 */
/*
	[get방식]
	  a. 서블릿에 데이터 전송 시 데이터가 url 뒤 속성명=속성값 형태로 전송 => 주소값과 붙어서 전송
	  b. 여러 데이터 전송 시 &로 구분
	  c. 보안에 취약
	  d. 최대 255자
	  e. 기본 데이터 전송방식
	  f. 웹 브라우저에 직접 입력 전송가능
	  g. 서블릿에서 doGet()이용해 데이터 처리
	  
	[post방식]
	  a. 서블릿에 데이터 전송 시 데이터가 body영역에 숨겨진 채 전송
	  b. 보안에 유리
	  c. 전송 데이터 용량 제한없음
	  d. 속도가 약간 느림 = 전송 시 서블릿에서 다시 가져오는 작업을 함
	  e. 서블릿에서 doPost()이용해 데이터 처리
 */
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/bindingredirect")
public class Binding01Redirect extends HttpServlet {

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
		// request객체에 저장
		// 1. 웹브라우저에서 요청한 request객체에 해당값을 바인딩
		request.setAttribute("name", "신현웅");
		// 2. 두번째 서블릿으로 전달 = 웹브라우저 통해서 처리
		response.sendRedirect("bindingredirect2");
		
	}

}
