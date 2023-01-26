<%@page import="com.google.gson.Gson"%>
<%@page import="com.jspshop.domain.Member"%>
<%@page import="java.util.List"%>
<%@page import="com.jspshop.repository.MemberDAO"%>
<%@ page language="java" contentType="application/json;charset=UTF-8"%>
<%!MemberDAO memberDAO = new MemberDAO();%>
<%
	List<Member> memberList = memberDAO.selectAll();
	Gson gson = new Gson();
	String jsonList = gson.toJson(memberList);
	out.print(jsonList);
%>