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
import biz.common.jdbcConnection;

@WebServlet("/GetBoardListCtrl")
public class GetBoardListCtrl extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글처리
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		// // # DB 비즈니스 로직
		Connection conn=null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		
		try {
			// 0. DB 접속
			conn=jdbcConnection.getConnetction();
			// 1. 쿼리문 준비
			String sql="select * from b_board order by seq desc";
			// 2. prepareStatement
			stmt=conn.prepareStatement(sql);
			// 3. ? 매핑 X
			// 4. 실행
			rs=stmt.executeQuery();
			// 5. 반복문 레코드 가져오기
			// 데이터 담을 객체배열 선언
			ArrayList<BoardVO> boardList=new ArrayList<>();
			while(rs.next()) {
				// DB에 있는 컬럼값
				int seq=rs.getInt("seq");
				String title=rs.getString("title");
				String nickname=rs.getString("nickname");
				String content=rs.getString("content");
				Date regdate=rs.getDate("regdate");
				int cnt=rs.getInt("cnt");
				
				// 자바빈에 DB에서 얻어온 컬럼값 세팅
				BoardVO board=new BoardVO();
				board.setSeq(seq);
				board.setTitle(title);
				board.setNickname(nickname);
				board.setContent(content);
				board.setRegdate(regdate);
				board.setCnt(cnt);
				
				// 패키징
				boardList.add(board);
			}
			// 스코프 request에 바인딩
			request.setAttribute("boardList", boardList);
			// 포워딩 = 처리할 view단에 바인딩 데이터 넘겨줌
			RequestDispatcher view=request.getRequestDispatcher("./getBoardList.jsp");
			view.forward(request,response);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			jdbcConnection.close(rs, stmt, conn);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
