package view.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import biz.member.MemberDAO;
import biz.member.MemberVO;

@WebServlet("/CheckInfo")
public class CheckInfo extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request,response);
	}

	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("id");
		String password=request.getParameter("password");
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		MemberDAO dao=new MemberDAO();
		String pwChk=dao.checkPw(id);
		
		if(password.equals(pwChk)) {
			MemberVO member=dao.getUserInfo(id);
			request.setAttribute("password", password);
			request.setAttribute("member", member);
			RequestDispatcher view=request.getRequestDispatcher("updateMember.jsp");
			view.forward(request, response);
		}else {
			out.println("<script>");
			out.println("alert('비밀번호를 확인하세요.');");
			out.println("history.back();");
			out.println("</script>");
		}
	}

}
