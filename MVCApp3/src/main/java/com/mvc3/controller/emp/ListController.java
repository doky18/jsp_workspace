package com.mvc3.controller.emp;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc3.controller.Controller;
import com.mvc3.model.emp.EmpService;

//사원 목록 요청을 처리하는 하위 컨트롤러
public class ListController implements Controller{
	//1
	EmpService empService = new EmpService();
		
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("목록요청을 처리할 예정");
		
		//2. 서비스한테 3단계 일시키기
		List empList = empService.selectAll();
		//이 리스트는 jsp까지 살아있어야 하므로, application session request 중 원하는 객체에 보관 가능
		//특히 request에 넣게 되면 요청에 대한 응답을 아직 하면 안되고
		//서버상에 존재하는 결과 jsp로 곧바로 포워딩해야한다
		
		//4단계 포워딩하기 위한 준비
		request.setAttribute("empList", empList);
	}

	@Override
	public String getViewName() {
		return "/emp/view/list";
		// 결과는 jsp로 나오게 될 것/emp/view/list=/emp/list.jsp
	}

	@Override
	public boolean isForward() {
		return true;
	}

}
