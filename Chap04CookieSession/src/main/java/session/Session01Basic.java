package session;
/*
	세션을 이용한 웹 페이지 연동
	: 웹 페이지들끼리 공유 정보를 서버에 저장 => 웹 페이지들을 매개해 주는 방법
	  => 서버의 메모리에 생성되어 정보를 저장
	  => 로그인처럼 보안이 요구되는 정보는 대부분 세션을 이용
	  => [중요] 각 브라우저 당 1개(=사용자 당 1개가 생성)
	
	세션 실행 과정
	  A. 클라이언트 브라우저 => 서버에 최초 접속
	    a. 서버의 서블릿은 세션 객체를 생성
	    b. 세션 객체에 대한 세션 id를 브라우저에 전송
	    c. 브라우저는 서버로부터 받은 세션 id를 브라우저가 사용하는 [세션 쿠키]에 저장
	       (서버로부터 전송된 세선 id도 일종의 쿠키)
	  B. 클라이언트 브라우저 => 재접속 시
	    a. 세션 쿠키에 저장된 세션 id를 다시 서버로 전송
	    b. 서버에서는 전송된 세션 id를 이용
	    c. 브라우저 세션 객체에 접근하여 브라우저에 대한 작업수행(예:로그인)
	    
	세션의 중요한 특징
	  => 브라우저 당 1개씩 생성 (사용자 당 1개 생성)
	  => 브라우저 종료 시 세션 해제
	  
	Session API
	  => HttpSession 객체 사용
	  => HttpServletRequest의 getSession()메서드 호출
	  => getSession() = 기본 세션 객체가 존재하면 반환, 없으면 새로 생성
 */
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/sessionbasic")
public class Session01Basic extends HttpServlet {
	
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
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
