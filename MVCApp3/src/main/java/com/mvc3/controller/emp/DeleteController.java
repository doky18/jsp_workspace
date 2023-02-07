package com.mvc3.controller.emp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc3.controller.Controller;
import com.mvc3.domain.Emp;
import com.mvc3.model.emp.EmpService;

//사원들 삭제 요청을 처리하는 하위 컨트롤러
public class DeleteController implements Controller{
	//1.
	EmpService empService = new EmpService();

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		//2. 파라미터 받기
		String [] empno=request.getParameterValues("empno");
		int[] deptno=new int[empno.length];	//부서 번호를 담을 배열
		
		
		for(int i=0;i<empno.length;i++) {
			System.out.println(empno[i]); //이렇게 하면 몇번째 체크박스를 찍었는지 숫자가 콘솔에 찍힘
			Emp emp = empService.select(Integer.parseInt(empno[i]));
			//deptno[i]=emp.getDept().getDeptno();
			empService.remove(emp);
			
		}
		//넘겨받은 empno를 이용하여, 해당 사원이 몇번 부서에서 근무했는지
		//그 부서번호를 가져와야 함
		
		
	}

	@Override
	public String getViewName() {
		return "/emp/view/del";
	}

	@Override
	public boolean isForward() {
		return false;
	}

}
