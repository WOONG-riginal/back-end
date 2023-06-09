package view.board;
/* 글 상세보기 컨트롤러 */
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
		// DAO 메서드 getBoard()
		int num = Integer.parseInt(request.getParameter("num"));
		BoardVO vo = new BoardVO();
		vo.setSeq(num);
		
		BoardDAO bdao = new BoardDAO();
		BoardVO board = bdao.getBoard(vo);

		// 바인딩, 포워드 => if문 사용
		if(board !=null) {
			request.setAttribute("board", board);
			RequestDispatcher dis = request.getRequestDispatcher("getBoard.jsp");
			dis.forward(request, response);
		}else {
			response.sendRedirect("GetBoardListCtrl");
		}
		
	}

}
