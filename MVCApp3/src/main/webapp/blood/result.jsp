<%@page import="com.mvc3.model.BloodAdvisor"%>
<%@ page  contentType="text/html;charset=UTF-8"%>

<%!
//MVC 패턴에서 C인 부분은 BloodController.java로 분리시킴
%>

<%
//MVC 패턴에서 C인 부분은 BloodController.java로 분리시킴
//request가 있으니 웹

//MVC 패턴에서 M인 부분은 재사용성을 위해 BloodAdvisor.java로 분리시킴
    //request.setCharacterEncoding("utf-8");
    //String blood=request.getParameter("blood");

    //현재 코드에서 중립적인 자바 코드는 굳이 jsp안에 둘 필요없다.
    //이유? 미래의 재사용성을 위해서 별도로 분리시켜 놓아야 한다.
    //String msg=null; //결과 메시지를 담을 변수
    //if(blood.equals("A")){
    //    msg="꼼꼼하다";
    //}else if(blood.equals("B")){
    //    msg="자기주관이 뚜렷하다";
    //}else if(blood.equals("AB")){
    //    msg="선택지를 많이 둔다";
    //}else if(blood.equals("O")){
    //    msg="친구가 많다";
    //}

    //String msg=advisor.getAdvice(blood);
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
	혈액형에 대한 판단 결과 :
	<%=msg %>
	<p>
</body>
</html>
