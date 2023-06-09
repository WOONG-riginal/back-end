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
		// 한글처리
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		// 폼 데이터
		String id=request.getParameter("id");
		String password=request.getParameter("password");
		// DAO 클래스 처리
		UserDAO udao=new UserDAO();
		UserVO user=udao.getUser(id,password);
		
		if(user!=null) {
			HttpSession session=request.getSession();
			session.setAttribute("name", user.getName());
			response.sendRedirect("GetBoardListCtrl");
		}else {
			response.sendRedirect("login.jsp");
		}
	}

}
