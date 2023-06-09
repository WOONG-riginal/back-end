package biz.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import biz.common.jdbcConnection;

public class UserDAO {
	Connection conn=null;
	PreparedStatement stmt=null;
	ResultSet rs=null;
	
	public UserVO getUser(String id, String password) {
		UserVO user=null;
		try {
			// 0. DB 접속
			conn=jdbcConnection.getConnection();
			// 1. 쿼리문 준비
			String sql="select * from b_users where id=? and password=?";
			// 2. prepareStatement
			stmt=conn.prepareStatement(sql);
			// 3. ? 매핑
			stmt.setString(1, id);
			stmt.setString(2, password);
			// 4. 실행
			rs=stmt.executeQuery();
			// 5. rs 데이터 할당
			if(rs.next()) {
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
