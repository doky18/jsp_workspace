package mvc.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.controller.board.RegistController;

/*
 * 하위 컨트롤러들이 직접 요청을 받게되면, 업무의 효율성과 유지보수성이 저하된다..
 * 우리의 경우 너무 많은 서블릿매핑이 필요하게 됨
 * 따라서 규모가 아무리 커질지라도, 모든 요청을 하나의 진입점으로 몰아서
 * 요청의 유형을 분석하여 적절한 컨트롤러들에게 배분
 * 
 * 컨트롤러의 전형적 업무
 * 1)요청을 받는다
 * 2)요청을 분석한다
 * 		-알맞는 하위 컨트롤러를 선택하여 요청 전달
 * 3) 알맞는 모델객체에게 일을 시킴
 * 4) 결과가 있을 경우 결과를 저장해둔다
 * 5) 결과를 보여준다
 * 
 * 이 외를 벗어나면 컨트롤러 역할은 넘어가는 것
 * 
 */

public class DispatcherServlet extends HttpServlet{
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doRequest(request, response);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doRequest(request, response);
	}
	
	//1단계 : 요청을 받는다
	protected void doRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//2) 현재 컨트롤러는 전문성이 없으므로, 알맞는 담당 컨트롤러를 선택하여 요청을 전달...
		String uri = request.getRequestURI();
		System.out.println("요청받았음 "+uri);
		
		//요청을 분석하자. 왜?
		//담당 컨트롤러에게 업무를 전달하기 위해
		if(uri.equals("/blood.do")) {
			//혈액형 담당 컨트롤러 호출!
			BloodController controller = new BloodController();
			controller.execute(request, response);
			
		}else if(uri.equals("/movie.do")) {
			//영화 담당 컨트롤러 호출
			MovieController controller = new MovieController();
			//controller.메서드();
			
		}else if(uri.equals("/board/regist.do")) {
			//2단계 : 알맞는 컨트롤러를 선택해야함  -> wirte controller
			RegistController controller = new RegistController();
			controller.regist();
		}
		
		//5단계----
		RequestDispatcher dis =request.getRequestDispatcher("/blood/result.jsp");
		//포워딩 시작
		dis.forward(request, response);
		
		
	}
}
