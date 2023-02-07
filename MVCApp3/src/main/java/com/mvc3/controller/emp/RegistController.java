package com.mvc3.controller.emp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.mvc3.controller.Controller;
import com.mvc3.domain.Dept;
import com.mvc3.domain.Emp;
import com.mvc3.exception.DeptException;
import com.mvc3.exception.EmpException;
import com.mvc3.model.emp.DeptDAO;
import com.mvc3.model.emp.EmpDAO;
import com.mvc3.model.emp.EmpService;
import com.mvc3.mybatis.MybatisConfig;

//사원 신규 등록 요청을 처리하는 하위 컨트롤러(부서+사원)
public class RegistController implements Controller{
	
	EmpService empService=new EmpService();
	
	//4. mybatis~
	MybatisConfig config = MybatisConfig.getInstance();
	//2. 사원과 부서 받아놓기
	DeptDAO deptDAO = new DeptDAO();
	EmpDAO empDAO = new EmpDAO();

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
        
		//1. 파라미터 받기
		String dname = request.getParameter("dname");
		String ename = request.getParameter("ename");
		String sal=request.getParameter("sal");
		
		//3.부서dto 
		Dept dept = new Dept();		//emp
		dept.setDname(dname); 		//부서명 채우기
		
		//6.사원dto
		Emp emp = new Emp();
		emp.setEname(ename);
		emp.setSal(Integer.parseInt(sal));
		emp.setDept(dept);
		
		//5. 3단계 업무 시키기  -> 서비스로 부탁만 해줌
		empService.regist(emp);
		
		//등록이니까 4단계는 없음
	}

	public String getViewName() {
		return "/emp/view/regist";
	}	
	
	public boolean isForward() {
		return false;  //redirect
	}

}
