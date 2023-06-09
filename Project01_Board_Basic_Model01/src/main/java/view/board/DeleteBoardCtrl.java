package view.board;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import biz.common.jdbcConnection;

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
		
		HttpSession session=request.getSession();
		String name=(String)session.getAttribute("name");
		// 세션 로그인 처리
		if(name==null) {
			response.sendRedirect("login.jsp");
		}
		
		int num=Integer.parseInt(request.getParameter("seq"));
		
		// # DB 비즈니스 로직
		Connection conn=null;
		PreparedStatement stmt=null;
		
		try {
			// 0. DB 접속
			conn=jdbcConnection.getConnetction();
			// 1. 쿼리문 준비
			String sql="delete from b_board where seq=?";
			// 2. prepareStatement
			stmt=conn.prepareStatement(sql);
			// 3. ? 매핑
			stmt.setInt(1, num);
			// 4. 실행
			int result = stmt.executeUpdate();
			if(result!=0) {
				response.sendRedirect("GetBoardListCtrl");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			jdbcConnection.close(stmt, conn);
		}
	}

}
