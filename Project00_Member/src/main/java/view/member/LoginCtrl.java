package view.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import biz.member.MemberDAO;
import biz.member.MemberVO;


@WebServlet("/LoginCtrl")
public class LoginCtrl extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request,response);
	}

	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		// 폼 데이터
		String id=request.getParameter("id");
		String password=request.getParameter("password");
		// DAO 클래스 처리
		MemberDAO dao=new MemberDAO();
		MemberVO member=dao.getUser(id,password);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(member!=null) {
			HttpSession session=request.getSession();
			session.setAttribute("id", member.getId());
			session.setAttribute("name", member.getName());
			session.setAttribute("role", member.getRole());
			response.sendRedirect("index.jsp");
		}else {
			out.println("<script>");
			out.println("alert('아이디 또는 비밀번호를 확인하세요.');");
			out.println("location.href='login.jsp'");
			out.println("</script>");
		}
	}

}
