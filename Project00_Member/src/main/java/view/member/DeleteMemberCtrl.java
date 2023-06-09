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

@WebServlet("/DeleteMemberCtrl")
public class DeleteMemberCtrl extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request,response);
	
	}
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		// 로그인 처리 = 세션
		HttpSession session=request.getSession();
		String name=(String)session.getAttribute("name");
		if(name==null)response.sendRedirect("login.jsp");
		
		String id=request.getParameter("id");
	
		PrintWriter writer = response.getWriter();
		MemberDAO udao = new MemberDAO();
		
		int result = udao.deleteMember(id);
		if(result!=0) {
			writer.println("<script>alert('회원탈퇴가 완료되었습니다')</script>");
			writer.println("<script>location.href='index.jsp'</script>");
			
			session.invalidate();
		}
		writer.close();
		
	}

}
