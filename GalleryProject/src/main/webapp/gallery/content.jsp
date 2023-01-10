<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="gallery.domain.Gallery"%>
<%@page import="gallery.repository.GalleryDAO"%>
<%! GalleryDAO galleryDAO = new GalleryDAO(); %>
<%
int gallery_idx = Integer.parseInt(request.getParameter("gallery_idx"));
Gallery gallery = galleryDAO.select(gallery_idx);

//찍어보기
String sql = "select * from gallery where gallery_idx=" + gallery_idx;
out.print(sql);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
	function edit(){
		if(confirm("수정하시겠어요?")){
			$("form").attr("method", "post");
			
			let v=$("input[type='file']").val();
			
			if(v.length>0){		//이미지를 수정을 원하는 경우
			$("form").attr("action","/gallery/update");
			$("form").attr("enctype","multipart/form-data");
			});
			}else{	//텍스트만 수정하기를 원하는 경우
				$("form").attr("action","/gallery/update");
			}
			$("form").submit();
		}
	}

	function del(){
		if(confirm("삭제하시겠어요?")){
			//삭제요청을 받는 서버측 기술은 디자인이 요구되지 않으므로, 서블릿으로 처리해도 무방
			//서블릿 방식으로 처리해도 무방하지만 공부 목적으로 이렇게 한다
			//enctype == encoding
			//폼태그 전송 시 개발자가 아무것도 명시하지 않으면, 텍스트 전송을 하게되며, 텍스트 전송에 사용되는 인코딩 타입은
			//applcaton/x-www-form-urlencode 이고, 이 방식은 바이너리 파일은 전송이 불가능하다
			//다라서 개발자가 파일도 함께 전송하려면, form 태그의 전송 인코딩 방식을 multipart/form-data
			$("form").attr({
				"action" :"/gallery/del",
				"method":"post",
			});
			$("form").submit();
		}
	}
	$(function() {
		$($("input[type='button']")[0]).click(function(){
			edit();
		});
		
		$($("input[type='button']")[1]).click(function(){
			del();
		});
		
		$($("input[type='button']")[2]).click(function(){
			location.href="/gallery/list.jsp";
		});
	});
</script>
</head>
<body bgcolor="yellow">
	<form>
	<input type="hidden" value = <%=gallery.getGallery_idx() %> name ="gallery_idx">
		<input type="hidden" value = <%=gallery.getFilename() %> name ="filename">
		<table>
			<tr>
				<td><input type="text" value=<%=gallery.getTitle() %> name="title"></td>
			</tr>
			<tr>
				<td><input type="text" value=<%=gallery.getWriter() %> name="writer"></td>
			</tr>
			<tr>
				<td><textarea type="text" name="content"><%=gallery.getContent() %> </textarea></td>
			</tr>
			<tr>
				<td><img src="/data/<%= gallery.getFilename()%>" width="250"></td>
			</tr>
			<tr>
				<td><input type="file" name="file"></td>
			</tr>
			<tr>
				<td><input type="button" value="수정"> <input type="button" value="삭제"> <input type="button" value="목록"></td>
			</tr>
		</table>
		
	</form>
</body>
</html>