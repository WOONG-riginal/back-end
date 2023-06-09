package biz.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import biz.common.JDBCConnection;

public class bbqMemberDAO {
	// DB 연결 준비
    Connection conn=null;
    PreparedStatement stmt=null;
    ResultSet rs=null;
	
	// 로그인 메서드
    public int getMember(String id, String pw) {
       int result=0;
       try {
          conn =JDBCConnection.getConnection();
          String sql = "select count(*) from bbq_member where id=? and password=?";
          stmt=conn.prepareStatement(sql);
          stmt.setString(1, id);
          stmt.setString(2, pw);
          rs = stmt.executeQuery();
          if(rs.next()) {
        	  result=rs.getInt(1);
          }
       } catch (Exception e) {
          e.printStackTrace();
       }finally {
          JDBCConnection.close(rs, stmt, conn);
       }
       return result;
    }

	// 회원가입 메서드
	public void joinMember(bbqMemberVO member) {
		try {
			conn =JDBCConnection.getConnection();
            String sql="insert into bbq_member(id,password,name,tel,email,mstore,birth,gender,address) values(?,?,?,?,?,?,?,?,?)";
            stmt=conn.prepareStatement(sql);
            stmt.setString(1, member.getId());
            stmt.setString(2, member.getPassword());
            stmt.setString(3, member.getName());
            stmt.setString(4, member.getTel());
            stmt.setString(5, member.getEmail());
            stmt.setString(6, member.getMstore());
            stmt.setString(7, member.getBirth());
            stmt.setString(8, member.getGender());
            stmt.setString(9, member.getAddress());
            stmt.executeUpdate();
		} catch (Exception e) {
           e.printStackTrace();
        }finally {
           JDBCConnection.close(stmt, conn);
        }
	}
	
	// ID 중복 확인 메서드
    public int checkIdOverlap(String id) {
       int result=0;
       try {
          conn =JDBCConnection.getConnection();
          String sql = "select count(*) from bbq_member where id=?";
          stmt=conn.prepareStatement(sql);
          stmt.setString(1, id);
          rs = stmt.executeQuery();
          if(rs.next()) {
        	  result=rs.getInt(1);
          }
       } catch (Exception e) {
          e.printStackTrace();
       }finally {
          JDBCConnection.close(rs, stmt, conn);
       }
       return result;
    }
    
    // 비밀번호 확인 메서드
    public String checkPass(String id) {
		String pwchk="";
		try {
			conn= JDBCConnection.getConnection();
			String sql = "select password from bbq_member where id=?";
			stmt=conn.prepareStatement(sql);
			stmt.setString(1, id);
			rs = stmt.executeQuery();
			if(rs.next()) {
				pwchk=rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCConnection.close(rs, stmt, conn);
		}
		return pwchk;
	}
	
	// 마이페이지 메서드
	public bbqMemberVO getMyPage(String id) {
		bbqMemberVO member = new bbqMemberVO();
		try {
			conn= JDBCConnection.getConnection();
			String sql = "select * from bbq_member where id=?";
			stmt=conn.prepareStatement(sql);
			stmt.setString(1, id);
			rs = stmt.executeQuery();
			if(rs.next()) {
				member.setId(rs.getString(1));
				member.setPassword(rs.getString(2));
				member.setName(rs.getString(3));
				member.setTel(rs.getString(4));
				member.setEmail(rs.getString(5));
				member.setPoint(rs.getInt(6));
				member.setCoupon(rs.getInt(7));
				member.setCard(rs.getInt(8));
				member.setRole(rs.getString(9));
				member.setAddress(rs.getString(10));
				member.setMstore(rs.getString(11));
				member.setGender(rs.getString(12));
				member.setBirth(rs.getString(13));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCConnection.close(rs, stmt, conn);
		}
		return member;
	}
	
	// 회원정보 수정 메서드
	public int editMember(bbqMemberVO vo) {
		int c = 0;
		try {
			conn = JDBCConnection.getConnection();
			String sql = "update bbq_member set birth=?, tel=?, email=?, address=? where id=?";
			stmt=conn.prepareStatement(sql);
			stmt.setString(1, vo.getBirth());
			stmt.setString(2, vo.getTel());
			stmt.setString(3, vo.getEmail());
			stmt.setString(4, vo.getAddress());
			stmt.setString(5, vo.getId());
			c = stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCConnection.close(stmt, conn);
		} return c;
	}
	
	// 주소지 삭제 메서드
	public int deleteAddress(String id) {
		int result=0;
		try {
			conn = JDBCConnection.getConnection();
			String sql = "update bbq_member set address=null where id=?";
			stmt=conn.prepareStatement(sql);
			stmt.setString(1, id);
			result=stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCConnection.close(stmt, conn);
		} return result;
	}
	
	// 비밀번호 변경 메서드
	public int editPassword(String id, String password) {
		int result=0;
		try {
			conn = JDBCConnection.getConnection();
			String sql = "update bbq_member set password=? where id=?";
			stmt=conn.prepareStatement(sql);
			stmt.setString(1, password);
			stmt.setString(2, id);
			result=stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCConnection.close(stmt, conn);
		} return result;
	}
	
	// 회원탈퇴 메서드
	public void deleteMember(String id) {
		try {
			conn = JDBCConnection.getConnection();
			String sql = "delete from bbq_member where id=?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, id);
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCConnection.close(stmt, conn);
		}
	}
	
	// 회원목록 조회 메서드
	public ArrayList<bbqMemberVO> getMemberList(){
		ArrayList<bbqMemberVO> memberList=new ArrayList<bbqMemberVO>();
		try {
			conn= JDBCConnection.getConnection();
			String sql = "select * from bbq_member";
			stmt=conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()) {
				bbqMemberVO member=new bbqMemberVO();
				member.setId(rs.getString(1));
				member.setPassword(rs.getString(2));
				member.setName(rs.getString(3));
				member.setTel(rs.getString(4));
				member.setEmail(rs.getString(5));
				member.setPoint(rs.getInt(6));
				member.setCoupon(rs.getInt(7));
				member.setCard(rs.getInt(8));
				member.setRole(rs.getString(9));
				member.setAddress(rs.getString(10));
				member.setMstore(rs.getString(11));
				member.setGender(rs.getString(12));
				member.setBirth(rs.getString(13));
				
				memberList.add(member);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCConnection.close(stmt, conn);
		}
		return memberList;
	}
	
	// 포인트 적립 메서드
	public void plusPoint(String id, int point) {
		try {
			conn = JDBCConnection.getConnection();
			String sql = "update bbq_member set point=(point+?) where id=?";
			stmt=conn.prepareStatement(sql);
			stmt.setInt(1, point);
			stmt.setString(2, id);
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCConnection.close(stmt, conn);
		}
	}

}
