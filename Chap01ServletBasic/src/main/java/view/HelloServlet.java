package view;
/*
	# 서블릿 이해하기
	: 정적 페이지의 문제점을 보완 => 동적 페이지를 구현하는 것 (서블릿,JSP)
	  초기 동적 웹페이지 = (Java언어로 개발 시) 서블릿(Servlet, Java로 만든 CGI 프로그램)을 이용해 구현
	  서블릿의 문제점 보완하여 나온 것 JSP
	  JSP의 많은 기능 = 서블릿 기능을 따름 => (공부법) 서블릿을 먼저 이해하고 JSP를 하면 더 쉽게 이해 가능
	  
	=======================================================================================================
	
	# 아파치 톰캣
	: 자바 기반 오픈 소스 WAS(Web Application Server)인 Servlet/JSP 컨테이너
	  서블릿은 톰캣 안에 포함되어 있어서 톰캣 안에서만 작동함
	  
	# 서블릿 동작 과정
	: 클라이언트(브라우저)요청 -> 웹서버 -> WAS에 위임 -> 서블릿 호출 -> 서블릿에서 결과처리 실행
	  -> WAS에 결과 전송 -> 웹서버 결과 전송 -> 클라이언트(브라우저) 결과 응답
	  
	# 서블릿 특징
	  a. 서버 쪽에서 기능 수행
	  b. 스레드 방식 실행
	  c. Java의 모든 특성을 가짐 (단, 단독으로 실행하지 못함 -> 톰캣 안에서만 실행 가능)
	  d. 보안 기능 적용이 쉬움
	  e. 웹 브라우저 요청 시 수행
	  
	# 서블릿 API 계층 구조
	  Servlet 인터페이스 <--- Generic Servlet 추상클래스 <--- HttpServlet 클래스
	  
	  ## HttpServlet 클래스 | javax.servlet.http 패키지
	  : HTTP프로토콜을 사용하는 서블릿 기능을 구현하는 클래스
	    클라이언트 요청 시 service()가 호출 => 데이터 요청 방식에 따라 doGet(), doPost()가 호출
	    (참고) Get -> 주소창에 같이 넘어감, Post -> body에 같이 넘아감
	    [API 상속구조] 서블릿 클래스는 HTTPServlet을 상속받아 사용하게 됨
	    
	# 서블릿 생명주기 메서드
	: 초기화 과정 -> 메모리에 인스턴스 생성 -> 서비스 수행 -> 종료 과정을 가짐
	  
	  서블릿은 각 요청 실행 단계마다 호출되어 기능을 수행하는 콜백 메서드들이 있음
	  1. init()
	    : 초기화 = 서블릿 요청 시 맨 처음 단 한 번만 호출 | 서블릿 생성 시 초기화 작업을 주로 수행
	     => 생략가능
	  2. doGet()/doPost()
	    : 작업수행 = 서블릿 호출 시 매번 호출, 실제로 클라이언트가 요청하는 작업을 수행
	     => 서블릿 구현의 핵심으로 반드시 구현해야 함
	  destroy()
	    : 종료 = 서블릿 기능을 수행, 메모리에서 소멸될 때 호출 | 서블릿 마무리 작업 시 주로 수행
	     => 생략가능
	     
	# 서블릿 동작 과정 = 코딩순서
	  a. 서블릿 클래스 만들기
	  b. 서블릿 생명주기 메서드 구현 = init(), doGet() 또는 doPost(), destroy()
	  c. 서블릿 매핑 작업 = web.xml 또는 annotation(주석) 사용
	  d. 클라이언트(웹브라우저) 서블릿 매핑이름 요청
 */
import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// 생명주기 메서드 = 초기화 
	public void init(ServletConfig config) throws ServletException {
		System.out.println("init 메서드 호출");
	}
	// 클라이언트(브라우저)에서 Get으로 데이터 넘길 때 요청 처리
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet 메서드 호출");
	}
	// 클라이언트(브라우저)에서 Post로 데이터 넘길 때 요청 처리
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost 메서드 호출");
	}
	// 생명주기 메서드 = 메모리에서 소멸시킬 때
	public void destroy() {
		System.out.println("destory 메서드 호출");
	}

}
