<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ page import="emp.domain.Dept"%>
<%@page import="com.google.gson.Gson"%>
<%@ page import="java.util.List"%>
<%@ page import="emp.repository.DeptDAO"%>

<%! DeptDAO deptDAO = new DeptDAO();%>
<%
		List deptList = deptDAO.selectAll();

		out.print(deptList.size());
		
		Gson gson = new Gson();
		String result = gson.toJson(deptList);
		out.print(result);
%>