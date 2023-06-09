package dao;
/*
	03_formdata.html 데이터 처리 서블릿
 */
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/formdata")
public class ServletFormData extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet 메서드 시작");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글처리
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		// 브라우저 출력 메서드
		PrintWriter out=response.getWriter();
		// 데이터 입력
		String name=request.getParameter("name");
		String id=request.getParameter("id");
		String pw=request.getParameter("password");
		String address=request.getParameter("address");
		// 주문수량 => 정수형으로 바꿔야 연산 가능
		int qty= Integer.parseInt(request.getParameter("qty"));
//		int qty= Integer.valueOf(request.getParameter("qty"));
		String email=request.getParameter("email");
		String url=request.getParameter("url");
		String date=request.getParameter("date");
		String comment=request.getParameter("comment");
		// 폼타입 radio = 단일 데이터
		String baseball=request.getParameter("baseball");
		// 폼타입 checkbox = 다중 데이터		
		String[] arr1=request.getParameterValues("favorite");
		// 폼타입 select = 단일 데이터
		String kleague=request.getParameter("kleague");
		// 폼타입 다중 select = 다중 데이터
		String[] arr2=request.getParameterValues("kleague2");
		// 파일 업로드 = 단일 데이터
		String upload=request.getParameter("upload");
		
		// 데이터 브라우저에 출력
		out.print("<h1>Form Data Value</h1>");
		out.print("이름 : "+name+"<br>");
		out.print("아이디 : "+id+"<br>");
		out.print("비밀번호 : "+pw+"<br>");
		out.print("주소 : "+address+"<br>");
		out.print("주문수량 : "+qty+"<br>");
		out.print("이메일 : "+email+"<br>");
		out.print("URL : "+url+"<br>");
		out.print("날짜 : "+date+"<br>");
		out.print("Comment : "+comment+"<br>");
		out.print("구단명 : "+baseball+"<br>");
		for(String favorite:arr1) {
			out.print("선호구단 : "+favorite+"<br>");
		}
		out.print("최고선호구단 : "+kleague+"<br>");
		for(String kleague2:arr2) {
			out.print("최고선호구단2 : "+kleague2+"<br>");
		}
		out.print("File Upload : "+upload+"<br>");
		// io객체 사용 후 닫기
		out.close();
		
	}

}
