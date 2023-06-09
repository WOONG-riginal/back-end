/*
	Connection 객체
	: 자바에서 DB접속을 위해 사용하는 객체
	  매개변수 = Data의 위치, 기타 정보(DB접속 id, 패스워드, 포트번호)
	  getConnection()메서드를 호출하여 생성
	  
	[코드예시]
	String url="Data의 위치";
	String user="hr";
	String pw="hr";
	Class.forName("각 DB의 드라이버 이름");
	Connection conn=DriverManager.getConnection(url,user,pw);
	
	Connection객체 메서드
	  a. createStatement()
	    : SQL문을 DB에 전달하기 위한 Statement 객체를 생성
	  b. prepareStatement(String url)
	    : 파라미터가 포함된 SQL문을 DB에 전달하기 위한 prepareStatement 객체를 생성
	  c. close()
	    : 현재 커넥션 객체에 할당된 시스템 리소스를 즉시 반환
	    
	Context = javax.naming
	 : 네임 서비스에 엑세스 하기 위한 클래스 및 인터페이스 제공
 */
package biz;
/* DB와 관련된 비즈니스 로직을 처리하기 위한 클래스 */

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import vo.MemberVO;

public class MemberDAO {
	// DB접속을 위한 객체 선언
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	// 커넥션 풀 이용 DB 연결 메서드
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
	
	// 1. Create = 회원가입
	public void insertMember(MemberVO mbean) {
		try {
			// 0. DB연결
			dbConn();
			// 1. 쿼리문 준비 = PreparedStatement 사용하기 위한 ?
			String sql="insert into b_member values(?,?,?,?)";
			// 2. PreparedStatement객체 사용 = 해당 객체에서 쿼리문과 관련된 것을 사용하기 위해 제공
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, mbean.getId());
			pstmt.setString(2, mbean.getPwd());
			pstmt.setString(3, mbean.getName());
			pstmt.setString(4, mbean.getEmail());
			// 3. 쿼리문 실행
			pstmt.executeUpdate(); // insert, update, delete 시 사용
			// 4. 자원반납
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 2. Read = 회원정보 조회
	// 2-1. 모든 회원정보 조회
	public Vector<MemberVO> allSelectMember() {
		Vector<MemberVO> v=new Vector<>();
		try {
			// 0. DB연결
			dbConn();
			// 1. 쿼리문 준비
			String sql="select * from b_member";
			// 2. PreparedStatement객체 사용
			pstmt=conn.prepareStatement(sql);
			// 3. 쿼리문 실행
			// 쿼리문을 실행시켜서 그 결과를 rs에 할당 => 오라클 테이블의 sql결과는 ResultSet객체 타입으로 저장
			rs=pstmt.executeQuery(); // select문에서만 사용하는 실행 메서드
			while(rs.next()) { // next() : boolean-ResultSet => rs에 데이터가 저장된 만큼 반복
				// 데이터형 지정 = 설정한 제네릭 타입
				MemberVO bean=new MemberVO();
				// 컬럼으로 나누어진 데이터를 해당 제네릭 타입의 빈클래스에 저장
				bean.setId(rs.getString(1));
				bean.setPwd(rs.getString(2));
				bean.setName(rs.getString(3));
				bean.setEmail(rs.getString(4));
				// MemberVO 자바빈을 패키징하여 객체배열(=Vector)에 저장 
				v.add(bean); // 0번지부터 순서대로 데이터 저장 => add()메서드
			}
			// 4. 자원반납
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 호출 시 넘겨줄 데이터
		return v;
	}	
	// 2-2. 회원 개별정보 조회
	public MemberVO oneselectMember(String id) {
		// 데이터 담을 자바빈 생성
		MemberVO bean=new MemberVO();
		try {
			// 0. DB연결
			dbConn();
			// 1. 쿼리문 준비
			String sql="select * from b_member where id=?";
			// 2. PreparedStatement객체 사용 => 매개변수로 넘긴 아이디 값을 사용
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			// 3. 쿼리문 실행
			rs=pstmt.executeQuery();
			while(rs.next()) {
				bean.setId(rs.getString(1));
				bean.setPwd(rs.getString(2));
				bean.setName(rs.getString(3));
				bean.setEmail(rs.getString(4));
			}
			// 4. 자원반납
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 호출하는 곳에 데이터 리턴
		return bean;
	}
	
	// 3. Update = 회원정보 업데이트 => 비밀번호 체크 후 동일하면 변경
	// 3-1. 특정 회원의 비밀번호값을 리턴하는 메서드
	public String getPass(String id) { // 비밀번호만 리턴하면 되니까 리턴값은 String
		// 초기화 선언 = 데이터를 호출해서 사용하기 위해
		String pwd="";
		try {
			// 0. DB연결
			dbConn();
			// 1. 쿼리문 준비
			String sql="select pwd from b_member where id=?";
			// 2. PreparedStatement객체 사용 => ?에 값을 매핑
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			// 3. 쿼리문 실행
			rs=pstmt.executeQuery();
			if(rs.next()) {
				pwd=rs.getString(1); // 한 회원의 비밀번호만 가져오기
			}
			// 4. 자원반납
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 결과 리턴
		return pwd;
	}
	// 3-2. 특정 회원의 정보를 수정하는 메서드
	public void updateMember(MemberVO mbean) {
		// 0. DB연결
		dbConn();
		try {
			// 1. 쿼리문 준비
			String sql="update b_member set name=?,email=? where id=?";
			// 2. PreparedStatement객체 사용 => ?에 값을 매핑
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, mbean.getName());
			pstmt.setString(2, mbean.getEmail());
			pstmt.setString(3, mbean.getId());
			// 3. 쿼리문 실행
			pstmt.executeUpdate();
			// 4. 자원반납
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 4. Delete = 특정 회원의 정보를 삭제하는 메서드
	public void deleteMember(String id) {
		try {
			// 0. DB연결
			dbConn();
			// 1. 쿼리문 준비
			String sql="delete from b_member where id=?";
			// 2. PreparedStatement객체 사용 => ?에 값을 매핑
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			// 3. 쿼리문 실행
			pstmt.executeUpdate();
			// 4. 자원반납
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	
	
}