package view.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import biz.common.JDBCConnection;

@WebServlet("/JoinCtrl")
public class JoinCtrl extends HttpServlet {
   
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         doGetPost(request,response);
      }
      protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         doGetPost(request,response);
      }
      protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         request.setCharacterEncoding("utf-8");
         response.setContentType("text/html;charset=utf-8");
         PrintWriter writer = response.getWriter();
         
         String id=request.getParameter("id");
         String password=request.getParameter("password");
         String name=request.getParameter("name");
         String role=request.getParameter("role");
         
         String passwordck=request.getParameter("passwordck");
         
         // # DB 비즈니스 로직
         Connection conn=null;
         PreparedStatement stmt=null;
         ResultSet rs=null;
         
         if(password.equals(passwordck)) {
        	 
         try {
            conn=JDBCConnection.getConnection();
            String sql="insert into exam_users values(?,?,?,?)";
            stmt=conn.prepareStatement(sql);
            stmt.setString(1, id);
            stmt.setString(2, password);
            stmt.setString(3, name);
            stmt.setString(4, role);
            int cnt=stmt.executeUpdate();
            if(cnt!=0) {
               response.sendRedirect("./index.jsp"); // 처음 로그인 창으로 이동
            }
         } catch (Exception e) {
            e.printStackTrace();
            writer.println("<script>alert('중복된 아이디 입니다.'); location.href='./join.jsp';</script>");
         } finally {
            JDBCConnection.close(stmt, conn);
         }
         } else {
        	 writer.println("<script>alert('비밀번호 오류입니다..'); location.href='./join.jsp';</script>");
         }
         
      }

}