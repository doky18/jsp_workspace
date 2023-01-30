<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function send() {
		form1.action="/board/regist.do";		//web.xml에 do라고 해둬서 이렇게 끝나야 함
		form1.submit();
	}
</script>
</head>
<body>
	<form name="form1">
		<pre>
			<input type="text" placeholder="제목"><br>
			<input type="text" placeholder="작성자"><br>
			<input type="text" placeholder="내용"><br>
			<input type="button" value="등록" onClick="send()"/>
		</pre>
	</form>
</body>
</html>

