<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 등록</title>
<%@ include file ="/inc/header_link.jsp"%>
<script type="text/javascript">
function regist(){
	$("#form1").attr({
		"action":"/board/regist",
		"method":"post",
		//application/x-www-form-urlencoded 이게 디폴트
		"enctype":"multipart/form-data"
	});
	$("#form1").submit();
}


$(function(){
    ClassicEditor
    .create( document.querySelector( '#content' ) )
    .catch( error => {
        console.error( error );
    });
    //https://ckeditor.com/docs/ckeditor5/latest/installation/getting-started/quick-start.html 여기서 가져왔음

//버틍에 이벤트 연결
	$($("button")[0]).click(function(){
		regist();
	});
	
	$($("button")[1]).click(function(){
		alert("목록보기");
	});
	
});

</script>
</head>
<body>

	<div class="container mt-2">
		<form id="form1">
			<div class="row text-center">
				<h3> 글 등록</h3>
			</div>
			<div class="row mt-2">
				<input type="text" class="form-control" placeholder="제목입력" name="title">
			</div>
			<div class="row mt-2">
				<input type="text" class="form-control" placeholder="작성자입력" name="writer">
			</div>
			<div class="row mt-2">
				<textarea style= "width:100%" class="form-control" id="content" name="content"> </textarea>
			</div>
			<div class="row mt-2">
				<input type="file" class="form-control"  name="file">
			</div>
			<div class="row mt-2">
				<div class="col text-center">
					<button type ="button" class ="btn btn-warning"> 수정 </button>
					<button type ="button" class ="btn btn-warning"> 삭제 </button>
				</div>
		</div>
		</form>
	</div>

</body>
</html>