package model;
/* DAO 비즈니스 처리 클래스 */

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
	// 커넥션 풀 사용 오라클 DB 접속 메서드
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	// 오라클 DB 접속 메서드
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
	
	// #1. 새 글 등록 비즈니스 로직 처리 메서드
	public void insertBoard(BoardBean bean) {
		// 0. DB연결
		dbConn();
		// 자바빈에서 넘어오지 않는 데이터도 초기화하여 사용 -> DB에 입력해줘야 함
		int ref=0; // 글 그룹
		int re_step=1; // 새 글
		int re_level=1; // 댓글
		
		try {
			// #1-1. 계층형 게시판용 최신 ref 값 가져오기
			// 1. sql문 준비 => 계층형 게시판용 가장 큰 ref값 읽어오는 쿼리문 (최신글)
			String refSql="select max(ref) from bb_board";
			// 2. prepareStatement
			pstmt=conn.prepareStatement(refSql);
			// 3. ? 매핑
			// 4. 실행
			rs=pstmt.executeQuery();
			// 5. 사용
			if(rs.next()) {
				// 쿼리 실행결과에 무조건 1을 더해 ref변수에 할당
				ref=rs.getInt(1)+1;
			}
			// #1-2. 새 글 쓰기 = 입력받은 폼 DB에 저장 | 시퀀스 사용
			// 1. sql문 준비
			String sql="insert into bb_board values("
					+ "bb_board_seq.nextval,?,?,?,?,sysdate,?,?,?,0,?"
					+ ")";
			// 2. prepareStatement
			pstmt=conn.prepareStatement(sql);
			// 3. ? 매핑
			pstmt.setString(1, bean.getWriter());
			pstmt.setString(2, bean.getEmail());
			pstmt.setString(3, bean.getSubject());
			pstmt.setString(4, bean.getPassword());
			pstmt.setInt(5, ref);
			pstmt.setInt(6, re_step);
			pstmt.setInt(7, re_level);
			pstmt.setString(8, bean.getContent());
			// 4. 실행
			pstmt.executeUpdate();
			// 자원반납
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// #2. 글 목록 불러오기
	public ArrayList<BoardBean> getAllBoard() {
		// DB에서 받아올 데이터 타입 선언
		ArrayList<BoardBean> v=new ArrayList<BoardBean>();
		try {
			// 0. DB연결
			dbConn();
			// 1. sql문 준비 => 계층형 게시판 정렬 쿼리문
			String sql="select * from bb_board order by ref desc, re_level asc, re_step asc";
			// 2. prepareStatement
			pstmt=conn.prepareStatement(sql);
			// 3. ? 매핑
			// 4. 실행
			rs=pstmt.executeQuery();
			// 5. 사용
			while(rs.next()) {
				BoardBean bean=new BoardBean();
				bean.setNum(rs.getInt("num"));
				bean.setWriter(rs.getString("writer"));
				bean.setEmail(rs.getString("email"));
				bean.setSubject(rs.getString("subject"));
				bean.setPassword(rs.getString("password"));
				bean.setReg_date(rs.getString("reg_date"));
				bean.setRef(rs.getInt("ref"));
				bean.setRe_step(rs.getInt("re_step"));
				bean.setRe_level(rs.getInt("re_level"));
				bean.setReadcount(rs.getInt("readcount"));
				bean.setContent(rs.getString("content"));
				
				v.add(bean);
			}
			// 자원반납
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
	}
	
	// #3. 글 상세보기
	public BoardBean getOneBoard(int num) {
		// DB에서 받아올 데이터 타입 선언
		BoardBean bean=new BoardBean();
		try {
			// 0. DB연결
			dbConn();
			// #3-1. 조회수 증가
			// 1. sql문 준비
			String sql="update bb_board set readcount=readcount+1 where num=?";
			// 2. prepareStatement
			pstmt=conn.prepareStatement(sql);
			// 3. ? 매핑
			pstmt.setInt(1, num);
			// 4. 실행
			pstmt.executeUpdate();
			
			// #3-2. 하나의 글 불러오기
			// 1. sql문 준비
			sql="select * from bb_board where num=?";
			// 2. prepareStatement
			pstmt=conn.prepareStatement(sql);
			// 3. ? 매핑
			pstmt.setInt(1, num);
			// 4. 실행
			rs=pstmt.executeQuery();
			// 5. 사용
			// 값을 불러올 때 숫자(순서)도 사용 가능 (단, 순서에 맞추어서 사용)
			while(rs.next()) {
				bean.setNum(rs.getInt(1));
				bean.setWriter(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setSubject(rs.getString(4));
				bean.setPassword(rs.getString(5));
				bean.setReg_date(rs.getString(6));
				bean.setRef(rs.getInt(7));
				bean.setRe_step(rs.getInt(8));
				bean.setRe_level(rs.getInt(9));
				bean.setReadcount(rs.getInt(10));
				bean.setContent(rs.getString(11));
			}
			// 자원반납
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}
	
	// #4. DB 비밀번호 확인 메서드 | Update + Delete에서 사용
	public String getPass(int num) {
		// 비밀번호 값 변수 선언
		String pass="";
		// 0. DB연결
		dbConn();
		try {
			// 1. 쿼리문 준비
			String sql="select password from bb_board where num=?";
			// 2. prepareStatement
			pstmt=conn.prepareStatement(sql);
			// 3. ? 매핑
			pstmt.setInt(1, num);
			// 4. 실행
			rs=pstmt.executeQuery();
			// 5. 사용
			if(rs.next()) {
				pass=rs.getString(1);
			}
			// 자원반납
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pass;
	}
	
	// #5-1. 업데이트 할 게시글 불러오기
	public BoardBean getOneUpdateBoard(int num) {
		// DB에서 받아올 데이터 타입 선언
		BoardBean bean=new BoardBean();
		try {
			// 0. DB연결
			dbConn();
			// 1. sql문 준비
			String sql="select * from bb_board where num=?";
			// 2. prepareStatement
			pstmt=conn.prepareStatement(sql);
			// 3. ? 매핑
			pstmt.setInt(1, num);
			// 4. 실행
			rs=pstmt.executeQuery();
			// 5. 사용
			// 값을 불러올 때 숫자(순서)도 사용 가능 (단, 순서에 맞추어서 사용)
			while(rs.next()) {
				bean.setNum(rs.getInt(1));
				bean.setWriter(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setSubject(rs.getString(4));
				bean.setPassword(rs.getString(5));
				bean.setReg_date(rs.getString(6));
				bean.setRef(rs.getInt(7));
				bean.setRe_step(rs.getInt(8));
				bean.setRe_level(rs.getInt(9));
				bean.setReadcount(rs.getInt(10));
				bean.setContent(rs.getString(11));
			}
			// 자원반납
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}
	
	// #5-2. 글 수정하기
	public void updateBoard(BoardBean bean) {
		// 0. DB연결
		dbConn();
		try {
			// 1. 쿼리문 준비
			String sql="update bb_board set subject=?, content=?, reg_date=sysdate where num=?";
			// 2. prepareStatement
			pstmt=conn.prepareStatement(sql);
			// 3. ? 매핑
			pstmt.setString(1, bean.getSubject());
			pstmt.setString(2, bean.getContent());
			pstmt.setInt(3, bean.getNum());
			// 4. 실행
			pstmt.executeUpdate();
			// 자원반납
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// #6. 글 삭제하기
	public void deleteBoard(int num) {
		// 0. DB연결
		dbConn();
		try {
			// 1. 쿼리문 준비
			String sql="delete from bb_board where num=?";
			// 2. prepareStatement
			pstmt=conn.prepareStatement(sql);
			// 3. ? 매핑
			pstmt.setInt(1, num);
			// 4. 실행
			pstmt.executeUpdate();
			// 자원반납
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
/*
	계층형 게시판 = 답변형 게시판(댓글)
	=> (로직) a. 글그룹으로 묶음 b. Re_step, Re_level값 수정
	Ref = 원본글 = 부모글
	Re_step = 댓글 = 부모글 번호에 1을 더함
	Re_level = 댓글관련 글 = 부모글보다 큰 숫자에 전부 1을 더해줌
	단, 최신의 댓글에는 부모글의 Re_step, Re_level에 무조건 1을 더해줌
 */
	// #7. 답변글 저장 메서드
	public void reWriteBoard(BoardBean bean) {
		// 부모글의 Re_step, Re_level 변수 할당 => 답변형 게시판은 로직에 맞게 증가가 필요
		int ref=bean.getRef();
		int re_step=bean.getRe_step();
		int re_level=bean.getRe_level();
		
		// 0. DB연결
		dbConn();
		try {
			// #7-1. 이전에 작성된 답글 컬럼값 업데이트
			// 1. 쿼리문 준비 = 부모글보다 큰 re_level의 값에 모두 1을 더해줌
			//                = 답글이 추가되면 이전의 답글의 정렬 순서가 내려가도록 설정
			//                = where절로 현재 부모그룹 내에서 re_level이 큰 경우만 업데이트
			String sql="update bb_board set re_level=re_level+1 where ref=? and re_level>?";
			// 2. prepareStatement
			pstmt=conn.prepareStatement(sql);
			// 3. ? 매핑
			pstmt.setInt(1, ref);
			pstmt.setInt(2, re_level);
			// 4. 실행
			pstmt.executeUpdate();
			
			// #7-2. 답변형 게시판 게시글 저장
			// 1. 쿼리문 준비
			sql="insert into bb_board values("
				+ "bb_board_seq.nextval,?,?,'[RE] '||?,?,sysdate,?,?,?,0,?"
				+ ")";
			// 2. prepareStatement
			pstmt=conn.prepareStatement(sql);
			// 3. ? 매핑
			pstmt.setString(1, bean.getWriter());
			pstmt.setString(2, bean.getEmail());
			pstmt.setString(3, bean.getSubject());
			pstmt.setString(4, bean.getPassword());
			pstmt.setInt(5, ref);
			pstmt.setInt(6, re_step+1);
			pstmt.setInt(7, re_level+1);
			pstmt.setString(8, bean.getContent());
			// 4. 실행
			pstmt.executeUpdate();
			// 자원반납
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	
}
