package control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberDAO;
import model.MemberVO;


@WebServlet("/MemberListCtrl.do")
public class MemberListCtrl extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    doGetPost(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    doGetPost(request,response);
	}
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("utf-8");
	    response.setContentType("text/html;charset=utf-8");
	    
	    MemberDAO dao=new MemberDAO();
	    ArrayList<MemberVO> memberList=dao.getAllMember();
	    
	    request.setAttribute("memberList", memberList);
	    RequestDispatcher dis=request.getRequestDispatcher("MemberList.jsp");
    	dis.forward(request, response);
	}

}
