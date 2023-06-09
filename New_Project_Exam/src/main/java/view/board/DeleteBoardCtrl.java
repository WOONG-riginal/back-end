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

import biz.common.JDBCConnection;

@WebServlet("/DeleteBoardCtrl")
public class DeleteBoardCtrl extends HttpServlet {
	// doGet()
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doGetPost(request, response);
		}

		
		// doPost()
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doGetPost(request, response);

		}
		
		// doGetPost()
		protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			//한글처리
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");
			
			// 로그인 처리 = 세션
			HttpSession session = request.getSession();
			String name = (String)session.getAttribute("name");
			if(name==null) {
				response.sendRedirect("./login.jsp");
			}
			
			// 폼데이터 처리
			int num = Integer.parseInt(request.getParameter("num"));
			
			// #. DB 비지니스 로직
			Connection conn = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;
			// DB 접속
			try {
				conn = JDBCConnection.getConnection();
				String sql = "DELETE FROM exam_board WHERE seq=?";
				stmt = conn.prepareStatement(sql);
				stmt.setInt(1, num);
				int cnt = stmt.executeUpdate();
				if(cnt!=0)response.sendRedirect("GetBoardListCtrl");
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				JDBCConnection.close(stmt, conn);
			}
			
		}

}
