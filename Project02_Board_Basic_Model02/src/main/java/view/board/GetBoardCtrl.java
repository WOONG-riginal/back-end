package view.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import biz.board.BoardDAO;
import biz.board.BoardVO;



@WebServlet("/GetBoardCtrl")
public class GetBoardCtrl extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request,response);
	}

	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		// 세션 로그인
		HttpSession session=request.getSession();
		String name=(String)session.getAttribute("name");
		if(name==null) response.sendRedirect("login.jsp");
		// DAO 메서드 getBoard()
		int seq=Integer.parseInt(request.getParameter("seq"));
		
		BoardDAO bdao=new BoardDAO();
		BoardVO board=bdao.getBoard(seq);
		// 바인딩, 포워드 => if문 사용
		if(board!=null) { 
			request.setAttribute("board", board);
			RequestDispatcher view=request.getRequestDispatcher("./getBoard.jsp");
			view.forward(request, response);
		} else {
			response.sendRedirect("GetBoardListCtrl");
		}
	}

}
