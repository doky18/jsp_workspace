<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="com.edu.noticeapp.repository.NoticeDAO"%>
<%@ page import="com.edu.noticeapp.domain.Notice"%>
<%@ page import="java.util.ArrayList"%>
<%!
	//선언부는 인스턴스 멤버 영역이므로, 여기에 선언한 변수는 이 jsp의 인스턴스가 생성될 때 초기화 됨
	NoticeDAO noticeDAO = new NoticeDAO();
%>
<%

	ArrayList <Notice>list=noticeDAO.selectAll();
	
    int totalRecord=list.size();
    int pageSize=10;
    int totalPage=(int)Math.ceil((float)totalRecord/pageSize);//총페이지수
	int blockSize=10;		//블럭당 보여질 페이지 수
	int currentPage=1;		//현재 유저가 보는 페이지 -> 저 페이지는 클라이언트에 의해서 변해야함
	//전송되어 온 currentPage를 jsp 의 currentPage 변수에 대입
	//null이 아닐때만, 아래의 페이지를 
	if(request.getParameter("currentPage")!=null){
	currentPage=Integer.parseInt(request.getParameter("currentPage"));
	}

	int firstPage=currentPage-(currentPage-1)%blockSize;		//블럭당 반복문의 시작값
	int lastPage=firstPage+(blockSize-1);		//블럭당 반복문의 끝값 
	
	int curPos=(currentPage-1)*pageSize;	//페이지당 시작 인덱스 (ArrayList 에서)
	int num = totalRecord -curPos;	//페이지당 시작 게시물 번호 

%>
<%="totalRecored="+totalRecord+"<br>"%>
<%="pageSize="+pageSize+"<br>"%>
<%="totalPage="+totalPage+"<br>"%>
<%="currentPage="+currentPage+"<br>"%>
<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>Document</title>
<style>
table {
  border-collapse: collapse;
  border-spacing: 0;
  width: 100%;
  border: 1px solid #ddd;
  position:relative;
  left:-500;
}
a{
    text-decoration:none;
    color:black;
}

th, td {
  text-align: left;
  padding: 16px;
}

tr:nth-child(even) {
  background-color: #f8b9c6;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	  //("css의 선택자").()메서드
    $("table").animate({left: '0px'});

	//글 등록 버튼을 클릭하면
	$("button").on("click", function(){
		location.href="/notice/write.html";
	});
});
</script>
</head>
<body>
<table>
  <tr>
    <th>no</th>
    <th>제목</th>
    <th>작성자</th>
    <th>등록일</th>
    <th>조회수</th>
  </tr>
  <%for(int i=1;i<pageSize;i++){%>
  <%if(num<1)break; //num이 1보다 작아지면..%>
  <% Notice notice=list.get(curPos++);%>
      <tr>
        <td><%=num--%></td>
        <td>
			<a href="/notice/content.jsp?notice_idx=<%=notice.getNotice_idx()%>"><%=notice.getTitle()%></a>
		</td>
        <td><%=notice.getWriter()%></td>
        <td><%=notice.getRegdate()%></td>
        <td><%=notice.getHit()%></td>
      </tr>
  <%}%>

  <tr>
	<td colspan="5" style="text-align:center">

	<%if(firstPage-1>0){%>
	<a href="/notice/list.jsp?currentPage=<%=firstPage-1%>">◀</a>
	<%}else{%>
		<a href="javascript:alert('첫 페이지 입니다')">◀</a>
		<%}%>

		<%for(int i=firstPage;i<=lastPage;i++){%>
			<%if(i>totalPage)break;  //가지고 있는 총페이지수를 넘어서면 빠져나오게 %>
		<!-- a태그의 뜻 : 지정한 url로 요청을 시도 10:26사진캡쳐 필요 -->
			<a href="/notice/list.jsp?currentPage=<%=i%>">[<%=i%>]</a>
		<%}%>

	<%if(lastPage+1 < totalPage){	//다음 페이지가 있을때...%>
		<a href="/notice/list.jsp?currentPage=<%=lastPage+1%>">▶</a>
	<%}else{%>
				<a href="javascript:alert('마지막페이지 입니다')">▶</a>
		<%}%>
	</td>
  </tr>
	<tr>
		<td colspan="5">
			<button> 글 등록 </button>
		</td>
	</tr>
</table>

</body>
</html>