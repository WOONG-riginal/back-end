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

import biz.common.JDBCConnection;

@WebServlet("/UserInfoUpdateCtrl")
public class UserInfoUpdateCtrl extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request,response);
	}

	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String id=request.getParameter("id");
		String password=request.getParameter("password");
		String name=request.getParameter("name");
		String role=request.getParameter("role");
	      
		// # DB 비즈니스 로직
		Connection conn=null;
		PreparedStatement stmt=null;
	      
		try {
			conn=JDBCConnection.getConnection();
			String sql="update exam_users set password=?,name=? where id=?";
			stmt=conn.prepareStatement(sql);
	        stmt.setString(1, password);
	        stmt.setString(2, name);
	        stmt.setString(3, id);
	        int cnt=stmt.executeUpdate();
	        if(cnt!=0) {
	            if(role.equals("Admin")) {
	            	response.sendRedirect("./adminIndex.jsp");
	            } else {
	            	response.sendRedirect("./index.jsp");
	            }
	        }
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         JDBCConnection.close(stmt, conn);
	      }
	}

}
