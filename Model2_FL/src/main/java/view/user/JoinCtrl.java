package view.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import biz.user.UserDAO;
import biz.user.UserVO;

@WebServlet("/JoinCtrl")
public class JoinCtrl extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request,response);
	}
	
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글처리
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		// 폼 데이터 받기
		String id=request.getParameter("id");
		String password=request.getParameter("password");
		String name=request.getParameter("name");
		String nickname=request.getParameter("nickname");
		
		UserVO vo=new UserVO();
		vo.setId(id);
		vo.setPassword(password);
		vo.setName(name);
		vo.setNickname(nickname);
		
		UserDAO udao=new UserDAO();
		int result=udao.addUsers(vo);
		if(result!=0) {
			response.sendRedirect("./login.jsp");
		}
		
	}

}
