package view.board;

import java.io.IOException;
import java.io.PrintWriter;

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
		// 로그인 처리
		HttpSession session=request.getSession();
		String name=(String)session.getAttribute("name");
		if(name==null) response.sendRedirect("login.jsp");
		
		// 폼 데이터
		int seq=Integer.parseInt(request.getParameter("seq"));
		
		// DAO 메서드 호출
		BoardDAO bdao=new BoardDAO();
		int result=bdao.deleteBoard(seq);
		// 삭제 후 GetBoardListCtrl 이동
		if(result!=0) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('삭제되었습니다');");
			out.println("location.href='GetBoardListCtrl'");
			out.println("</script>");
			out.close();
		}
	}

}
