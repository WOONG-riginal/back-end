package biz.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import biz.common.JDBCConnection;
import biz.member.bbqMemberVO;


public class bbqBoardDAO {
	// DB 연결 준비
	Connection conn=null;
	PreparedStatement stmt=null;
	ResultSet rs=null;
	
	  // #1. 새글 쓰기 메서드
	   public bbqBoardVO addBoard(bbqBoardVO vo, String id) {
		   bbqBoardVO bean = null;
	      int ref = 0; //글그룹
	      int re_step = 1; // 새글
	      int re_level = 1;// 댓글	      
	      try {
	         // db
	         conn = JDBCConnection.getConnection();
	         //#1.계층형게시판 ref값
	         // RefSql
	         String refSql = "select max(ref) from bbq_board";
	         stmt = conn.prepareStatement(refSql);	         
	         // ? 매핑
	         // 실행
	         rs = stmt.executeQuery();
	         // 5.사용
	         if(rs.next()) {
	        	 bean =  new bbqBoardVO();
	        	 ref = rs.getInt(1)+1;
	         }
	         
	         //#2. 새 글 쓰기 메서드
	         //sql
	         String sql = "insert into bbq_board values(bbq_board_seq.nextval,?,?,sysdate,?,?,?,?,?,?,?,0,?)";
	         //prepareStatement
	         stmt = conn.prepareStatement(sql);
	         //매핑
	         stmt.setString(1, vo.getStore());
	         stmt.setString(2, vo.getTitle());
	         stmt.setString(3, vo.getType());
	         stmt.setString(4, vo.getWriter());
	         stmt.setString(5, vo.getContact());
	         stmt.setString(6, vo.getContent());
	         stmt.setInt(7, ref);
	         stmt.setInt(8, re_step);
	         stmt.setInt(9, re_level);
	         stmt.setString(10, id);
	         
	         
	         
	         //실행
	         stmt.executeUpdate();

	         
	      } catch (ClassNotFoundException e) {
	         e.printStackTrace();
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         JDBCConnection.close(rs,stmt, conn);
	      }	   
	      
	      return bean;
	      
	   } // end of class
	
	
	// 마이페이지 문의내역
	public ArrayList<bbqBoardVO> getMemberBoardList(String id, String writer){
		ArrayList<bbqBoardVO> boardList = new ArrayList<bbqBoardVO>();
		try {
			conn = JDBCConnection.getConnection();
			String sql = "select * from bbq_member mem, bbq_board brd where mem.id=brd.writerid and mem.id=? and brd.writer=? order by num desc";
			stmt=conn.prepareStatement(sql);
			stmt.setString(1, id);
			stmt.setString(2, writer);
			rs = stmt.executeQuery();
			while(rs.next()) {
				bbqBoardVO bean = new bbqBoardVO();
				bean.setNum(rs.getInt("num"));
				bean.setStore(rs.getString("store"));
				bean.setTitle(rs.getString("title"));
				bean.setReg_date(rs.getString("reg_date"));
				bean.setType(rs.getString("type"));
				bean.setWriter(rs.getString("writer"));
				bean.setContact(rs.getString("contact"));
				bean.setContent(rs.getString("content"));
				bean.setRef(rs.getInt("ref"));
				bean.setRe_step(rs.getInt("re_step"));
				bean.setRe_level(rs.getInt("re_level"));
				bean.setReadcount(rs.getInt("readcount"));
				
				boardList.add(bean);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCConnection.close(rs, stmt, conn);
		}
		return boardList;
	}
	
	// 관리자페이지 모든 문의내역 조회 메서드
	public ArrayList<bbqBoardVO> getAllBoardList(){
		ArrayList<bbqBoardVO> boardList = new ArrayList<bbqBoardVO>();
		try {
			conn = JDBCConnection.getConnection();
			String sql = "select * from bbq_board order by ref desc, re_level asc, re_step asc";
			stmt=conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()) {
				bbqBoardVO bean = new bbqBoardVO();
				bean.setNum(rs.getInt(1));
				bean.setStore(rs.getString(2));
				bean.setTitle(rs.getString(3));
				bean.setReg_date(rs.getString(4));
				bean.setType(rs.getString(5));
				bean.setWriter(rs.getString(6));
				bean.setContact(rs.getString(7));
				bean.setContent(rs.getString(8));
				bean.setRef(rs.getInt(9));
				bean.setRe_step(rs.getInt(10));
				bean.setRe_level(rs.getInt(11));
				bean.setReadcount(rs.getInt(12));
				
				boardList.add(bean);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCConnection.close(rs, stmt, conn);
		}
		return boardList;
	}
	
	// 문의내역 답변 여부 확인 메서드
	public int checkAnswer(int ref){
		int check=0;
		try {
			conn = JDBCConnection.getConnection();
			String sql = "select count(*) from bbq_board where ref=?";
			stmt=conn.prepareStatement(sql);
			stmt.setInt(1, ref);
			rs = stmt.executeQuery();
			while(rs.next()) {
				check=rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCConnection.close(rs, stmt, conn);
		}
		return check;
	}
	
	// 관리자페이지 해당 문의내역 조회 메서드
	public bbqBoardVO getThisBoardList(int num){
		bbqBoardVO board = new bbqBoardVO();
		try {
			conn = JDBCConnection.getConnection();
			String sql = "select * from bbq_board where num=?";
			stmt=conn.prepareStatement(sql);
			stmt.setInt(1, num);
			rs = stmt.executeQuery();
			while(rs.next()) {
				board.setNum(rs.getInt(1));
				board.setStore(rs.getString(2));
				board.setTitle(rs.getString(3));
				board.setReg_date(rs.getString(4));
				board.setType(rs.getString(5));
				board.setWriter(rs.getString(6));
				board.setContact(rs.getString(7));
				board.setContent(rs.getString(8));
				board.setRef(rs.getInt(9));
				board.setRe_step(rs.getInt(10));
				board.setRe_level(rs.getInt(11));
				board.setReadcount(rs.getInt(12));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCConnection.close(rs, stmt, conn);
		}
		return board;
	}
	
	// 관리자페이지 답변글 등록 메서드
	public int writeAnswer(bbqBoardVO board){
		int result=0;
		int ref=board.getRef();
		int re_step=board.getRe_step();
		int re_level=board.getRe_level();
		try {
			conn = JDBCConnection.getConnection();
			String sql = "update bbq_board set re_level=re_level+1 where ref=? and re_level>?";
			stmt=conn.prepareStatement(sql);
			stmt.setInt(1, ref);
			stmt.setInt(2, re_level);
			stmt.executeUpdate();
			
			sql="insert into bbq_board values(bbq_board_seq.nextval,?,'[답변] '||?,sysdate,?,?,?,?,?,?,?,0,?)";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, " ");
	        stmt.setString(2, board.getTitle());
	        stmt.setString(3, " ");
	        stmt.setString(4, "관리자");
	        stmt.setString(5, "1588-9282");
	        stmt.setString(6, board.getContent());
	        stmt.setInt(7, ref);
	        stmt.setInt(8, re_step+1);
	        stmt.setInt(9, re_level+1);
	        stmt.setString(10, "관리자");
	        result=stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCConnection.close(rs, stmt, conn);
		}
		return result;
	}
	
	// 답변글 조회 메서드
	public bbqBoardVO getReWrite(int ref){
		bbqBoardVO board = new bbqBoardVO();
		try {
			conn = JDBCConnection.getConnection();
			String sql = "select * from bbq_board where ref=? and re_step>1";
			stmt=conn.prepareStatement(sql);
			stmt.setInt(1, ref);
			rs = stmt.executeQuery();
			while(rs.next()) {
				board.setContent(rs.getString("content"));
				board.setReg_date(rs.getString("reg_date"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCConnection.close(rs, stmt, conn);
		}
		return board;
	}

	// 문의글 수정 메서드
    public void updateBoard(bbqBoardVO vo) {
       try {
          // db
          conn = JDBCConnection.getConnection();
          // sql
          String sql = "UPDATE bbq_board SET title=?, content=?,type=? WHERE num=? ";
          // ?
          stmt = conn.prepareStatement(sql);
          // ? 매핑
          stmt.setString(1, vo.getTitle());
          stmt.setString(2, vo.getContent());
          stmt.setString(3, vo.getType());
          stmt.setInt(4, vo.getNum());
          // 실행
          stmt.executeUpdate();
       } catch (Exception e) {
          e.printStackTrace();
       }finally {
          JDBCConnection.close(rs, stmt, conn);
       }
   }
	
	// 문의글 삭제 메서드
	public void deleteBoard(int num) {
	    try {
	       conn = JDBCConnection.getConnection();
	       //1. sql
	       String sql ="DELETE FROM bbq_board WHERE num=?";
	       //2. prepareStatement
	       stmt = conn.prepareStatement(sql);
	       //3. ?매핑
	       stmt.setInt(1, num);
	       //4. 실행
	       stmt.executeUpdate();		
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCConnection.close(stmt, conn);
		}
	  }

	
}
