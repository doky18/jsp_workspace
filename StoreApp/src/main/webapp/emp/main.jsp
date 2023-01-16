<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>emp</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>

<!-- Popper JS -->
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	
<script type="text/javascript">

function createOption(deptList) {
	let op="<opton value='0'>선택하세요</option>";
	
	for(let i=0; i<deptList.length; i++){
		let deptList = deptList[i];
		op+="<option value='"+dept.deptno+"'>";
		op+=dept.deptno;
		op+="</option>";
	}
}

//(비동기)셀렉트박스에 부서명 추가하기
function getDeptList() {
    let xhttp = new XMLHttpRequest();//ajax의 비동기 통신 객체
    xhttp.open("GET", "/emp/dept_list.jsp");
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {

            //문자열에 불과한 데이터를, 파싱하여 실제 JSON내장 객체로 변환!!
            console.log(this.responseText);
            let deptList = JSON.parse(this.responseText);
            console.log(deptList);
            console.log("카테고리 수 : ", deptList.length);

            //옵션태그에 반영하기
            createOption(deptList);
        }
    }
    xhttp.send(); // 호스팅 환경인 크롬브라우저 요청 출발!!
}
$(function(){
	$("#bt_search").click(function(){
		regist();
	});
	getDeptList();
});


</script>

</head>
<body>
	<div class="container">
		<div class="row mt-2">
			<div class="col-md-2 border">
				<div class="form-group mt-2">
					<select class="form-control" id="deptno">	</select>
				</div>
				<div class="form-group mt-2">
					<button id="bt_search" type="button "
						class="btn btn-dark form-control">검색</button>
				</div>
			</div>
			<div class="col-md-10 border">
				<div style="overflow: scroll">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>name</th>
								<th>job</th>
								<th>mrg</th>
								<th>hiredate</th>
								<th>sal</th>
								<th>comm</th>
								<th>deptno</th>
							</tr>
						</thead>
						<tbody>
						<% for(int i=1; i<=10; i++){%>
							<tr>
								<td>John</td>
								<td>Doe</td>
								<td>Doe@example.com</td>
								<td>Doe</td>
								<td>Doe</td>
								<td>Doe</td>
								<td>Doe</td>
							</tr>
							<%}%>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>