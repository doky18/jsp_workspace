package com.mvc3.controller;

import java.security.PublicKey;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//BloodController와 MovieController 등 모든 하위 컨트롤러들의 상위 컨트롤러들 => is a 관계로
public interface Controller {
	public void execute(HttpServletRequest request, HttpServletResponse response);
	// 이제 handle등등 과 같은 메서드는 쓰지 않고 execute로 통일됨
		
	//뷰 페이지 반환
	public String getViewName();	
	
	//포워딩 여부
	public boolean isForward();
	
	
}
