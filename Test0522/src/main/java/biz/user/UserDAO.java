package biz.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import biz.common.jdbcConnection;

public class UserDAO {
	public UserVO getUser(String id, String password) {
		Connection conn=null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		
		UserVO user=null;
		try {
			conn=jdbcConnection.getConnection();
			String sql="select * from test_users where id=? and password=?";
			stmt=conn.prepareStatement(sql);
			stmt.setString(1, id);
			stmt.setString(2, password);
			rs=stmt.executeQuery();
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
		return user;
	}
	
}
