package mvc.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mvc.model.blood.BloodAdvisor;

//이 클래스는 MVC에서 컨트롤러로서 역할을 수행한다
//컨트롤러란? Model과 View를 분리시키기 위한 중간자 역할
/*
 * JavaEE 분야에서 MVC 개발 방법이론을 적용하려면 다음과 같다
 * 1) Model - 재사용 가능한 중립적 코드이어야 하므로 순수 .java를 이용
 * 				Plain Old Java Object (POJO)
 * 2) View - 웹서버에서 실행될 수 있으며, 디자인도 표현가능한 객체
 * 				JSP가 그 역할을 수행한다
 * 3) Controller - 웹서버에서 실행될 수 있으며, 클라이언트의 요청과 응답을 처리할 수 있는 객체
 * 						Servlet이 그 역할을 수행
 * MVC 모델2 - javaEE로 구현한 MVC 패턴 
 * 		   모델1 - 우리가 지금까지 써왔던 방식 (jsp가 디자인 및 컨트롤러까지 모두 감당)
 */
public class BloodController {
	BloodAdvisor advisor = new BloodAdvisor();			//연
	protected void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String blood = request.getParameter("blood");
		
		//출력은 가능하지만 출력하면 안된다! 
		//왜? MVC로 개발하기 위해서 철처히 분리시키고 있는데 out.print를 하게 되면 뷰 역할을 수행하게 되니까
		
		//3단계 ------일시키기
		String msg = advisor.getAdvice(blood);
		
		//결과를 보여주는 View 역할을 하는 페이지가 result.jsp
		//1)
		//System.out.println(msg);  
		//이렇게 했을 때 콘솔에 찍히긴 하는데 데이터가 웹으로 넘어가진 않음. 우리는 넘겨줘야함 
		
		//2)
		//result.jsp가 결과를 참조할 수 있도록 어딘가에 저장해놓자.. session에 담아보자
		//HttpSession session= request.getSession();		//브라우저를 닫거나, 일정시간 접속을 안하면 세션은 죽음
       // session.setAttribute("msg", msg);
		/*
		 PrintWriter out = response.getWriter();
	       
	        out.print("<script>");
	        out.print("location.href='/blood/result.jsp';");//암기해서 주소치고 들어가는거랑 똑같 
	        out.print("</script>");  //고양아 다했어 -> 고양이가 html을 만들어서 응답 후,,, 서버 끊어짐 
	        
	    */
        
        //3)
		//엔터프라이즈 급의 어플리케이션에서 모든 정보를 세션에 담아버리면 세션이 너무 비대해진다..
		//해결책 -> 세션의 역할을 수행할 수 있는 객체가 있다면, 세션이 가벼워 질 것이다..
		//요청이 들어오면, 이 요청에 대해서 응답을 보류하고, 서버의 특정 서블릿으로 요청의 방향을 전달하는 방법을 가리켜 forwarding이라고 하고
		//포워딩을 이용하면 현재 요청에 대한 응답을 하지 않은 상태이므로 request, response 객체가 죽지않고 유지된다
		//따라서 죽지않은 request 객체에 원하는 정보를 세션에 담듯 이용할 수 있다
		
		//4단계 --------결과 저장
		request.setAttribute("msg", msg);	
		/* 잘라내서 5단계로 넘어감
		RequestDispatcher dis =request.getRequestDispatcher("/blood/result.jsp");
		//포워딩 시작
		dis.forward(request, response);
		*/
       // PrintWriter out = response.getWriter();
	}
}
