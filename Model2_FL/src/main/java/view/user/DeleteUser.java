package view.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import biz.user.UserDAO;
import biz.user.UserVO;


@WebServlet("/DeleteUser")
public class DeleteUser extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request,response);
	
	}
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//한글처리
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		// 로그인 처리 = 세션
		HttpSession session=request.getSession();
		String nickname=(String)session.getAttribute("nickname");
		if(nickname==null)response.sendRedirect("login.jsp");
		
		
		String id=request.getParameter("id");
		UserVO vo = new UserVO();
		vo.setId(id);
	
		PrintWriter writer = response.getWriter();
		UserDAO udao = new UserDAO();
		
		int result = udao.deleteUser(vo);
		if(result!=0) {
			writer.println("<script>alert('탈퇴가 완료되었습니다.')</script>");
			writer.println("<script>location.href='index.jsp'</script>");
			//세션 끊어주기
			session.invalidate();
		}
		writer.close();
		
	}

}
