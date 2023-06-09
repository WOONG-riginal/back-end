package view.board;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import biz.board.BoardVO;
import biz.common.jdbcConnection;

@WebServlet("/GetBoardCtrl")
public class GetBoardCtrl extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request,response);
	}

	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		// 로그인 처리 = 세션
		HttpSession session=request.getSession();
		String name=(String)session.getAttribute("name");
		if(name==null) {
			response.sendRedirect("./login.jsp");
		}
		// seq 파라미터 변수명 num에 할당
		int num=Integer.parseInt(request.getParameter("seq"));
		
		// # DB 비즈니스 로직
		Connection conn=null;
		PreparedStatement stmt=null;
		ResultSet rs=null;

		
		try {
			// 0. DB 접속
			conn=jdbcConnection.getConnetction();
			
			// a. cnt 조회수 증가
			// 1. 쿼리문 준비
			String sql="update b_board set cnt=(select cnt+1 from b_board where seq=?) where seq=?";
			// 2. prepareStatement
			stmt=conn.prepareStatement(sql);
			// 3. ? 매핑
			stmt.setInt(1, num);
			stmt.setInt(2, num);
			// 4. 실행
			stmt.executeUpdate();
			
			// b. DB에서 하나의 레코드셋 가져오기
			// 1. 쿼리문 준비
			sql="select * from b_board where seq=?";
			// 2. prepareStatement
			stmt=conn.prepareStatement(sql);
			// 3. ? 매핑
			stmt.setInt(1, num);
			// 4. 실행
			rs=stmt.executeQuery();
			// 5. 사용 = 자바빈에 패키징
			BoardVO board=new BoardVO();
			if(rs.next()) {
				board.setSeq(rs.getInt("seq"));
				board.setTitle(rs.getString("title"));
				board.setNickname(rs.getString("nickname"));
				board.setContent(rs.getString("content"));
				board.setRegdate(rs.getDate("regdate"));
				board.setCnt(rs.getInt("cnt"));
			}
			
			// 앞서 받은 데이터 바인딩, 포워딩
			request.setAttribute("board", board);
			RequestDispatcher view=request.getRequestDispatcher("./getBoard.jsp");
			view.forward(request,response);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			jdbcConnection.close(rs, stmt, conn);
		}
		
	}

}
