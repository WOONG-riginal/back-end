package view.user;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import biz.user.UserDAO;
import biz.user.UserVO;

@WebServlet("/GetUserInfo")
public class GetUserInfo extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request,response);
	}
	
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String nickname=(String)session.getAttribute("nickname");
		if(nickname==null) {
			response.sendRedirect("login.jsp");
		}
		
		UserVO vo=new UserVO();
		vo.setNickname(nickname);
		
		UserDAO udao=new UserDAO();
		UserVO user=udao.getUserInfo(vo);
		
		if(user!=null) {
			request.setAttribute("user", user);
			RequestDispatcher view=request.getRequestDispatcher("./getUserInfo.jsp");
			view.forward(request, response);
		} else {
			response.sendRedirect("login.jsp");
		}
		
	}

}
