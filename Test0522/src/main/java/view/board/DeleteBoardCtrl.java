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
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		HttpSession session=request.getSession();
		String name=(String)session.getAttribute("name");
		if(name==null)response.sendRedirect("login.jsp");

		int seq=Integer.parseInt(request.getParameter("seq"));

		BoardVO vo=new BoardVO();
		vo.setSeq(seq);
		BoardDAO bdao=new BoardDAO();
		int result=bdao.deleteBoard(vo);
		if(result!=0) {
			response.sendRedirect("./getBoardList.jsp");
		}
	}

}
