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
		// 한글처리
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		// 세션 로그인
		HttpSession session=request.getSession();
		String name=(String)session.getAttribute("name");
		if(name==null) {
			response.sendRedirect("login.jsp");
		}
		// DAO 넘겨줄 파라미터 값 할당
		int num=Integer.parseInt(request.getParameter("seq"));
		// 자바빈 seq에 값 setting
		BoardVO vo=new BoardVO();
		vo.setSeq(num);
		// DAO 클래스 사용
		BoardDAO bdao=new BoardDAO();
		BoardVO board=bdao.getBoard(vo);
		
		// 조건문 dao에서 리턴된 값이 있으면
		if(board!=null) {
		// getBoard.jsp에 레코드셋 값 넘겨주기 
			request.setAttribute("board", board);
			RequestDispatcher view=request.getRequestDispatcher("./getBoard.jsp");
			view.forward(request, response);
		} else { // 없으면
		// 글 목록으로 이동
			response.sendRedirect("GetBoardListCtrl");
		}
	}

}
