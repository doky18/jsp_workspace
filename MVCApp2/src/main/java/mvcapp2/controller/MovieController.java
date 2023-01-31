package mvcapp2.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvcapp2.model.movie.MovieAdvisor;

public class MovieController {
	MovieAdvisor advisor = new MovieAdvisor();
	
	public void handle(HttpServletRequest request, HttpServletResponse response) {
		
		//3단계
		String movie = request.getParameter("movie");
		String msg = advisor.getAdvice(movie);
		
		//4단계 : 추후 DispatcherServlet 이 포워딩 처리를 할 때,
		//request 객체를 사용하게 되므로, 결과를 이 객체에 저장해놓자
		
		request.setAttribute("msg", msg);  //포워딩을 위해서 저장만 해놓는 것. 포워딩은 상위 서블릿이 할 것
	}
}	


