<%@ page contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function send() {
    //서버에 폼 전송하기
    form1.action="/movie.do"; 
    form1.method="post";
    form1.submit();
}
</script>
</head>
<body>
        <form name="form1">
            <select name="movie">
                <option value="슬램덩크">슬램덩크</option>
                <option value="아바타2">아바타2</option>
                <option value="앤트맨3">앤트맨3</option>
                <option value="테넷">테넷</option>
            </select>
        </form>
    <p>
    <button type="button" onClick="send()">분석요청</button>
</body>
</html>