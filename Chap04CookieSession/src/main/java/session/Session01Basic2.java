package session;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/session2")
public class Session01Basic2 extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글처리
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		PrintWriter out=response.getWriter();
		
		// 최초 요청 시 세션 객체를 새로 생성하거나 또는 기존 세션 반환 = getSession()메서드 사용
		HttpSession session=request.getSession();
		
		// 생성된 객체의 객체 id를 가져옴
		System.out.println("세션 아이디 : "+session.getId());
		// 최초 세션 생성시간
		out.print("최초 세션 생성시간 : "+new Date(session.getCreationTime())+"<br>");
		// 세션 객체에 최근 접근한 시간
		out.print("최근 세션 접근시간 : "+new Date(session.getLastAccessedTime())+"<br>");
		// 세션 객체 유지 유효시간 = 기본 30분
		out.print("세션 유효 시간 : "+session.getMaxInactiveInterval()+"<br>");
		
		if(session.isNew()) { // 새로운 세션인지 아닌지 판별 = 클라이언트에 세션 id를 할당하지 않은 경우 true
			out.print("새로운 세션 생성");
		}
		
		// 세션 강제 삭제 = 브라우저와 서버의 연결 끊기
		session.invalidate();
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
