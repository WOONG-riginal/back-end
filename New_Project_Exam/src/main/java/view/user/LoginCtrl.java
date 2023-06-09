package view.user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import biz.common.JDBCConnection;

@WebServlet("/LoginCtrl")
public class LoginCtrl extends HttpServlet {

	   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	   }
	   
	   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      // 한글처리
	      request.setCharacterEncoding("utf-8");
	      response.setContentType("text/html; charset=utf-8");
	      
	      // loginjsp에서 넘긴 id,pw 값 받아오기 
	      String id = request.getParameter("id");
	      String password = request.getParameter("password");
	      Connection conn = null;
	      PreparedStatement stmt = null;
	      ResultSet rs = null; 
	      try {
	         // DB접속 
	         conn = JDBCConnection.getConnection();
	         // sql
	         String sql = "select * from exam_users where id=? and password =?";
	         // preparestatements
	         stmt = conn.prepareStatement(sql);
	         // ? 맵핑
	         stmt.setString(1,id);
	         stmt.setString(2,password);
	         // 쿼리문 실행
	         rs = stmt.executeQuery();
	         
	         // 다음 값이 있으면 세션 처리
	        if(rs.next()) {
	        	String name = rs.getString("name");
	        	String role = rs.getString("role");
	        	String userId = rs.getString("id");
	            HttpSession session = request.getSession();
	            session.setAttribute("name", name); // DB에서 가져온 해당 회원의 이름 할당
	            session.setAttribute("role", role);
	            session.setAttribute("id", userId);
	            if(role.equals("Admin")) {
	              response.sendRedirect("./adminIndex.jsp");
	            }
	            else {
	              response.sendRedirect("./index.jsp");
	            }
	    	}else {
	    		response.sendRedirect("./login.jsp");
	    	}
	         
	         
	      } catch (ClassNotFoundException e) {
	         e.printStackTrace();
	      }catch (SQLException e) {
	            e.printStackTrace(); 
	         }
	      finally {
	         JDBCConnection.close(rs, stmt, conn);
	      }
	      
	   }

}
