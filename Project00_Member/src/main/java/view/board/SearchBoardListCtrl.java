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


@WebServlet("/SearchBoardListCtrl")
public class SearchBoardListCtrl extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request,response);
	}
	
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		BoardDAO bdao=new BoardDAO();
		String condition=request.getParameter("condition");
		String search=request.getParameter("search");
		
		ArrayList<BoardVO> searchBoardList=null;
		searchBoardList=bdao.searchBoardList(condition,search);
		
		request.setAttribute("boardList", searchBoardList);
		RequestDispatcher view=request.getRequestDispatcher("./getBoardList.jsp");
		view.forward(request, response);
	}

}
