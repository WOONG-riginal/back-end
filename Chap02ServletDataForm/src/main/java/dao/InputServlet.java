package dao;
/*
	Request(요청)와 Response(응답)
	: 브라우저에서 정보 전달 요청을 위해 사용하는 방법
	  a. get방식 = 주소창에 직접 원하는 데이터를 쓰거나 링크 클릭 시 호출 | doGet()에서 처리
	     Context/매핑명?속성명1=속성값1&속성명2=속성값2&...
	     특정 정보 이용 시 사용
	  b. post방식 = 폼에서 입력한 데이터를 submit버튼 클릭 시 호출 | doPost()에서 처리
	     주소와 데이터를 따로 보내는 방식
	     웹 화면을 통해 실제 처리가 필요한 작업을 하기 위해 사용
	     
	HTTP 규약(=프로토콜) => 데이터 교환에 대한 규칙과 약속
	: HyperTextTransferProtocol
	
	HTTP 메시지 구성
	: header, body로 구성
	  request header / request body
	  response header / response body
	  
	서블릿(Servlet)
	: JavaEE 기술, 개발자는 서버에서 처리되어야 하는 기능의 일부분만 작성
	               => 위임, 생성 등의 것은 톰캣(컨테이너)이 완성
	  아파치 톰캣 WAS 서버에 존재하여, 톰캣에서 실행됨
	  
	서블릿 프로그래밍이 기존 웹서버 프로그래밍과 다른점
	 a. 객체를 생성하거나 호출하는 주체 = 서블릿 컨테이너(톰캣) => 사용자가 하는 것이 아님
	    즉, 자바의 main()을 이용하여 프로그램 실행하지 않음
	 b. 서블릿 클래스에서 생성하는 객체의 관리 = 서블릿 컨테이너(톰캣)가 관리
	    (예)서블릿 생명주기 메서드
	 c. 서블릿/JSP 코드 = 기본적인 자바 API와 동일하게 사용됨 + 서블릿 API도 함께 사용
	                      단, 서블릿 API는 관련 라이브러리(플러그인) 필요
	
	JSP(JavaServerPages)언어
	: 서블릿 기술과 동일하게 (동적)으로 서버에서 데이터를 다루는 기술
	  Servlet JSP 모두 동적으로 데이터를 생성해 전송하는 것은 같음
	   => 구현 방식은 다름(주 개념)
	  a. Servlet = Java코드 + HTML
	  b. JSP = HTML + Java코드
	  
	JSP 언어에서는 get/post 처리방식의 구분이 없음
	: 쿼리스트링 처리 = Servlet에서 함
	  화면구성 = JSP로 함
 */
/*
	HttpServletRequest를 이용한 서블릿의 데이터 수신
 */
import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/input")
public class InputServlet extends HttpServlet {
	// doGet() = 데이터 get방식 처리
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글처리
		request.setCharacterEncoding("utf-8");
		// input 데이터 받기
		String id=request.getParameter("user_id");
		String pw=request.getParameter("user_pw");
		System.out.println(id+"\n"+pw);
		
		// 배열 처리
		String[] subject=request.getParameterValues("subject");
		// 배열 요소 추출
//		for(int i=0;i<subject.length;i++) {
//			System.out.println(subject[i]);
//		}
		for(String str:subject) {
			System.out.println(str);
		}
		
	}
	// doPost() = 데이터 post방식 처리
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
