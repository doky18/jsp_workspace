<%@page import="mvcapp2.model.blood.BloodAdvisor"%>
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
    String msg=(String)request.getAttribute("msg");		//여기서 "msg"를 스트링으로 담는것
	//String msg=(String)session.getAttribute("msg");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	영화에 대한 관람평, 기대평 :
	<p>
		<%=msg %>
		<!-- 응담이 아니라 html로 서버가 뿌린것 -->
	</p>
</body>
</html>