<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="com.edu.noticeapp.repository.NoticeDAO"%>
<%@ page import="com.edu.noticeapp.domain.Notice"%>
<%!
	//선언부
	NoticeDAO noticeDAO = new NoticeDAO();
%>
<%
//idx를 파라미터로 넘겨받아 와야함...
//1) list.jsp 에서 파라미터를 제대로 넘겨야 한다
//2) idx를 파라미터로 넘겨받아 변수에 받으면 된다
//3) 파라미터명은 notice_idx로 하기

	int notice_idx=Integer.parseInt(request.getParameter("notice_idx"));
	String sql="select * from notice where notice_idx="+notice_idx;
	out.print(sql);

	//한 건 가져오기
	Notice notice = noticeDAO.select(notice_idx);

	//조회수 하나 올리기
	noticeDAO.updateHit(notice_idx);
	
%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <style>
    body {
      font-family: Arial, Helvetica, sans-serif;
    }

    * {
      box-sizing: border-box;
    }

    input[type=text],
    select,
    textarea {
      width: 100%;
      padding: 12px;
      border: 1px solid #ccc;
      border-radius: 4px;
      box-sizing: border-box;
      margin-top: 6px;
      margin-bottom: 16px;
      resize: vertical;
    }

    input[type=button] {
      background-color: #04AA6D;
      color: white;
      padding: 12px 20px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }

    input[type=button]:hover {
      background-color: #45a049;
    }

    .container {
      border-radius: 5px;
      background-color: #f2f2f2;
      padding: 20px;
    }
  </style>
  <script src="https://cdn.ckeditor.com/ckeditor5/35.4.0/classic/ckeditor.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script>
//jquery로 가보자
	$(function(){
			//수정요청
		$($("input[type='button']")[0]).click(function(){
			//내용이 많을 뿐만 아니라, form을 이용한 전송이므로 POST방식으로 전송하자 
			$("form").attr("method", "POST");
			$("form").attr("action", "/notice/update.jsp");
			$("form").submit();
		});
		$($("input[type='button']")[1]).click(function(){
			//삭제요청-get
			location.href="/notice/delete?notice_idx=<%=notice.getNotice_idx()%>";
		});
		$($("input[type='button']")[2]).click(function(){
			location.href="/notice/list.jsp";			//get 링크
		});
	});

  </script>
</head>

<body>

  <h3>Contact Form</h3>

  <div class="container">
        <!--넘겨야할 데이터에 보안이 필요하면 post,아닐경우 get-->
        <form method="post" action="/notice/update.jsp?notice_idx=<%=notice_idx%>">
            <!--이때, title writer content는 개발자들 간의 약속-->
            <input  type="hidden" name="notice_idx" value="<%=notice.getNotice_idx()%>" style="background:yellow">
          
            <input type="text" name="title" id="title" value="<%= notice.getTitle() %>">
            <input type="text" name="writer" id="writer" value="<%= notice.getWriter() %>">
            <textarea name="content" value="Write something.." style="height:200px"
                id="content"><%= notice.getContent() %></textarea>

      <!-- submit 은 현재 form 태그의 내용을 무조건 전송하므로 무조건 전송을 방지하기 위해 일반 button을 줌 -->
            <input type="button" value="수정">
            <input type="button" value="삭제">
            <input type="button" value="목록">
    </form>
  </div>

</body>

</html>