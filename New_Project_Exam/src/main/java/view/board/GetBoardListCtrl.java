package view.board;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import biz.board.BoardVO;
import biz.common.JDBCConnection;

@WebServlet("/GetBoardListCtrl")
public class GetBoardListCtrl extends HttpServlet {
	// doGet 처리
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// 한글처리
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");
			
			// #. DB 비지니스 로직
			Connection conn = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;
			try {
				// 0. DB접속
				conn = JDBCConnection.getConnection();
				// 1. 쿼리문 준비
				String sql = "SELECT * FROM exam_board ORDER BY seq DESC";
				// 2. prepareStatement
				stmt = conn.prepareStatement(sql);
				// 3. ? 매핑
				// 4. 실행
				rs = stmt.executeQuery();
				// 5. 반복문 레코드 가져오기
				// 데이터 담을 객체배열 선언
				ArrayList<BoardVO> boardList = new ArrayList<BoardVO>();
				
				while(rs.next()) {
					// DB에 있는 컬럼값
					int seq = rs.getInt("seq");
					String title = rs.getString("title");
					String nickname = rs.getString("nickname");
					String content = rs.getString("content");
					Date regdate = rs.getDate("regdate");
					int cnt = rs.getInt("cnt");
					String userid = rs.getString("userid");
					
					// 자바빈에 DB에서 얻어온 컬럼값 세팅
					BoardVO board = new BoardVO();
					board.setSeq(seq);
					board.setTitle(title);
					board.setNickname(nickname);
					board.setContent(content);
					board.setRegdate(regdate);
					board.setCnt(cnt);
					board.setUserid(userid);
					
					// 패키징(같은 메이커의 상품을 담아서 지퍼 닫아줌) : 패키징 = 객체배열에 객체 할당해주는것
					boardList.add(board);
				}
				// 스코프 request에 바인딩
				request.setAttribute("boardList", boardList);

				// 1. 쿼리문 준비
				sql = "select * from exam_board where cnt=(SELECT max(cnt) FROM exam_board) ORDER BY seq DESC";
				// 2. prepareStatement
				stmt = conn.prepareStatement(sql);
				// 3. ? 매핑
				// 4. 실행
				rs = stmt.executeQuery();
				// 5. 반복문 레코드 가져오기
				ArrayList<BoardVO> popBoardList = new ArrayList<BoardVO>();
				while(rs.next()) {
					// DB에 있는 컬럼값
					int seq = rs.getInt("seq");
					String title = rs.getString("title");
					String nickname = rs.getString("nickname");
					String content = rs.getString("content");
					Date regdate = rs.getDate("regdate");
					int cnt = rs.getInt("cnt");
					String userid = rs.getString("userid");
					
					// 자바빈에 DB에서 얻어온 컬럼값 세팅
					BoardVO popBoard = new BoardVO();
					popBoard.setSeq(seq);
					popBoard.setTitle(title);
					popBoard.setNickname(nickname);
					popBoard.setContent(content);
					popBoard.setRegdate(regdate);
					popBoard.setCnt(cnt);
					popBoard.setUserid(userid);
					
					popBoardList.add(popBoard);
				}
				
				// 스코프 request에 바인딩
				request.setAttribute("popBoardList", popBoardList);
				
				// 포워딩 = 처리할 view단에 바인딩 데이터 넘겨줌
				RequestDispatcher view = request.getRequestDispatcher("./getBoardList.jsp");
				view.forward(request, response);
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				JDBCConnection.close(rs, stmt, conn);
			}
		}

		
		// doPost 처리
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		}

}
