<%@page import="com.jspshop.domain.Member"%>
<%@page import="com.jspshop.repository.MemberDAO"%>

<%@ page  contentType="text/html;charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<!-- useBean :  class=""영역에 있는 객체의 인스턴스를 생성한다.-->
<jsp:useBean id="member" class="com.jspshop.domain.Member"/>
<!-- id가 같은 인스턴스에 존재하는 property와 같은 변수로 있는 값을 채워준다.
 *을 쓸경우 모든 변수에 적용
 -->
<jsp:setProperty name="member" property="*"/>

<%
    /*
    Member member = new Member(); == <jsp:useBean id="member" class="com.jspshop.domain.Member"/>
    
    member.setId(request.getParameter("id"));
    member.setPass(request.getParameter("pass"));
    ·
    ·
    ·
     == <jsp:setProperty name="member" property="*"/>
    
    */
    MemberDAO memberDAO = new MemberDAO();
    int result = memberDAO.insert(member);
    out.print(result);
%>