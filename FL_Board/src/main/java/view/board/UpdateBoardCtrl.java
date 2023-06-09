package view.board;
/* 글수정 처리 컨트롤러 */
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

@WebServlet("/UpdateBoardCtrl")
public class UpdateBoardCtrl extends HttpServlet {
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
		// 로그인 처리
		HttpSession session = request.getSession();
		String name = (String)session.getAttribute("name");
		if(name==null) response.sendRedirect("login.jsp");
		// 폼데이터
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		int num = Integer.parseInt(request.getParameter("seq")); // hidden
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		// 폼데이터 자바빈 할당
		BoardVO vo = new BoardVO();
		vo.setSeq(num);
		vo.setTitle(title);
		vo.setContent(content);
		// DAO 메서드 호출 = updateBoard()
		BoardDAO bdao = new BoardDAO();
		int cnt = bdao.updateBoard(vo);
		// 업데이트 후 GetBoardListCtrl 이동
		if(cnt!=0) response.sendRedirect("GetBoardListCtrl");
	}

}
