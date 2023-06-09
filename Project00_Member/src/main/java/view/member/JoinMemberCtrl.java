package view.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import biz.member.MemberDAO;
import biz.member.MemberVO;

@WebServlet("/JoinMemberCtrl")
public class JoinMemberCtrl extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    doGetPost(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    doGetPost(request,response);
	}
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("utf-8");
	    response.setContentType("text/html;charset=utf-8");
	    
	    HttpSession session=request.getSession();
		session.invalidate();
	    
	    String id=request.getParameter("id");
	    String password=request.getParameter("password");
	    String pwcheck=request.getParameter("pwcheck");
	    String name=request.getParameter("name");
	    String email=request.getParameter("email");
	    String tel=request.getParameter("tel");
	    String[] hobbyList=request.getParameterValues("hobby");
	    String hobby="";
	    for(int i=0;i<hobbyList.length;i++) {
	    	hobby=hobby+hobbyList[i]+" ";
	    }
	    String job=request.getParameter("job");
	    String age=request.getParameter("age");
	    String info=request.getParameter("info");
	    
	    MemberVO vo=new MemberVO();
	    vo.setId(id);
	    vo.setPassword(password);
	    vo.setName(name);
	    vo.setEmail(email);
	    vo.setTel(tel);
	    vo.setHobby(hobby);
	    vo.setJob(job);
	    vo.setAge(age);
	    vo.setInfo(info);
	    
	    MemberDAO dao=new MemberDAO();
	    
	    if(password.equals(pwcheck)) {
	    	int result=dao.joinMember(vo);
	    	if(result!=0) response.sendRedirect("login.jsp");
	    } else {
	    	response.sendRedirect("memberjoinCheck.jsp");
	    }
	    
	}

}
