package view.board;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import biz.board.BoardVO;
import biz.common.JDBCConnection;


@WebServlet("/GetBoardCtrl")
public class GetBoardCtrl extends HttpServlet {
	// doGet()
	   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      doGetPost(request, response);
	   }

	   
	   // doPost()
	   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      doGetPost(request, response);

	   }
	   
	   // doGetPost() 동시처리
	   protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      // 한글처리
	      request.setCharacterEncoding("utf-8");
	      response.setContentType("text/html;charset=utf-8");
	      
	      // 로그인 처리 = 세션
	      HttpSession session = request.getSession();
	      String name = (String)session.getAttribute("name");
	      if(name==null) {
	         response.sendRedirect("./login.jsp");
	      }
	      
	      // seq 파라미터 변수명 num에 할당
	      int num = Integer.parseInt(request.getParameter("seq"));
	      
	      // #. DB 비지니스 로직
	      Connection conn=null;
	      PreparedStatement stmt=null;
	      ResultSet rs=null;
	      
	      // a. 해당 글번호 레코드 셋 가져와서 처리
	      try {
	         /* 기능 #1. 조회수 증가 처리 */
	         // 0. DB 접속
	         conn = JDBCConnection.getConnection();
	         // 1-1. 쿼리문
	         String sql = "UPDATE exam_board SET cnt=(SELECT cnt+1 FROM exam_board WHERE seq=?) WHERE seq=?";
	         // 1-2. prepareStatement
	         stmt = conn.prepareStatement(sql);
	         // 1-3. ? 매핑
	         stmt.setInt(1, num);
	         stmt.setInt(2, num);
	         // 1-4. 실행
	         stmt.executeUpdate();
	         
	         /* 기능 #2. 해당 글번호 레코드셋 처리 */
	         // 2-1. 쿼리문
	         sql = "SELECT * FROM exam_board WHERE seq=?";
	         // 2-2. prepareStatement
	         stmt = conn.prepareStatement(sql);
	         // 2-3. ? 매핑
	         stmt.setInt(1, num);
	         // 2-4. 실행
	         rs = stmt.executeQuery();
	         // 2-5. 사용 = 자바빈에 패키징
	         BoardVO board = new BoardVO();
	         if(rs.next()) {
	            // DB에 있는 컬럼값
	            int seq = rs.getInt("seq");
	            String title = rs.getString("title");
	            String nickname = rs.getString("nickname");
	            String content = rs.getString("content");
	            Date regdate = rs.getDate("regdate");
	            int cnt = rs.getInt("cnt");
	            String userid = rs.getString("userid");
	            
	            // 자바빈에 DB에서 얻어온 컬럼값 세팅
	            board.setSeq(seq);
	            board.setTitle(title);
	            board.setNickname(nickname);
	            board.setContent(content);
	            board.setRegdate(regdate);
	            board.setCnt(cnt);
	            board.setUserid(userid);
	         }
	         
	         // 바인딩
	         request.setAttribute("board", board);
	         
	         // 포워딩
	         RequestDispatcher dis = request.getRequestDispatcher("./getBoard.jsp");
	         dis.forward(request, response);
	         
	      }catch (ClassNotFoundException e) {
	         e.printStackTrace();
	      }catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         JDBCConnection.close(rs, stmt, conn);
	      }

	   }

}
