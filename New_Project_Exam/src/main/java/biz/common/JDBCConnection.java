package biz.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class JDBCConnection {
	// DB 접속 메서드
	public static Connection getConnection() throws ClassNotFoundException, SQLException{ // throws : 호출 되는 곳에 던진다. 호출 되는 곳에서 예외처리해준다.
		Class.forName("oracle.jdbc.driver.OracleDriver");
		System.out.println("DB접속완료1");
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		System.out.println("DB접속완료2");
		Connection conn = DriverManager.getConnection(url, "hr", "hr");
		System.out.println("DB접속완료3");
		
		return conn;
	}
	
	// 자원반납 메서드 1
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
	
	// 자원반납 메서드 2
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
