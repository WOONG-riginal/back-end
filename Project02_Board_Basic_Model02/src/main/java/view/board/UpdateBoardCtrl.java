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


@WebServlet("/UpdateBoardCtrl")
public class UpdateBoardCtrl extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request,response);
	}

	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		// 로그인 처리
		HttpSession session=request.getSession();
		String name=(String)session.getAttribute("name");
		if(name==null) response.sendRedirect("login.jsp");
		
		// 폼 데이터
		int seq=Integer.parseInt(request.getParameter("seq"));
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		// 폼 데이터 자바빈 할당
		BoardVO vo=new BoardVO();
		vo.setSeq(seq);
		vo.setTitle(title);
		vo.setContent(content);

		// DAO 메서드 호출
		BoardDAO bdao=new BoardDAO();
		int result=bdao.updateBoard(vo);
		// 업데이트 후 GetBoardListCtrl 이동
		if(result!=0) response.sendRedirect("GetBoardListCtrl");
	}

}
