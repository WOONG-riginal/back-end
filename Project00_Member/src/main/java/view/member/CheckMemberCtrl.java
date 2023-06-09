package view.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import biz.common.jdbcConnection;
import biz.member.MemberDAO;


@WebServlet("/CheckMemberCtrl")
public class CheckMemberCtrl extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request,response);
	}

	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("id");
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		MemberDAO dao=new MemberDAO();
		int check=dao.memberCheck(id);
		
		if(check==1) {
			out.println("<script>");
			out.println("alert('이미 사용중인 아이디 입니다.');");
			out.println("location.href='memberCheck.jsp'");
			out.println("</script>");
		}
		HttpSession session=request.getSession();
		session.setAttribute("id", id);
		out.println("<script>");
		out.println("alert('사용 가능한 아이디 입니다.');");
		out.println("opener.location.reload();");
		out.println("self.close();");
		out.println("</script>");
	}

}
