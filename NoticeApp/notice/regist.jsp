<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="com.edu.noticeapp.repository.NoticeDAO"%>
<%@ page import="com.edu.noticeapp.domain.Notice"%>
<%! 
	NoticeDAO noticeDAO=new NoticeDAO();
%>
<%
	//스크립틀릿은 요청이 들어올 때 마다 실행되는 영역. 그래서 여기서 NoticeDAO noticeDAO; 올려주면 안됨 	
	Notice notice = new Notice();
	request.setCharacterEncoding("utf-8");
	notice.setTitle(request.getParameter("title"));
	notice.setWriter(request.getParameter("writer"));
	notice.setContent(request.getParameter("content"));

	int result = noticeDAO.insert(notice);
	out.print("result is" + result);

	//클라이언트로부터 폼의 파라미터들을 넘겨받아 오라클에 넣기
	//오라클에 넣기
	//드라이버로드, 접속, 쿼리, 닫기 

	//목록 페이지 나오게
%>

<% if(result>0){ %>
		<script>
		alert("등록 완료");
		location.href="/notice/list.jsp";
		</script>
<%}else{%>
		<script>
		alert("등록 실패");
		history.back();
		</script>
<%}%>