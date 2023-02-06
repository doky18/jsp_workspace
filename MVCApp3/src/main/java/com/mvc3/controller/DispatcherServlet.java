package com.mvc3.controller;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*모든 요청을 받는 1차 진입점이 되어야 하므로, mvc에서의 컨트롤러로서의 역할을 서블릿이 담당하면 된다
* 1) 요청을 받는다 (메인 컨트롤러-형님)
* 2) 요청을 분석한다 (메인 컨트롤러)
* 3) 로직 객체에게 일을 시킨다 (서브 컨트롤러)
* 4) 결과가 있다면 결과 저장 (서브 컨트롤러) 결과 저장은 : application, session(누적되서 별로), request(생명주기가 딱 맞게 떨어져서)
* 5) 알맞는 결과 페이지를 보여준다 (메인 컨트롤러)
*/
public class DispatcherServlet extends HttpServlet{
 //get, post, put, delete 방식이든 다 받아야해서 하나의 진입점을 가진다
	
	//2단계 업무인 '요청을 분석한다' 단계에서 if문을 사용하지 않으려면,
  //적어도 2단계 이전에는 이미 Properties가 준비 되어있어야 한다.
	//따라서 서블릿이 태어날 때 이미 준비해놓자! 
	Properties props;
	FileInputStream fis;		//일반클래스
	
	//ServeltConfig : 서블릿에 전달된 환경 정보를 담고 있는 객체 
	//						1) 서블릿context를 얻어오고 (getRealPath를 통해서)
	//						2) xml에서 init의 파라미터를 가져오기
	public void init(ServletConfig config) throws ServletException {
		props = new Properties();		//key-value 쌍을 해석할 수 있는 객체 생성 
		//fis = new FileInputStream("매핑파일의 위치");
		try {
			//getRealPath()를 이용하려면, jsp의 경우 내장객체 중 application 내장객체를 이용하면 됨
			//하지만 이 영역은 서블릿이기에 application 내장객체의 자료형인 ServletContext를 이용
			
			//서버가 가동할때 생성되는 서버의 전역적 정보를 가진 객체
			//jsp의 application 내장객체이다!
			ServletContext context=config.getServletContext();	
			String contextConfigLocation = config.getInitParameter("contextConfigLocation");
			System.out.println("넘겨받은 초기화 파라미터는 "+contextConfigLocation);
			
			String realPath=context.getRealPath(contextConfigLocation); //("/WEB-INF/mapping.data") 외부환경정보를 넣지 않기 위해 xml을 수정하고 이 부분을 지움
			System.out.println("매핑파일의 실제 위치는 "+realPath);
			fis = new FileInputStream(realPath);
			
			//fis = new FileInputStream("구구절절/WEB-INF/mapping.data");
			props.load(fis);// 이 시점에서 props가 다 알게 됨..
			// init 시에 props가 mapping.data 정보를 알 수 있게
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doRequest(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doRequest(request, response);
	}
	
	protected void doRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//1단계) 요청을 받는다
		System.out.println("나 호출");
		
		//파라미터 인코딩 처리
		request.setCharacterEncoding("utf-8");
		
		//2단계) 요청을 분석한다
		String uri = request.getRequestURI();		//요청에 대한 처리를 할 수 있게끔 알맞는 컨트롤러를 찾기 위한 과정,,,
		System.out.println("당신의 요청 uri "+uri);
		
		//key를 넣으면 value 가 반환됨
		String controllerPath=props.getProperty(uri);   //생성하고자 하는 인스턴스의 존재 위치를 알아옴. 위치만 알고있음. heap에 올라온 상태는 아님 
		System.out.println("요청 uri에 동작할 하위컨트롤러의 경로는 "+ controllerPath);
		
		try {
			//정적 영역에 원본을 올리고, 그 반환된 결과로 Class자료형을 반환받자 
			Class controllerClass=Class.forName(controllerPath);		//static 영역에 올린다(거푸집 원본) 일 할 애 깨움
			//"ㅁㅁ님 순서 됐습니다"
			
			//인스턴스 올리기
			//controllerClass.newInstance();
			
			//인스턴스를 메모리에 올리는 방법은 new 연산자만 있는게 아니다!
			//정해져있으면안됨 obj = controllerClass.getDeclaredConstructor().newInstance();  //execute 메서드가 있으면서 
			//모든 컨트롤러를 아우르는 상위 컨트롤러 클래스를 만들어 준 뒤,,,
			Controller controller = (Controller) controllerClass.getDeclaredConstructor().newInstance(); 		//new.. 인스턴스 생성 : 일 할 애 호출 (데려옴)
			controller.execute(request, response);
			
			String viewName = controller.getViewName();
			System.out.println("하위 컨트롤러에서 반환받은 뷰이름은 "+viewName);  //뷰 매핑 : /blood/view
			
			String viewPage=props.getProperty(viewName);
			System.out.println("뷰 이름의 검색결과는 "+viewPage);  //뷰페이지 : =/blood/result.jsp
			
			//RequestDispatcher dis = request.getRequestDispatcher(viewPage); //("/movie/result.jsp") 를 이제 viewName으로
			//dis.forward(request, response);	//이때 전달
			if(controller.isForward()) {//포워딩할 경우
				RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
				dispatcher.forward(request, response);
			}else {
				//리다이렉트 할 경우 (재접속)
				//지정한 url로 재접속을 유도함, 클라이언트인 웹브라우저는 
				//서버로부터 응답을 받자마자 지정한 url로 재접속을 시도하게 됨
				//전화를 끊고 새로운 다이얼을 눌러 새롭게 전화거는 것과 같다 
				response.sendRedirect(viewPage);
			}
		
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NoSuchMethodException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		/*
		 * if문은 이제 안쓰겠어요--------------------------------------------------------------------------------------------------------
		if(uri.equals("/blood.do")) {
			System.out.println("혈액형 담당 컨트롤러로 전달할 것");
			BloodController controller = new BloodController();
			controller.execute(request, response);
			
			//5단계) 결과가 있을 경우 포워딩, 결과가 없을 경우 redirect(재접속)
			RequestDispatcher dis = request.getRequestDispatcher("/blood/result.jsp"); //new 하지 않고 요청객체로부터 얻어온다 요청 객체만 만든것 
			dis.forward(request, response);	 //이때 전달
			
		}else if(uri.equals("/movie.do")) {
			System.out.println("영화 담당 컨트롤러로 전달할 것");
			MovieController controller = new MovieController();
			controller.handle(request, response);
			System.out.println("실행2");
			
			//5단계) 결과가 있을 경우 포워딩, 결과가 없을 경우 redirect(재접속)
			RequestDispatcher dis = request.getRequestDispatcher("/movie/result.jsp"); //new 하지 않고 요청객체로부터 얻어온다 요청 객체만 만든것 
			dis.forward(request, response);	 //이때 전달
		}
		* if문은 이제 안쓰겠어요--------------------------------------------------------------------------------------------------------
		*/
		
	}
		//서블릿이 소멸될 때 호출되는 생명주기 메서드
	public void destroy() {
        if(fis !=null) {
            try {
                fis.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

}
