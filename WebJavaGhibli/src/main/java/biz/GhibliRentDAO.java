package biz;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class GhibliRentDAO {
	// 커넥션 풀 사용
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	// DB 접속 메서드
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
	
	// #1. 로그인 처리 메서드
	public int getMember(String id, String pw) {
		int result=0;
		try {
			dbConn();
			// 1. 쿼리문 준비
			String sql="select count(*) from member_md2 where id=? and pass1=?";
			// 2. prepareStatement
			pstmt=conn.prepareStatement(sql);
			// 3. ? 매핑
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			// 4. 실행
			rs=pstmt.executeQuery();
			// 5. 사용
			if(rs.next()) {
				result=rs.getInt(1);
			}
			// 6. 자원반납
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	// #2. 모든 영화 정보 가져오기
	public ArrayList<GhibliListVO> getAllMovie() {
		ArrayList<GhibliListVO> movieList=new ArrayList<GhibliListVO>();
		try {
			dbConn();
			// 1. 쿼리문 준비
			String sql="select * from g_movierent";
			// 2. prepareStatement
			pstmt=conn.prepareStatement(sql);
			// 3. ? 매핑 X
			// 4. 실행
			rs=pstmt.executeQuery();
			// 5. 사용
			while(rs.next()) {
				GhibliListVO vo=new GhibliListVO();
				vo.setNo(rs.getInt("no"));
				vo.setName(rs.getString("name"));
				vo.setCategory(rs.getInt("category"));
				vo.setPrice(rs.getInt("price"));
				vo.setUsepeople(rs.getInt("usepeople"));
				vo.setCompany(rs.getString("company"));
				vo.setImg(rs.getString("img"));
				vo.setInfo(rs.getString("info"));
				
				movieList.add(vo);
			}
			// 6. 자원반납
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return movieList;
	}
	
	// #3. 선택된 영화 정보 가져오기
	public GhibliListVO getOneMovie(int no) {
		GhibliListVO movie=null;
		try {
			dbConn();
			// 1. 쿼리문 준비
			String sql="select * from g_movierent where no=?";
			// 2. prepareStatement
			pstmt=conn.prepareStatement(sql);
			// 3. ? 매핑
			pstmt.setInt(1, no);
			// 4. 실행
			rs=pstmt.executeQuery();
			// 5. 사용
			if(rs.next()) {
				movie=new GhibliListVO();
				movie.setNo(rs.getInt("no"));
				movie.setName(rs.getString("name"));
				movie.setCategory(rs.getInt("category"));
				movie.setPrice(rs.getInt("price"));
				movie.setUsepeople(rs.getInt("usepeople"));
				movie.setCompany(rs.getString("company"));
				movie.setImg(rs.getString("img"));
				movie.setInfo(rs.getString("info"));
			}
			// 6. 자원반납
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return movie;
	}
	
	// #4. 사용자 선택 예약정보 저장
	public void setReserveMovie(GhibliReserveVO reserve) {
		try {
			dbConn();
			// 1. 쿼리문 준비
			String sql="insert into g_moviereserve values(g_moviereserve_seq.nextval,?,?,?,?,?,?,?,?,?)";
			// 2. prepareStatement
			pstmt=conn.prepareStatement(sql);
			// 3. ? 매핑
			pstmt.setInt(1, reserve.getNo());
			pstmt.setString(2, reserve.getId());
			pstmt.setInt(3, reserve.getQty());
			pstmt.setInt(4, reserve.getDday());
			pstmt.setString(5, reserve.getRday());
			pstmt.setInt(6, reserve.getUsein());
			pstmt.setInt(7, reserve.getUsewifi());
			pstmt.setInt(8, reserve.getUsenavi());
			pstmt.setInt(9, reserve.getUseseat());
			// 4. 실행
			pstmt.executeUpdate();
			// 5. 자원반납
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// #5. 예약정보 가져오기
	public ArrayList<GhibliViewVO> getAllReserve(String id) {
		ArrayList<GhibliViewVO> view=new ArrayList<GhibliViewVO>();
		GhibliViewVO vo=null;
		try {
			dbConn();
			// 1. 쿼리문 준비
			// 두 테이블 조인 => natural join 사용
			// 조건절 현재 시스템의 날짜보다 크면 dRay(문자열) -> 날짜형으로 바꿈
			String sql="select * from g_movierent natural join g_moviereserve "
					+ "where sysdate<to_date(rday, 'YYYY-MM-DD') and id=?";
			// 2. prepareStatement
			pstmt=conn.prepareStatement(sql);
			// 3. ? 매핑
			pstmt.setString(1, id);
			// 4. 실행
			rs=pstmt.executeQuery();
			// 5. 사용
			while(rs.next()) {
				vo=new GhibliViewVO();
				vo.setName(rs.getString("name"));
				vo.setPrice(rs.getInt("price"));
				vo.setImg(rs.getString("img"));
				vo.setQty(rs.getInt("qty"));
				vo.setDday(rs.getInt("dday"));
				vo.setRday(rs.getString("rday"));
				vo.setUsein(rs.getInt("usein"));
				vo.setUsewifi(rs.getInt("usewifi"));
				vo.setUsenavi(rs.getInt("usenavi"));
				vo.setUseseat(rs.getInt("useseat"));
				
				view.add(vo);
			}
			// 6. 자원반납
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return view;
	}
	
	// #6. 예약 삭제하기
	public void removeReserve(String id, String rday) {
		try {
			// 0. DB 연결
			dbConn();
			// 1. 쿼리문 준비
			String sql="delete from g_moviereserve where id=? and rday=?";
			// 2. prepareStatement
			pstmt=conn.prepareStatement(sql);
			// 3. ? 매핑
			pstmt.setString(1, id);
			pstmt.setString(2, rday);
			// 4. 실행
			pstmt.executeUpdate();
			// 5. 자원반납
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// #7. 최신순으로 3개의 영화정보를 리턴
	public ArrayList<GhibliListVO> getSelectMovie() {
		ArrayList<GhibliListVO> movies=new ArrayList<GhibliListVO>();
		try {
			// 0. DB 연결
			dbConn();
			// 1. 쿼리문 준비
			String sql="select * from g_movierent "
					+ "where no between (select max(no)-2 from g_movierent) "
					+ "and (select max(no) from g_movierent) "
					+ "order by no desc";
			// 2. prepareStatement
			pstmt=conn.prepareStatement(sql);
			// 3. ? 매핑 X
			// 4. 실행
			rs=pstmt.executeQuery();
			// 5. 사용
			while(rs.next()) {
				GhibliListVO movie=new GhibliListVO();
				movie.setNo(rs.getInt("no"));
				movie.setName(rs.getString("name"));
				movie.setCategory(rs.getInt("category"));
				movie.setPrice(rs.getInt("price"));
				movie.setUsepeople(rs.getInt("usepeople"));
				movie.setCompany(rs.getString("company"));
				movie.setImg(rs.getString("img"));
				movie.setInfo(rs.getString("info"));

				movies.add(movie);
			}
			// 6. 자원반납
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return movies;
	}
	
	// #8-1. 카테고리 별 검색하기 
	public ArrayList<GhibliListVO> getCategoryMovie(int category) {
		ArrayList<GhibliListVO> movies=new ArrayList<GhibliListVO>();
		try {
			// 0. DB 연결
			dbConn();
			// 1. 쿼리문 준비
			String sql="select * from g_movierent where category=?";
			// 2. prepareStatement
			pstmt=conn.prepareStatement(sql);
			// 3. ? 매핑
			pstmt.setInt(1, category);
			// 4. 실행
			rs=pstmt.executeQuery();
			// 5. 사용
			while(rs.next()) {
				GhibliListVO movie=new GhibliListVO();
				movie.setNo(rs.getInt("no"));
				movie.setName(rs.getString("name"));
				movie.setCategory(rs.getInt("category"));
				movie.setPrice(rs.getInt("price"));
				movie.setUsepeople(rs.getInt("usepeople"));
				movie.setCompany(rs.getString("company"));
				movie.setImg(rs.getString("img"));
				movie.setInfo(rs.getString("info"));

				movies.add(movie);
			}
			// 6. 자원반납
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return movies;
	}
	
	// #8-2. 모든 영화 검색하기
	public ArrayList<GhibliListVO> getAllMovieSearch() {
		ArrayList<GhibliListVO> movieList=new ArrayList<GhibliListVO>();
		try {
			dbConn();
			// 1. 쿼리문 준비
			String sql="select * from g_movierent order by no desc";
			// 2. prepareStatement
			pstmt=conn.prepareStatement(sql);
			// 3. ? 매핑 X
			// 4. 실행
			rs=pstmt.executeQuery();
			// 5. 사용
			while(rs.next()) {
				GhibliListVO vo=new GhibliListVO();
				vo.setNo(rs.getInt("no"));
				vo.setName(rs.getString("name"));
				vo.setCategory(rs.getInt("category"));
				vo.setPrice(rs.getInt("price"));
				vo.setUsepeople(rs.getInt("usepeople"));
				vo.setCompany(rs.getString("company"));
				vo.setImg(rs.getString("img"));
				vo.setInfo(rs.getString("info"));
				
				movieList.add(vo);
			}
			// 6. 자원반납
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return movieList;
	}
	
	// #8-3. 키워드로 영화 검색하기
	public ArrayList<GhibliListVO> getSearchMovie(String condition, String word) {
		ArrayList<GhibliListVO> movies=new ArrayList<GhibliListVO>();
		try {
			dbConn();
			// 1. 쿼리문 준비
			String sql="select * from g_movierent where "+condition.trim();
			if(word!=null && !word.equals("")) {
				sql+=" like '%'||?||'%' order by no desc";
			}
			// 2. prepareStatement
			pstmt=conn.prepareStatement(sql);
			// 3. ? 매핑
			pstmt.setString(1, word);
			// 4. 실행
			rs=pstmt.executeQuery();
			// 5. 사용
			while(rs.next()) {
				GhibliListVO vo=new GhibliListVO();
				vo.setNo(rs.getInt("no"));
				vo.setName(rs.getString("name"));
				vo.setCategory(rs.getInt("category"));
				vo.setPrice(rs.getInt("price"));
				vo.setUsepeople(rs.getInt("usepeople"));
				vo.setCompany(rs.getString("company"));
				vo.setImg(rs.getString("img"));
				vo.setInfo(rs.getString("info"));
				
				movies.add(vo);
			}
			// 6. 자원반납
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return movies;
	}
}
