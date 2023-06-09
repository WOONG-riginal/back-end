package view.member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import biz.member.MemberDAO;
import biz.member.MemberVO;

@WebServlet("/getMemberListCtrl")
public class getMemberListCtrl extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request,response);
	}

	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDAO dao=new MemberDAO();
		ArrayList<MemberVO> memberList=dao.getMemberList();
		request.setAttribute("memberList", memberList);
		
		RequestDispatcher view=request.getRequestDispatcher("memberlist.jsp");
		view.forward(request, response);
	}

}
