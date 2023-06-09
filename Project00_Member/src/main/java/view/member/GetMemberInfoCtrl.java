package view.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import biz.member.MemberDAO;
import biz.member.MemberVO;


@WebServlet("/GetMemberInfoCtrl")
public class GetMemberInfoCtrl extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request,response);
	}

	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("id");
		
		MemberDAO dao=new MemberDAO();
		MemberVO member=dao.getUserInfo(id);
		request.setAttribute("member", member);
		
		RequestDispatcher view=request.getRequestDispatcher("memberInfo.jsp");
		view.forward(request, response);
	}

}
