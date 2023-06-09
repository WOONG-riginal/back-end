package biz.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import biz.board.BoardVO;
import biz.common.jdbcConnection;

public class MemberDAO {
	Connection conn=null;
	PreparedStatement stmt=null;
	ResultSet rs=null;
	
	// #1. 회원가입
	public int joinMember(MemberVO vo) {
	    int result=0;
	    
		try {
			// 0. DB 연결
			conn=jdbcConnection.getConnection();
			// 1. 쿼리문 준비
			String sql="insert into fl_member(id,password,name,email,tel,hobby,job,age,info) values(?,?,?,?,?,?,?,?,?)";
			// 2. prepareStatement
			stmt=conn.prepareStatement(sql);
			// 3. ? 매핑
			stmt.setString(1, vo.getId());
			stmt.setString(2, vo.getPassword());
			stmt.setString(3, vo.getName());
			stmt.setString(4, vo.getEmail());
			stmt.setString(5, vo.getTel());
			stmt.setString(6, vo.getHobby());
			stmt.setString(7, vo.getJob());
			stmt.setString(8, vo.getAge());
			stmt.setString(9, vo.getInfo());
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
	
	// #2. 로그인
	public MemberVO getUser(String id, String password) {
		MemberVO member=null;
		try {
			// 0. DB 접속
			conn=jdbcConnection.getConnection();
			// 1. 쿼리문 준비
			String sql="select * from fl_member where id=? and password=?";
			// 2. prepareStatement
			stmt=conn.prepareStatement(sql);
			// 3. ? 매핑
			stmt.setString(1, id);
			stmt.setString(2, password);
			// 4. 실행
			rs=stmt.executeQuery();
			// 5. 사용
			if(rs.next()) {
				member=new MemberVO();
				member.setId(rs.getString("id"));
				member.setName(rs.getString("name"));
				member.setRole(rs.getString("role"));
			}
		} catch (ClassNotFoundException e) {
	         e.printStackTrace();
	    } catch (SQLException e) {
	         e.printStackTrace();
	    } finally {
			jdbcConnection.close(rs, stmt, conn);
		}
		// 6. 리턴값
		return member;
	}
	
	// #3. 멤버 목록보기
	public ArrayList<MemberVO> getMemberList() {
		ArrayList<MemberVO> memberList=null;
		try {
			// 0. DB 연결
			conn=jdbcConnection.getConnection();
			// 1. 쿼리문 준비
			String sql="select * from fl_member";
			// 2. prepareStatement
			stmt=conn.prepareStatement(sql);
			// 3. ? 매핑 X
			// 4. 실행
			rs=stmt.executeQuery();
			// 5. 사용
			memberList=new ArrayList<MemberVO>();
			while(rs.next()) {
				MemberVO member=new MemberVO();
				member.setId(rs.getString("id"));
				member.setName(rs.getString("name"));
				member.setEmail(rs.getString("email"));
				member.setTel(rs.getString("tel"));
				member.setHobby(rs.getString("hobby"));
				member.setJob(rs.getString("job"));
				member.setAge(rs.getString("age"));
				
				memberList.add(member);
			}
		} catch (ClassNotFoundException e) {
	         e.printStackTrace();
	    } catch (SQLException e) {
	         e.printStackTrace();
	    } finally {
			jdbcConnection.close(rs, stmt, conn);
		}
		return memberList;
	}
	
	// #4. 아이디 중복 체크
	public int memberCheck(String id) {
	    int check=0;
	    try {
			conn=jdbcConnection.getConnection();
			// 1. 쿼리문 준비
			String sql="select count(id) from fl_member where id=?";
			// 2. prepareStatement
			stmt=conn.prepareStatement(sql);
			// 3. ? 매핑
			stmt.setString(1, id);
			// 4. 실행
			rs=stmt.executeQuery();
			// 5. 사용
			if(rs.next()) {
				check=rs.getInt(1);
			}
		} catch (ClassNotFoundException e) {
	         e.printStackTrace();
	    } catch (SQLException e) {
	         e.printStackTrace();
	    } finally {
			jdbcConnection.close(rs, stmt, conn);
		}
		return check;
	}
	
	// #5. 회원정보 조회
	public MemberVO getUserInfo(String id) {
		MemberVO member=null;
		try {
			conn=jdbcConnection.getConnection();
			String sql="select * from fl_member where id=?";
			stmt=conn.prepareStatement(sql);
			stmt.setString(1, id);
			rs=stmt.executeQuery();
			while(rs.next()) {
				member=new MemberVO();
				member.setId(rs.getString("id"));
				member.setName(rs.getString("name"));
				member.setEmail(rs.getString("email"));
				member.setTel(rs.getString("tel"));
				member.setHobby(rs.getString("hobby"));
				member.setJob(rs.getString("job"));
				member.setAge(rs.getString("age"));
				member.setInfo(rs.getString("info"));
			}
		} catch (ClassNotFoundException e) {
	         e.printStackTrace();
	    } catch (SQLException e) {
	         e.printStackTrace();
	    } finally {
			jdbcConnection.close(rs, stmt, conn);
		}
		return member;
	}
	
	// #6. 회원탈퇴
	public int deleteMember(String id) {
		int result=0;
		try {
			// 0. DB 연결
			conn=jdbcConnection.getConnection();
			// 1. 쿼리문 준비
			String sql="delete from fl_member where id=?";
			// 2. prepareStatement
			stmt=conn.prepareStatement(sql);
			// 3. ? 매핑
			stmt.setString(1, id);
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
	
	// #7. 비밀번호 확인
	public String checkPw(String id) {
		String pwChk="";
		try {
			// 0. DB 접속
			conn=jdbcConnection.getConnection();
			// 1. 쿼리문 준비
			String sql="select password from fl_member where id=?";
			// 2. prepareStatement
			stmt=conn.prepareStatement(sql);
			// 3. ? 매핑
			stmt.setString(1, id);
			// 4. 실행
			rs=stmt.executeQuery();
			// 5. 사용
			if(rs.next()) {
				pwChk=rs.getString("password");
			}
		} catch (ClassNotFoundException e) {
	         e.printStackTrace();
	    } catch (SQLException e) {
	         e.printStackTrace();
	    } finally {
			jdbcConnection.close(rs, stmt, conn);
		}
		// 6. 리턴값
		return pwChk;
	}
	
	// #8. 회원정보 수정
	public int updateMember(MemberVO vo) {
		int result=0;
		try {
			// 0. DB 연결
			conn=jdbcConnection.getConnection();
			// 1. 쿼리문 준비
			String sql="update fl_member set password=?, name=?, email=?, tel=?, hobby=?, job=?, age=?, info=? where id=?";
			// 2. prepareStatement
			stmt=conn.prepareStatement(sql);
			// 3. ? 매핑
			stmt.setString(1, vo.getPassword());
			stmt.setString(2, vo.getName());
			stmt.setString(3, vo.getEmail());
			stmt.setString(4, vo.getTel());
			stmt.setString(5, vo.getHobby());
			stmt.setString(6, vo.getJob());
			stmt.setString(7, vo.getAge());
			stmt.setString(8, vo.getInfo());
			stmt.setString(9, vo.getId());
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
	
}
