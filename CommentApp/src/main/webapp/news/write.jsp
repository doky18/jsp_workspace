<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 등록</title>
<%@ include file="/inc/header_link.jsp"%>
<script type="text/javascript">
	$(function() {
		$($("button")[0]).click(function() {
			$("#form1").attr({
				"action":"/news/regist",
				"method":"post"
			});
			$("#form1").submit();
		});
	});
	
	
</script>
</head>

<body>
	<div class="container mt-2">
		<form id="form1">
			<div class="row text-center">
				<h3>글 등록</h3>
			</div>
			<div class="row mt-2">
				<input type="text" class="form-control" placeholder="제목입력"
					name="title">
			</div>
			<div class="row mt-2">
				<input type="text" class="form-control" placeholder="작성자입력"
					name="writer">
			</div>
			<div class="row mt-2">
				<textarea style="width: 100%" class="form-control" id="content"
					name="content"> </textarea>
			</div>
			<div class="row mt-2">
				<div class="col text-center">
					<button type="button" class="btn btn-outline-info">등록</button>
					<button type="button" class="btn btn-outline-info">목록</button>
				</div>
			</div>
		</form>
	</div>

</body>
</html>