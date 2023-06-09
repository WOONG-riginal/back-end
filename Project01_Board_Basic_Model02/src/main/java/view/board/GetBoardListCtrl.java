package view.board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import biz.board.BoardDAO;
import biz.board.BoardVO;

@WebServlet("/GetBoardListCtrl")
public class GetBoardListCtrl extends HttpServlet {
		
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request,response);
	}
	
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardDAO bdao=new BoardDAO();
		ArrayList<BoardVO> boardList=bdao.getBoardList();
		request.setAttribute("boardList", boardList);
		RequestDispatcher view=request.getRequestDispatcher("./getBoardList.jsp");
		view.forward(request, response);
		
	}
}
