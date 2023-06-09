package view.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import biz.user.UserDAO;
import biz.user.UserVO;

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
		
		String id=request.getParameter("id");
		String password=request.getParameter("password");
		
		UserDAO udao=new UserDAO();
		UserVO user=udao.getUser(id, password);
		
		if(user!=null) {
			HttpSession session=request.getSession();
			session.setAttribute("name", user.getName());
			response.sendRedirect("index.jsp");
		}else { // 값이 없으면
			response.sendRedirect("login.jsp");
		}
		
	}

}
