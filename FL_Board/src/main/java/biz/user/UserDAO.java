package biz.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import biz.common.JDBCConnection;

/* 회원관련 비지니스 로직 처리 DAO */
public class UserDAO {
	public UserVO getUser(String id, String password) {
		// Connection 객체 선언
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		// 리턴 자바빈 전역변수 선언
		UserVO user = null;
		try {
			// db 접속
			conn = JDBCConnection.getConnection();
			// sql
			String sql = "select * from b_users where id = ? and password = ?";
			// ?
			stmt = conn.prepareStatement(sql);
			// ? 매핑
			stmt.setString(1, id);
			stmt.setString(2, password);
			// 실행
			rs = stmt.executeQuery();
			// 사용
			if(rs.next()) {
				user = new UserVO();
				user.setId(rs.getString("id"));
				user.setName(rs.getString("name"));
			}
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCConnection.close(rs, stmt, conn);
		}
		
		// 리턴
		return user;
		
	}
	
}
