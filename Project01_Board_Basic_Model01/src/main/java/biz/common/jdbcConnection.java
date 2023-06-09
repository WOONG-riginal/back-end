package biz.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/* JDBC DB 접속 클래스 */
public class jdbcConnection {
	// DB 접속 메서드
	public static Connection getConnetction() throws ClassNotFoundException, SQLException{
		Class.forName("oracle.jdbc.driver.OracleDriver");
	    String url = "jdbc:oracle:thin:@localhost:1521:xe";
	    Connection conn = DriverManager.getConnection(url, "hr", "hr");
	    System.out.println("DB 접속");
	    
	    return conn;
	}
	
	// 자원 반납 메서드 = Select
	public static void close(ResultSet rs, PreparedStatement stmt, Connection conn) {
		if(rs!=null) {
			try {
				rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if(stmt!=null) {
			try {
				stmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if(conn!=null) {
			try {
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	// 자원 반납 메서드 = Insert, Update, Delete
	public static void close(PreparedStatement stmt, Connection conn) {
		if(stmt!=null) {
			try {
				stmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if(conn!=null) {
			try {
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	
}