<%@page import="notice.domain.Notice"%>
<%@page import="notice.repository.NoticeDAO"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%!
	NoticeDAO noticeDAO = new NoticeDAO();
%>
<%
	request.setCharacterEncoding("utf-8");

	//파라미터 받기
	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	
	//비어있는 dto 생성
	Notice notice = new Notice();
	
	//dto 채워넣기
	
	
	//

%>