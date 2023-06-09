package view.board;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import biz.board.BoardDAO;
import biz.board.BoardVO;

@WebServlet("/DeleteBoardCtrl")
public class DeleteBoardCtrl extends HttpServlet {
	
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
		// 로그인 처리
		HttpSession session=request.getSession();
		String nickname=(String)session.getAttribute("nickname");
		if(nickname==null)response.sendRedirect("login.jsp");
		// 파라미터 값 할당
		int seq=Integer.parseInt(request.getParameter("seq"));
		// 자바빈에 삭제할 값 할당
		BoardVO vo=new BoardVO();
		vo.setSeq(seq);
		// DAO 클래스 사용
		BoardDAO bdao=new BoardDAO();
		int result=bdao.deleteBoard(vo);
		if(result!=0) {
			response.sendRedirect("GetBoardListCtrl");
		}
	}

}
