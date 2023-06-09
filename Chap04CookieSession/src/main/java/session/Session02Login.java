package session;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/loginsession")
public class Session02Login extends HttpServlet {
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
		// PrintWriter
		PrintWriter out=response.getWriter();
		// 세션생성
		HttpSession session=request.getSession();
		// 파라메터값 할당
		String id=request.getParameter("user_id");
		String pw=request.getParameter("user_pw");
		
		// 세션 존재 유무
		if(session.isNew()) { // 세션 유무 판별
			// id값이 있으면 세션 id에 데이터 바인딩
			if(id != null) {
				session.setAttribute("user_id",id);
				out.print("<a href='loginsession'>로그인 상태 확인(id값이 있으면)</a>");
			}else {
				out.print("<a href='03_login_session.html'>id값이 없으므로 로그인하세요</a>");
				session.invalidate(); // 세션해제
			}
		}else { // 최초 요청이 아닐 때(먼저 세션에 값 저장 후) id를 가져와 이전에 로그인을 했는지 여부 확인
			id=(String)session.getAttribute("user_id"); // 세션 타입을 문자열로 캐스팅
			if(id != null && id.length() != 0) {
				out.print("안녕하세요 "+id+"님!!"); // 세션값 적용
			}else {
				out.print("<a href='03_login_session.html'>id값이 없으므로 로그인하세요</a>");
				session.invalidate(); // 세션해제
			}
		}
		
		
	}
}
