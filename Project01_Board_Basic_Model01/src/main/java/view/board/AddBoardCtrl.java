package view.board;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import biz.common.jdbcConnection;

@WebServlet("/AddBoardCtrl")
public class AddBoardCtrl extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글처리
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		// 0. 로그인 유무 체크 (=로그인 된 회원만 글쓰기 가능)
		HttpSession session=request.getSession();
		String name=(String)session.getAttribute("name");
		// 로그인이 안되어있으면 로그인 창으로 이동
		if(name==null) {
			response.sendRedirect("login.jsp");
		}
		// 로그인 되어있으면 파라미터 값 할당
		String title=request.getParameter("title");
		String nickname=request.getParameter("nickname");
		String content=request.getParameter("content");
		
		// # DB 비즈니스 로직
		Connection conn=null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		
		try {
			// 0. DB 접속
			conn=jdbcConnection.getConnetction();
			// 1. 쿼리문 준비
			String sql="insert into b_board(seq,title,nickname,content) values("
					+ "(select nvl(max(seq),0)+1 from b_board),?,?,?"
					+ ")";
			// 2. prepareStatement
			stmt=conn.prepareStatement(sql);
			// 3. ? 매핑
			stmt.setString(1, title);
			stmt.setString(2, nickname);
			stmt.setString(3, content);
			// 4. 실행
			int cnt=stmt.executeUpdate();
			if(cnt!=0) {
				response.sendRedirect("GetBoardListCtrl");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			jdbcConnection.close(stmt, conn);
		}
		
		
		
	}

}
