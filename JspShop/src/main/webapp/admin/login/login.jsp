<%@page import="com.google.gson.Gson"%>
<%@page import="com.jspshop.util.MessageObject"%>
<%@page import="com.jspshop.domain.Admin"%>
<%@page import="com.jspshop.repository.AdminDAO"%>
<%@ page contentType="application/json;charset=UTF-8"%>

<%! 
	AdminDAO adminDAO = new AdminDAO();
%>
<%
    //로그인 폼으로부터 전송된 파라미터 받기
    String admin_id = request.getParameter("admin_id");
    String admin_pass = request.getParameter("admin_pass");
    
    Admin admin = new Admin();		//empty
	admin.setAdmin_id(admin_id);
	admin.setAdmin_pass(admin_pass);
	
	Admin obj = adminDAO.select(admin);
	MessageObject msg=new MessageObject();
	Gson gson = new Gson();
	
	
	
	if(obj !=null){// 객체가 존재한다는 것은 로그인이 일치,, 즉, 로그인 성공
		//세션객체에 obj를 담아두고, 다음번에 들어왔을때도 이 유저를 알아봐준다 
		//session은 맵이다!  key와 value 쌍으로 관리한다!
		//                   ("뭐라고 부를래?", value)
		session.setAttribute("admin", obj);
		msg.setCode(1);
		msg.setMsg(obj.getAdmin_name()+"님 환영합니다.");	//성공 데이터
	}else{
		msg.setCode(0);
		msg.setMsg("로그인 정보가 올바르지 않습니다");		//실패 데이터 
	}
	String result=gson.toJson(msg);
    System.out.println("result : "+result);
    out.print(result);
    
  //  System.out.println("admin_id : " + admin_id);
   // System.out.println("admin_pass : " + admin_pass);
%>