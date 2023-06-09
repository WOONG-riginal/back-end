package biz.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import biz.common.jdbcConnection;

/* 회원 비즈니스 로직 처리 DAO */
public class UserDAO {
	public UserVO getUser(String id, String password) {
		// DB 연결 준비
		Connection conn=null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		
		// 자바빈 전역 변수 선언
		UserVO user=null;
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
			// 5. ResultSet 데이터 가져오기
			while(rs.next()) {
				user=new UserVO();
				user.setId(rs.getString("id"));
				user.setName(rs.getString("name"));
			}
		} catch (ClassNotFoundException e) {
	         e.printStackTrace();
	    } catch (SQLException e) {
	         e.printStackTrace();
	    } finally {
			jdbcConnection.close(rs, stmt, conn);
		}
		// 6. 리턴값
		return user;
	}
	
}
