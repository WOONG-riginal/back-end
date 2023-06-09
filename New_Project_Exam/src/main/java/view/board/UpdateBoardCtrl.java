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

@WebServlet("/UpdateBoardCtrl")
public class UpdateBoardCtrl extends HttpServlet {
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
			
			// 폼 데이터 받기
			int num = Integer.parseInt(request.getParameter("seq")); // hidden
			String title = request.getParameter("title");
			String content =request.getParameter("content");
			
			
			// #. DB 비지니스 로직
			Connection conn = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;
			
			try {
				conn = JDBCConnection.getConnection();
				// 1. 쿼리문
				String sql = "UPDATE exam_board SET title= ?, content= ? WHERE seq=?";
				// 2. prepareStatement
				stmt = conn.prepareStatement(sql);
				// 3. ? 매핑
				stmt.setString(1, title);
				stmt.setString(2, content);
				stmt.setInt(3, num);
				// 4. 실행
				int cnt = stmt.executeUpdate();
				if(cnt !=0) response.sendRedirect("GetBoardListCtrl");
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				JDBCConnection.close(stmt, conn);
			}
					
		}

}
