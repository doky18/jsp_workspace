package com.mvc3.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc3.model.BloodAdvisor;


//혈액형에 대한 요청을 처리하는 하위 컨트롤러
//3단계 : 일시키기
//4단계 : 결과가 있다면 저장
public class BloodController implements Controller {
	String TAG = this.getClass().getName();			//이게 뭐라구?
	BloodAdvisor advisor = new BloodAdvisor();		//얘가 직접 일하는 기술자
	
	
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println(TAG+"의 execute 호출");
		
		//3단계) 알맞는 로직 객체에 일 시키기
		String blood = request.getParameter("blood"); //send.jsp 에서 파라미터 명이 movie라서
		String msg = advisor.getAdvice(blood);
		//이 결과는 유저들까지 가지고 가야함 
		
		
		//4단계)
		request.setAttribute("msg", msg);
	}
	
	//제일 마지막에 해주기
	public String getViewName() {
		//return "/blood.result.jsp";   ---뷰 매핑 시작
		return "/blood/view";
	}

	@Override
	public boolean isForward() {
		// TODO Auto-generated method stub
		return false;
	}
}

