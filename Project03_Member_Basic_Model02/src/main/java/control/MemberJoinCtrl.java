package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberDAO;
import model.MemberVO;

@WebServlet("/MemberJoinCtrl.do")
public class MemberJoinCtrl extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    doGetPost(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    doGetPost(request,response);
	}
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("utf-8");
	    response.setContentType("text/html;charset=utf-8");
	    
	    // 폼 데이터 받기
	    String id=request.getParameter("id");
	    String pass1=request.getParameter("pass1");
	    String pass2=request.getParameter("pass2");
	    String email=request.getParameter("email");
	    String tel=request.getParameter("tel");
	    String[] hobbyList=request.getParameterValues("hobby");
	    String hobby="";
	    for(String list:hobbyList) {
	    	hobby+=list+" ";
	    }
	    String job=request.getParameter("job");
	    String age=request.getParameter("age");
	    String info=request.getParameter("info");
	    
	    // 자바빈에 값 할당
	    MemberVO bean=new MemberVO();
	    bean.setId(id);
	    bean.setPass1(pass1);
	    bean.setPass2(pass2);
	    bean.setEmail(email);
	    bean.setTel(tel);
	    bean.setHobby(hobby);
	    bean.setJob(job);
	    bean.setAge(age);
	    bean.setInfo(info);
	    
	    
	    // 컨트롤러 분기
	    if(pass1.equals(pass2)) {
	    	MemberDAO dao=new MemberDAO();
	    	dao.insertMember(bean);
	    	
	    	RequestDispatcher dis=request.getRequestDispatcher("/MemberListCtrl.do");
	    	dis.forward(request, response);
	    }else {
	    	RequestDispatcher dis=request.getRequestDispatcher("error.jsp");
	    	dis.forward(request, response);
	    }
	    
	}

}
