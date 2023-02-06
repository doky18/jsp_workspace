package com.mvc3.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc3.model.MovieAdvisor;

//혈액형에 대한 요청을 처리하는 하위 컨트롤러
//3단계 : 일시키기
//4단계 : 결과가 있다면 저장
public class MovieController implements Controller {
	String TAG = this.getClass().getName();			//이게 뭐라구?
	MovieAdvisor advisor = new MovieAdvisor();	//얘가 직접 일하는 기술자
	
	//public void handle() 에서,,,
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println(TAG+"의 execute 호출");
		
		//3단계) 알맞는 로직 객체에 일 시키기
		String movie = request.getParameter("movie"); //send.jsp 에서 파라미터 명이 movie라서
		String msg = advisor.getAdvice(movie);
		//이 결과는 유저들까지 가지고 가야함 
		
		//4단계) request, response 객체가 아직 살아 있으므로, 요청 객체에 결과 저장
		//4단계의 결과 저장 절차가 있을 경우 무조건 request 는 살아있어야하므로 
		request.setAttribute("msg", msg);
		
	}
	
	public String getViewName() {
		//return "/movie.result.jsp";  ---뷰매핑
		return "/movie/view";
	}

	@Override
	public boolean isForward() {
		// TODO Auto-generated method stub
		return false;
	}
}
