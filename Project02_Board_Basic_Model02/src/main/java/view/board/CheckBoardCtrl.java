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


@WebServlet("/CheckBoardCtrl")
public class CheckBoardCtrl extends HttpServlet {
	// doGet
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request,response);
	}

	// doPost
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request,response);		
	}
	// get, post 처리
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 세션 로그인
		HttpSession session = request.getSession();
		String name = (String)session.getAttribute("name");
		if(name==null) response.sendRedirect("login.jsp");
		
		// DAO 메서드 checkBoard()
		int seq=Integer.parseInt(request.getParameter("seq"));
		
		BoardDAO bdao = new BoardDAO();
		BoardVO board = bdao.checkBoard(seq);

		// 바인딩, 포워드 => if문 사용
		if(board !=null) {
			request.setAttribute("board", board);
			RequestDispatcher dis = request.getRequestDispatcher("updateBoard.jsp");
			dis.forward(request, response);
		}else {
			response.sendRedirect("GetBoardListCtrl");
		}
		
	}
}
