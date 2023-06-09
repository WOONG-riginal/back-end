package view.board;
/* 글쓰기 처리 컨트롤러 */
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
		// 접속한 유저 name 값 저장 , name이 없으면 login.jsp로 이동
		HttpSession session = request.getSession();
		String name = (String) session.getAttribute("name");
		if(name == null) response.sendRedirect("login.jsp");
		// 폼 데이터 받기
		// 한글처리
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String title = request.getParameter("title");
		String nickname = request.getParameter("nickname");
		String content = request.getParameter("content");
		// 입력 받은 폼 데이터 자바빈에 할당
		BoardVO vo = new BoardVO();
		vo.setTitle(title);
		vo.setNickname(nickname);
		vo.setContent(content);
		// DAO 클래스 글쓰기 메서드 호출
		BoardDAO bdao = new BoardDAO();
		int cnt = bdao.addBoard(vo);
		if(cnt != 0) response.sendRedirect("GetBoardListCtrl");
		
		// DB에 글쓰기가 성공했으면, 목록으로 이동
	}

}
