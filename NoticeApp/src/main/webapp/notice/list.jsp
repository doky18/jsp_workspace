<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="domain.Notice"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="application/json;charset=UTF-8"%>
<%
List<Notice> noticeList = new ArrayList<>();

for (int i = 1; i <= 10; i++) {
	Notice notice = new Notice();
	notice.setNotice_idx(i);
	notice.setTitle("줄넘기" + i + "회");
	notice.setWriter("작성자" + i);
	notice.setRegdate("2023-01" + i);
	notice.setHit(i);

	noticeList.add(notice);
}

Gson gson = new Gson();
String jsonList = gson.toJson(noticeList);
out.print(jsonList);
%>