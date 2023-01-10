<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="com.edu.noticeapp.repository.NoticeDAO" %>
<%@ page import ="com.edu.noticeapp.domain.Notice" %>
<%! //선언부 멤버영역 
NoticeDAO noticeDAO = new NoticeDAO(); 
%>
<%

	//넘겨받은 4개의 파라미터를 이용하여, update문 수행
	//그리고 다시 상세페이지 보여주기(상세페이지 재요청)

    //수정을하기위해서는 몇번의 공지인지 알아야하기때문에 idx도 필요하고,
    //수정한 제목, 작성자, 내용이 있어야하기에
    //title,writer,content또한 파라미터로 받아야한다.(현재 배운 수준으로는)
    //이제 content.jsp에서는 get방식으로 파라미터를 넘겨준다.그렇다면 이제부터 get방식으로 가져온 파라미터를 출력해보자!!
    //idx가져오기
    request.setCharacterEncoding("utf-8");

    int notice_idx = Integer.parseInt(request.getParameter("notice_idx"));
    //제목가져오기
    String title= request.getParameter("title");
    //작성자가져오기
    String writer= request.getParameter("writer");
    //내용가져오기
    String content= request.getParameter("content");

	//dao에 넣기전에 dto에 담아서 보내주자!
    Notice notice = new Notice();

    notice.setNotice_idx(notice_idx);
    notice.setTitle(title);
    notice.setWriter(writer);
    notice.setContent(content);

	out.print(notice_idx+"<br>");
    out.print(title+"<br>");
    out.print(writer+"<br>");
    out.print(content+"<br>");


   //이제 dao의 수정 메소드를 호출하고 dto를 넘겨주자!
   //나중에는 $.ajax(~~~~)를 통해서 머리의 정보와 바디의정보중 보내고싶은 파라미터를
   //json형식으로 한번에 보내는 것이 가능하며
   //requestbody를 활용하면 받은 json을 바로 같은 이름의 dto 변수값에 넣어주는 기능이 있다.
   //수정하기
    int result = noticeDAO.update(notice);

    out.print("<script>");
    if(result>0){
        out.print("alert('수정성공');");
        out.print("location.href='/notice/content.jsp?notice_idx="+ notice_idx +"';"); //상세보기로 다시 가기
    }else {
        out.print("alert('수정실패');");
        out.print("history.back();");
    }
        out.print("</script>");
%>