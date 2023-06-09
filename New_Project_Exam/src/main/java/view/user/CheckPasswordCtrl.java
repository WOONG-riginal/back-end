package view.user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import biz.common.JDBCConnection;

@WebServlet("/CheckPasswordCtrl")
public class CheckPasswordCtrl extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request,response);
	}

	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		HttpSession session=request.getSession();
		String name=(String)session.getAttribute("name");
		if(name==null) response.sendRedirect("./login.jsp");
		
		String password=request.getParameter("password");
		String id=(String)session.getAttribute("id");
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = JDBCConnection.getConnection();
	         // sql
			 String sql = "select * from exam_users where id=?";
			 // preparestatements
			 stmt = conn.prepareStatement(sql);
			 // ? 맵핑
			 stmt.setString(1,id);
			 // 쿼리문 실행
			 rs = stmt.executeQuery();
			 if(rs.next()) {
				 String checkPw=rs.getString("password");
				 if(password.equals(checkPw)) {
					 response.sendRedirect("./userInfo.jsp");
				 }else {
					 response.sendRedirect("GetBoardListCtrl");
				 }
			 }
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCConnection.close(rs, stmt, conn);
		}
	}
}
