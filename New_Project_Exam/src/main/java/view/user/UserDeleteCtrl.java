package view.user;

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

@WebServlet("/UserDeleteCtrl")
public class UserDeleteCtrl extends HttpServlet {
	
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
		String id=request.getParameter("id");
		
		// #. DB 비지니스 로직
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			conn=JDBCConnection.getConnection();
			String sql = "DELETE FROM exam_users WHERE id=?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, id);
			int cnt = stmt.executeUpdate();
			session.invalidate();
			if(cnt!=0)response.sendRedirect("./index.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCConnection.close(stmt, conn);
		}
	}
}
