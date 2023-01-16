<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@page import="store.repository.StoreDAO"%>
<%@page import="store.domain.Store"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%! 
	StoreDAO storeDAO = new StoreDAO();
%>
<%
	

	//비동기이던 동기이던 서버는 무조건 응답을 해야한다
	//1) 동기로 들어온 클라이언트 : html로 응답
	//2) 비동기로 들어온 클라이언트 : 화면 전체가 아닌 순수 데이터만 보내면 됨
	List storeList = storeDAO.selectAll();
	
	//gson
	Gson gson = new Gson();
	String result = gson.toJson(storeList);
	out.print(result);

	

%>
