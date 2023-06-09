package expression;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.PersonVO;

@WebServlet("/JSTLDataSend")
public class JSTLDataSend extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request,response);
	}
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		// 1. 배열 데이터
		String[] name= {"강백호","서태웅","정대만"};
		// 2. 배열객체 데이터
		ArrayList<String> list=new ArrayList<>();
		list.add("송태섭");
		list.add("채치수");
		list.add("채소연");
		// 3. 자바빈 데이터
		PersonVO mc=new PersonVO();
		mc.setName("goodman");
		mc.setAge(34);
		mc.setAddress("Seoul");
		PersonVO mj=new PersonVO();
		mj.setName("pretty");
		mj.setAge(10);
		mj.setAddress("Seoul");
		// PersonVO타입만 올 수 있는 객체배열 선언하여 데이터 추가
		ArrayList<PersonVO> personList=new ArrayList<PersonVO>();
		personList.add(mc);
		personList.add(mj);
		
		// 스코프 영역에 저장 = request => 바인딩
		request.setAttribute("name", name);
		request.setAttribute("list", list);
		request.setAttribute("personList", personList);
		// 포워딩
		RequestDispatcher dis=request.getRequestDispatcher("210_JSTLDataSend.jsp");
		dis.forward(request, response);
	}

}