package biz.user;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import biz.board.BoardVO;
import biz.common.jdbcConnection;

/* 회원 비즈니스 로직 처리 DAO */
// DB 연결 준비
public class UserDAO {
	Connection conn=null;
	PreparedStatement stmt=null;
	ResultSet rs=null;
	
	public UserVO getUser(String id, String password) {
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
				user.setNickname(rs.getString("nickname"));
				user.setRole(rs.getString("role"));
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
	
	public ArrayList<UserVO> getUserList() {
		ArrayList<UserVO> userList=null;
		try {
		// 0. DB 연결
			conn=jdbcConnection.getConnetction();
			// 1. 쿼리문 준비
			String sql="select * from b_users";
			// 2. prepareStatement
			stmt=conn.prepareStatement(sql);
			// 3. ? 매핑 X
			// 4. 실행
			rs=stmt.executeQuery();
			// 5. 사용
			userList=new ArrayList<UserVO>();
			while(rs.next()) {
				UserVO users=new UserVO();
				users.setId(rs.getString("id"));
				users.setName(rs.getString("name"));
				users.setNickname(rs.getString("nickname"));
				users.setRole(rs.getString("role"));
				
				userList.add(users);
			}
		} catch (ClassNotFoundException e) {
	         e.printStackTrace();
	    } catch (SQLException e) {
	         e.printStackTrace();
	    } finally {
			jdbcConnection.close(rs, stmt, conn);
		}
		// 호출하는 곳으로 반환
		return userList;
	}
	
	public int addUsers(UserVO vo) {
		int result=0;
		try {
			// 0. DB 연결
			conn=jdbcConnection.getConnetction();
			// 1. 쿼리문 준비
			String sql="insert into b_users(id, password, name, nickname) values(?,?,?,?)";
			// 2. prepareStatement
			stmt=conn.prepareStatement(sql);
			// 3. ? 매핑
			stmt.setString(1, vo.getId());
			stmt.setString(2, vo.getPassword());
			stmt.setString(3, vo.getName());
			stmt.setString(4, vo.getNickname());
			// 4. 실행
			result=stmt.executeUpdate();
		} catch (ClassNotFoundException e) {
	         e.printStackTrace();
	    } catch (SQLException e) {
	         e.printStackTrace();
	    } finally {
			jdbcConnection.close(stmt, conn);
		}
		return result;
	}
	
	public UserVO getUserInfo(UserVO vo) {
		UserVO user=null;
		try {
			// 0. DB 연결
			conn=jdbcConnection.getConnetction();
			// 1. 쿼리문 준비
			String sql="select * from b_users where nickname=?";
			// 2. prepareStatement
			stmt=conn.prepareStatement(sql);
			// 3. ? 매핑 X
			stmt.setString(1, vo.getNickname());
			// 4. 실행
			rs=stmt.executeQuery();
			// 5. 사용
			if(rs.next()) {
				user=new UserVO();
				user.setId(rs.getString("id"));
				user.setName(rs.getString("name"));
				user.setNickname(rs.getString("nickname"));
				user.setRole(rs.getString("role"));
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
	
	//  회원 탈퇴 메서드
	public int deleteUser(UserVO vo) {
		int rs = 0;
		try {
			// 0. DB 연결
			conn=jdbcConnection.getConnetction();
			// 1. 쿼리문 준비
			String sql="delete from b_users where id=?";
			// 2. prepareStatement
			stmt=conn.prepareStatement(sql);
			// 3. ? 매핑
			stmt.setString(1, vo.getId());
			// 4. 실행
			rs = stmt.executeUpdate();
		} catch (ClassNotFoundException e) {
	         e.printStackTrace();
	    } catch (SQLException e) {
	         e.printStackTrace();
	    } finally {
			jdbcConnection.close(stmt, conn);
		}
		
		return rs;
	}
	
	
	
}
