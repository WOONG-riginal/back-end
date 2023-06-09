package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import model.MemberVO;


public class MemberDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	// 커넥션 풀 사용 오라클 DB 접속 메서드
	public void dbConn() {
		try {
			// 1. 외부에서 data를 읽어들이기 위한 Context 생성
			Context initctx=new InitialContext(); // server.xml <Context>에 설정과 관련
			System.out.println("1. Context 생성 성공");
			// 2. 톰캣 서버에 정보를 담아놓은 곳으로 이동
			Context envctx=(Context)initctx.lookup("java:comp/env"); // lookup() => 사용환경 찾기
			System.out.println("2. Context 환경생성 성공");
			// 3. DataSource 객체 선언 => 톰캣 server.xml에 코딩한 문자열 값
			DataSource ds=(DataSource)envctx.lookup("jdbc/pool"); // lookup() => resource 찾기
			System.out.println("3. DataSource 찾기 성공");
			// 4. DataSource를 기준으로 DB에 Connection 연결
			conn=ds.getConnection();
			System.out.println("4. DB접속 성공");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// #1. 회원가입 메서드
	public void insertMember(MemberVO bean) {
		int result=0;
		try {
			// 0. DB 연결
			dbConn();
			// 1. 쿼리문 준비
			String sql="insert into member_md2 values(?,?,?,?,?,?,?,?)";
			// 2. prepareStatement
			pstmt=conn.prepareStatement(sql);
			// 3. ? 매핑
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getPass1());
			pstmt.setString(3, bean.getEmail());
			pstmt.setString(4, bean.getTel());
			pstmt.setString(5, bean.getHobby());
			pstmt.setString(6, bean.getJob());
			pstmt.setString(7, bean.getAge());
			pstmt.setString(8, bean.getInfo());
			// 4. 실행
			result=pstmt.executeUpdate();
			// 5. 자원반납
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// #2. 모든 회원정보 조회 메서드
	public ArrayList<MemberVO> getAllMember() {
		ArrayList<MemberVO> memberList=null;
		try {
			// 0. DB 연결
			dbConn();
			// 1. 쿼리문 준비
			String sql="select * from member_md2";
			// 2. prepareStatement
			pstmt=conn.prepareStatement(sql);
			// 3. ? 매핑 X
			// 4. 실행
			rs=pstmt.executeQuery();
			// 5. 사용
			memberList=new ArrayList<MemberVO>();
			while(rs.next()) {
				MemberVO member=new MemberVO();
				member.setId(rs.getString("id"));
				member.setEmail(rs.getString("email"));
				member.setTel(rs.getString("tel"));
				member.setHobby(rs.getString("hobby"));
				member.setJob(rs.getString("job"));
				member.setAge(rs.getString("age"));
				
				memberList.add(member);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return memberList;
	}
	
}
