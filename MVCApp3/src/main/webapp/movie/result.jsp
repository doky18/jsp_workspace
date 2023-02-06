<%@page import="com.mvc3.model.MovieAdvisor"%>
<%@ page  contentType="text/html;charset=UTF-8"%>

<%!
//MVC 패턴에서 C인 부분은 BloodController.java로 분리시킴
%>

<%
//MVC 패턴에서 C인 부분은 BloodController.java로 분리시킴
//request가 있으니 웹

//MVC 패턴에서 M인 부분은 재사용성을 위해 BloodAdvisor.java로 분리시킴
%>

<% 
//String msg=(String)session.getAttribute("msg"); 

//여기서의 request는 새로운 요청에 읭해서 생성된 request가 아니라, 
//BloodController에게 요청을 시도할 때 생성된 예전의 request 객체에 원하는 정보를 세션에 담듯 이용하라 수 있음 
String msg=(String)request.getAttribute("msg");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	영화에 대한 관람평, 기대평 :
	<%=msg %>
	<p>
</body>
</html>