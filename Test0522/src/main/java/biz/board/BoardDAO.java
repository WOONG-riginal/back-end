package biz.board;
/* 게시판 비즈니스 로직 처리 DAO */

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;

import biz.common.jdbcConnection;

public class BoardDAO {
	// DB 연결 준비
	Connection conn=null;
	PreparedStatement stmt=null;
	ResultSet rs=null;
	
	// #1. 글쓰기 메서드
	public int addBoard(BoardVO vo) {
		int result=0;
		try {
			// 0. DB 연결
			conn=jdbcConnection.getConnection();
			// 1. 쿼리문 준비
			String sql="insert into test_board(seq,title,nickname,content) values("
					+ "(select nvl(max(seq),0)+1 from test_board),?,?,?"
					+ ")";
			// 2. prepareStatement
			stmt=conn.prepareStatement(sql);
			// 3. ? 매핑
			stmt.setString(1, vo.getTitle());
			stmt.setString(2, vo.getNickname());
			stmt.setString(3, vo.getContent());
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
	
	// #2-1. 글목록 메서드
	public ArrayList<BoardVO> getBoardList() {
		ArrayList<BoardVO> boardList=null;
		try {
			// 0. DB 연결
			conn=jdbcConnection.getConnection();
			// 1. 쿼리문 준비
			String sql="select * from test_board order by seq desc";
			// 2. prepareStatement
			stmt=conn.prepareStatement(sql);
			// 3. ? 매핑 X
			// 4. 실행
			rs=stmt.executeQuery();
			// 5. 사용
			boardList=new ArrayList<BoardVO>();
			while(rs.next()) {
				int seq=rs.getInt("seq");
				String title=rs.getString("title");
				String nickname=rs.getString("nickname");
				String content=rs.getString("content");
				Date regdate=rs.getDate("regdate");
				int cnt=rs.getInt("cnt");
				
				BoardVO board=new BoardVO();
				board.setSeq(seq);
				board.setTitle(title);
				board.setNickname(nickname);
				board.setContent(content);
				board.setRegdate(regdate);
				board.setCnt(cnt);
				
				boardList.add(board);
			}
		} catch (ClassNotFoundException e) {
	         e.printStackTrace();
	    } catch (SQLException e) {
	         e.printStackTrace();
	    } finally {
			jdbcConnection.close(rs, stmt, conn);
		}
		return boardList;
	}
	// #2-2. 인기글 메서드
	public ArrayList<BoardVO> getPopBoardList() {
		ArrayList<BoardVO> popBoardList=null;
		try {
			// 0. DB 연결
			conn=jdbcConnection.getConnection();
			// 1. 쿼리문 준비
			String sql = "select * from test_board where cnt=(select max(cnt) from test_board) order by seq desc";
			// 2. prepareStatement
			stmt = conn.prepareStatement(sql);
			// 3. ? 매핑
			// 4. 실행
			rs = stmt.executeQuery();
			// 5. 반복문 레코드 가져오기
			popBoardList = new ArrayList<BoardVO>();
			while(rs.next()) {
				// DB에 있는 컬럼값
				int seq = rs.getInt("seq");
				String title = rs.getString("title");
				String nickname = rs.getString("nickname");
				String content = rs.getString("content");
				Date regdate = rs.getDate("regdate");
				int cnt = rs.getInt("cnt");
				
				// 자바빈에 DB에서 얻어온 컬럼값 세팅
				BoardVO popBoard = new BoardVO();
				popBoard.setSeq(seq);
				popBoard.setTitle(title);
				popBoard.setNickname(nickname);
				popBoard.setContent(content);
				popBoard.setRegdate(regdate);
				popBoard.setCnt(cnt);
				
				popBoardList.add(popBoard);
			}
		} catch (ClassNotFoundException e) {
	         e.printStackTrace();
	    } catch (SQLException e) {
	         e.printStackTrace();
	    } finally {
			jdbcConnection.close(rs, stmt, conn);
		}
		return popBoardList;
	}
	
	// #3. 글 상세보기 메서드
	public BoardVO getBoard(BoardVO vo) {
		BoardVO board=null;
		try {
			// 0. DB 연결
			conn=jdbcConnection.getConnection();
			// #3-1. 조회수 증가 메서드
			// 1. 쿼리문 준비
			String sql="update test_board set cnt=cnt+1 where seq=?";
			// 2. prepareStatement
			stmt=conn.prepareStatement(sql);
			// 3. ? 매핑 X
			stmt.setInt(1, vo.getSeq());
			// 4. 실행
			stmt.executeUpdate();
			
			// #3-2. 하나의 게시글 가져오기
			// 1. 쿼리문 준비
			sql="select * from test_board where seq=?";
			// 2. prepareStatement
			stmt=conn.prepareStatement(sql);
			// 3. ? 매핑 X
			stmt.setInt(1, vo.getSeq());
			// 4. 실행
			rs=stmt.executeQuery();
			// 5. 사용
			if(rs.next()) {
				board=new BoardVO();
				board.setSeq(rs.getInt("seq"));
				board.setTitle(rs.getString("title"));
				board.setNickname(rs.getString("nickname"));
				board.setContent(rs.getString("content"));
				board.setRegdate(rs.getDate("regdate"));
				board.setCnt(rs.getInt("cnt"));
			}
		} catch (ClassNotFoundException e) {
	         e.printStackTrace();
	    } catch (SQLException e) {
	         e.printStackTrace();
	    } finally {
			jdbcConnection.close(rs, stmt, conn);
		}
		return board;
	}
	// #3-3. 수정할 글 전달 메서드
	public BoardVO checkBoard(BoardVO vo) {
		BoardVO board=null;
		try {
			// 0. DB 연결
			conn=jdbcConnection.getConnection();
			// #3-2. 하나의 게시글 가져오기
			// 1. 쿼리문 준비
			String sql="select * from test_board where seq=?";
			// 2. prepareStatement
			stmt=conn.prepareStatement(sql);
			// 3. ? 매핑 X
			stmt.setInt(1, vo.getSeq());
			// 4. 실행
			rs=stmt.executeQuery();
			// 5. 사용
			if(rs.next()) {
				board=new BoardVO();
				board.setSeq(rs.getInt("seq"));
				board.setTitle(rs.getString("title"));
				board.setNickname(rs.getString("nickname"));
				board.setContent(rs.getString("content"));
				board.setRegdate(rs.getDate("regdate"));
				board.setCnt(rs.getInt("cnt"));
			}
		} catch (ClassNotFoundException e) {
	         e.printStackTrace();
	    } catch (SQLException e) {
	         e.printStackTrace();
	    } finally {
			jdbcConnection.close(rs, stmt, conn);
		}
		return board;
	}
			
	// #4. 글 수정 메서드
	public int updateBoard(BoardVO vo) {
		int result=0;
		try {
			// 0. DB 연결
			conn=jdbcConnection.getConnection();
			// 1. 쿼리문 준비
			String sql="update test_board set title=?, content=? where seq=?";
			// 2. prepareStatement
			stmt=conn.prepareStatement(sql);
			// 3. ? 매핑
			stmt.setString(1, vo.getTitle());
			stmt.setString(2, vo.getContent());
			stmt.setInt(3, vo.getSeq());
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
	
	// #5. 글 삭제 메서드
	public int deleteBoard(BoardVO vo) {
		int result=0;
		try {
			// 0. DB 연결
			conn=jdbcConnection.getConnection();
			// 1. 쿼리문 준비
			String sql="delete from test_board where seq=?";
			// 2. prepareStatement
			stmt=conn.prepareStatement(sql);
			// 3. ? 매핑
			stmt.setInt(1, vo.getSeq());
			// 4. 실행
			result = stmt.executeUpdate();
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
