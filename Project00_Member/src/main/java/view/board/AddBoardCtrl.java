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

@WebServlet("/AddBoardCtrl")
public class AddBoardCtrl extends HttpServlet {

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
		// 로그인 한 사람만 글 쓰도록 처리
		HttpSession session=request.getSession();
		String name=(String)session.getAttribute("name");
		if(name==null) {
			response.sendRedirect("login.jsp");
		}
		// 폼 데이터 받기
		String title=request.getParameter("title");
		String nickname=request.getParameter("nickname");
		String content=request.getParameter("content");
		String userid=request.getParameter("userid");

		// DAO 비즈니스 로직 처리 클래스
		BoardVO vo=new BoardVO();
		vo.setTitle(title);
		vo.setNickname(nickname);
		vo.setContent(content);
		vo.setUserid(userid);
		
		BoardDAO bdao=new BoardDAO();
		int result=bdao.addBoard(vo);
		if(result!=0) {
			response.sendRedirect("GetBoardListCtrl");
		}
		
	}

}
