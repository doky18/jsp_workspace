package mvcapp2.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//어플리케이션의 모든 요청을 혼자 다 받아서 보다 전문적인 하위 컨트롤러에 전달하기 위한 진입점 컨트롤러 클래서
//이 클래스의 존재가 없을 경우, 하위 모든 컨트롤러들은 직접 서블릿으로 정의하여
//수많은 매피이 필요하게 되고, 각 컨트롤러간의 일관성도 없어서 유지보수하기가 오히려 힘들어 진다
public class DispatcherServlet extends HttpServlet{
	
	//온갖 종류의 요청을 받아야하므로, Get Post 가리지 않고 처리가 되어야 한다
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	
	}

	//post 요청과 get 요청을 하나로 공통 메서드에서 처리하자
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//요청 파라미터에 대한 처리를 이 시점에 해두면 하위 컨트롤러에서 처리할 필요가 없게 된다
		request.setCharacterEncoding("utf-8");	//어차피 얘를 거쳐서 갈거니까 여기서 변환해주기
		
		//2단계 : 요청을 분석 한다
		String uri = request.getRequestURI();
		if(uri.equals("/blood.do")) {
			//혈액형 전문 하위 컨트롤러 생성하고, 메서드 호출!
			BloodController controller = new BloodController();	//일 시키기
			controller.execute(request, response);		//결과 가져오기
			
			//5단계 : 결과 보여주기
			
		}else if(uri.equals("/moive.do")) {
			//영화 전문 하위 컨트롤러 생성하고, 매서드 호출!
			
		}
		
	
	}
}
