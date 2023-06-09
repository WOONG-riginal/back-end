package view.board;
/* 목록 처리 컨트롤러 */
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
	// get, post 처리
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardDAO bdao = new BoardDAO();
		ArrayList<BoardVO> boardList = bdao.getBoardList();
		// 바인딩
		request.setAttribute("boardList", boardList);
		// 포워드
		RequestDispatcher dis = request.getRequestDispatcher("getBoardList.jsp");
		dis.forward(request, response);
	}

}
