package view;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/helloservletexe")
public class HelloServletExe extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		
		PrintWriter out=response.getWriter();
		
		String str="<html>";
		str+="<head>";
		str+="<title>Hello Servlet</title>";
		str+="</head>";
		str+="<body>";
		str+="<h1>Hello Servlet</h1>";
		str+="서블릿 이용 한글출력";
		str+="</body>";
		str+="</html>";
		
		out.print(str);
		// 입출력 관련 객체는 사용 후 반드시 닫아줘야 함
		out.close();
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
