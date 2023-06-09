package exe;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/FormServlet")
public class FormServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		PrintWriter out=response.getWriter();
		
		out.print("<html><body>");
		out.print("이름 : "+request.getParameter("name"));
		out.print("<br><br>");
		out.print("아이디 : "+request.getParameter("id"));
		out.print("<br><br>");
		out.print("비밀번호 : "+request.getParameter("password"));
		out.print("<br><br>");
		out.print("주소 : "+request.getParameter("address"));
		out.print("<br><br>");
		out.print("주문개수 : "+request.getParameter("qty"));
		out.print("<br><br>");
		out.print("이메일 : "+request.getParameter("email"));
		out.print("<br><br>");
		out.print("URL : "+request.getParameter("url"));
		out.print("<br><br>");
		out.print("날짜 : "+request.getParameter("date"));
		out.print("<br><br>");
		out.print("코멘트 : "+request.getParameter("comment"));
		out.print("<br><br>");
		out.print("좋아하는 취미 : "+request.getParameter("fvThing"));
		out.print("<br><br>");
		out.print("좋아하는 영화 : ");
		String[] arr1=request.getParameterValues("fvMovie");
		for(String fvThing:arr1) {
			out.print(fvThing+"<br>");
		}
		out.print("<br>");
		out.print("가장 좋아하는 가수 : "+request.getParameter("choice"));
		out.print("<br><br>");
		out.print("좋아하는 가수 : ");
		String[] arr2=request.getParameterValues("choiceMulti");
		for(String choiceMulti:arr2) {
			out.print(choiceMulti+"<br>");
		}
		out.print("<br>");
		out.print("파일 : "+request.getParameter("file"));
		out.close();
	}

}
