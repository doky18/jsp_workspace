<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="gallery.domain.Gallery"%>
<%@ page import="member.domain.Member" %>
<%
Member member = (Member)session.getAttribute("member");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갤러리 등록</title>
<!-- w3schools jQuery CDN 가져오기 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<script type="text/javascript">

//이미지 미리보기 
function preview(file){		//매개변수로 유저가 선택한 파일정보가 넘어옴
	console.log("넘겨받은 파일정보", file);

	//자바스크립트로 파일에 대한 스트림 객체가 지원된다
	let reader = new FileReader();
	
	//파일이 모두 로드되면...
	reader.onload=function(e){
		console.log("로드 정보", e);		
		$("#pic").attr("src", e.target.result); //src에 대입하면 된다
		$("#pic").show();
	}
	reader.readAsDataURL(file);	//파일 읽기
	
}

function regist(){
    //서버에 바이너리 파일을 보낸다
    $("form").attr({
        "action" : "/gallery/upload.jsp",
        "method" : "post",
        "enctype" : "multipart/form-data" //폼 양식에 바이너리 파일이 포함된 경우 반드시 지정해주기
    });
    $("form").submit();
}

$(function(){
	$("#pic").hide();

	
	//파일컴포넌트의 값을 유저가 변경하면
	$("input[name='file']").on("change",function(e){
		//console.log("파일정보",this.files);
		
		preview(this.files[0]);		//미리보기 구현.....
	});

    $($("input[type='button']")[0]).click(function(){
        regist();
    })
});

</script>
</head>
<body>
<form>
    <table>
        <tr>
            <td><input type="text" placeholder="제목 입력" name="title"></td>
        </tr>
        <tr>
            <td>
           		<%if(member==null){%>
                    <input type="text" placeholder="작성자입력" name="writer">
                <%}else{%>
                    <input type="text" value="<%=member.getName()%>" name="writer">
                <%}%>
            </td>
        </tr>
        <tr>
            <td><textarea type="text" placeholder="내용 입력" name="content"></textarea></td>
        </tr>
        <tr>
            <td><input type="file" name="file"></td>
        </tr>
        <tr>
            <td><img src="#" width="150px" id="pic" style="display:none"></td>
        </tr>
        <tr>
            <td>
            <input type="button" value="등록">
            <input type="button" value="목록">
            </td>
        </tr>
    </table>
    </form>
</body>
</html>