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

import biz.common.jdbcConnection;

@WebServlet("/LoginCtrl")
public class LoginCtrl extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글처리
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		// 파라미터 값 받기
		String id=request.getParameter("id");
		String password=request.getParameter("password");
		// 파라미터값 콘솔 확인
//		System.out.println(id+" "+password);
		
		// # DB 비즈니스 로직
		Connection conn=null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		
		try {
			// 0. DB 접속
			conn=jdbcConnection.getConnetction();
			// 1. 쿼리문 준비
			String sql="select * from b_users where id=? and password=?";
			// 2. prepareStatement
			stmt=conn.prepareStatement(sql);
			// 3. ? 매핑
			stmt.setString(1, id);
			stmt.setString(2, password);
			// 4. 실행
			rs=stmt.executeQuery();
			// 5. 데이터 정리 메서드
			if(rs.next()) {
				String name=rs.getString("name");
				HttpSession session=request.getSession();
				session.setAttribute("name",name); // DB에서 가져온 해당 회원 이름 할당
//				response.sendRedirect("index.jsp");
				response.sendRedirect("GetBoardListCtrl");
			}else {
				response.sendRedirect("login.jsp");
			}
			
		} catch (ClassNotFoundException e) {
	         e.printStackTrace();
	    } catch (SQLException e) {
	         e.printStackTrace();
	    } finally {
			jdbcConnection.close(rs,stmt,conn);
		}
		
		
		
		
	}
	
}
