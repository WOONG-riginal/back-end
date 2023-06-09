package biz.board;
/* CRUD 비지니스 로직 클래스 */

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import biz.common.JDBCConnection;

public class BoardDAO {
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	// #1. 새글 쓰기 메서드
	public int addBoard(BoardVO vo) {
		int cnt = 0;
		try {
			// db
			conn = JDBCConnection.getConnection();
			// sql
			String sql = "insert into b_board(seq,title,nickname,content) "
					+ "values((select nvl(max(seq),0)+1 from b_board),?,?,?)";
			// ?
			stmt = conn.prepareStatement(sql);
			// ? 매핑
			stmt.setString(1, vo.getTitle());
			stmt.setString(2, vo.getNickname());
			stmt.setString(3, vo.getContent());
			// 실행
			cnt = stmt.executeUpdate();
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCConnection.close(stmt, conn);
		}
		
		// 리턴
		return cnt;
		
	} // end of class
	
	// #2. 게시판 목록 메서드
	public ArrayList<BoardVO> getBoardList() {
		ArrayList<BoardVO> boardList = null;
		try {
			// db 연결
			conn = JDBCConnection.getConnection();
			// sql
			String sql = "select * from b_board order by seq desc";
			// ?
			stmt = conn.prepareStatement(sql);
			// ? 매핑
			// 실행
			rs = stmt.executeQuery();
			// 사용
			boardList = new ArrayList<BoardVO>();
			while(rs.next()) {
				int seq = rs.getInt("seq");
				String nickname = rs.getString("nickname");
				String title = rs.getString("title");
				String content = rs.getString("content");
				Date regdate = rs.getDate("regdate");
				int cnt = rs.getInt("cnt");
				
				// 담기
				BoardVO board = new BoardVO();
				board.setSeq(seq);
				board.setTitle(title);
				board.setNickname(nickname);
				board.setContent(content);
				board.setRegdate(regdate);
				board.setCnt(cnt);
				
				// 패키징
				boardList.add(board);
				
				
			} // end of while
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCConnection.close(rs, stmt, conn);
		}
		
		// 호출하는 곳으로 값 전달
		return boardList;	
	} 
	
	// #3. 글 상세보기 메서드
	public BoardVO getBoard(BoardVO vo) {
		BoardVO board = null;
		try {
			// db
			conn = JDBCConnection.getConnection();
			// sql = 조횟수 증가
			String sql = "update b_board set cnt = (select cnt + 1 from b_board where seq = ?) where seq =?";
			// ?
			stmt = conn.prepareStatement(sql);
			// ? 매핑
			stmt.setInt(1, vo.getSeq());
			stmt.setInt(2, vo.getSeq());
			// 실행
			stmt.executeUpdate();
			// 반납
			stmt.close();
			
			// sql = 글 상세보기
			sql = "select * from b_board where seq = ?";
			// ?
			stmt = conn.prepareStatement(sql);
			// ? 매핑
			stmt.setInt(1, vo.getSeq());
			// 실행
			rs = stmt.executeQuery();
			// 사용
			if(rs.next()) {
				board = new BoardVO();
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
			JDBCConnection.close(rs, stmt, conn);
		}
		
		// 리턴
		return board;
	}
	
	// #4. 글 수정
	public int updateBoard(BoardVO vo) {
		int cnt = 0;
		try {
			// db
			conn = JDBCConnection.getConnection();
			// sql
			String sql = "update b_board set title = ? , content = ? where seq = ?";
			// ?
			stmt = conn.prepareStatement(sql);
			// ? 매핑
			stmt.setString(1, vo.getTitle());
			stmt.setString(2, vo.getContent());
			stmt.setInt(3, vo.getSeq());
			// 실행
			cnt = stmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCConnection.close(stmt, conn);
		}
		
		// 호출시 반환
		return cnt;
	}
	
	// #5. 글 삭제
	public int deleteBoard(BoardVO vo) {
		int cnt = 0;
		try {
			// db
			conn = JDBCConnection.getConnection();
			// sql
			String sql = "delete from b_board where seq = ?";
			// ?
			stmt = conn.prepareStatement(sql);
			// ? 매핑
			stmt.setInt(1, vo.getSeq());
			// 실행
			cnt = stmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCConnection.close(stmt, conn);
		}
		
		return cnt;
	}
	

	// # 6. 글 수정 2
	public BoardVO checkBoard(BoardVO vo) {
		BoardVO board = null;
		try {
			//db접속
			conn = JDBCConnection.getConnection();
			
			//sql = 글 상세보기
			String sql = "select * from b_board where seq = ?";
			//?
			stmt = conn.prepareStatement(sql);
			
			stmt.setInt(1, vo.getSeq());
			
			rs = stmt.executeQuery();
			
			if(rs.next()) {
				board = new BoardVO();
		
				board.setSeq(rs.getInt("seq"));
				board.setTitle(rs.getString("title"));
				board.setNickname(rs.getString("nickname"));
				board.setContent(rs.getString("content"));
				board.setRegdate(rs.getDate("regdate"));
				board.setCnt(rs.getInt("cnt"));
			
			}
			
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCConnection.close(rs, stmt, conn);
		}

		return board;
	}//end of class
	
	
	
	
}
