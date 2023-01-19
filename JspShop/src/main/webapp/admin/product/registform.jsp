<%@page import="com.jspshop.domain.Admin"%>
<%@page import="com.jspshop.repository.AdminDAO"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<% 
	String[] sizeList={"XS", "S", "M", "L", "XL","XXL"};
	String[] colorList={"베이지", "네이비", "브라운", "블랙", "아이보리"};
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>AdminLTE 3 | Dashboard</title>
<jsp:include page="/admin/inc/header_link.jsp"></jsp:include>  


</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">

  <!-- Preloader -->
  <jsp:include page="/admin/inc/preloader.jsp"></jsp:include>

  <!-- Navbar -->
  <jsp:include page="/admin/inc/navbar.jsp"></jsp:include>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <jsp:include page="/admin/inc/sidebar_left.jsp"></jsp:include>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">Dashboard</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Dashboard v1</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
	
    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="col">
        <form id="form1">
     	   <!-- -------------------------------------------옵션을 선택하세요------------------------------------------------------------- -->
            <div class="form-group">
            	<select class="form-control" id="category"></select>
            </div>
            <!-- -------------------------------------------내용을 입력하세요------------------------------------------------------------- -->
        	<div class="form-group">
            	<input type="text" class="form-control" placeholder="상품명" id="product_name">
            </div>
            
        	<div class="form-group">
            	<input type="text" class="form-control" placeholder="브랜드" id="brand">
            </div>
            
        	<div class="form-group">
            	<input type="number" class="form-control" placeholder="가격" id="price">
            </div>
            
        	<div class="form-group">
            	<input type="number" class="form-control" placeholder="할인가" id="discount">
            </div>
            <!-- -------------------------------------------------Choose Size------------------------------------------------------- -->
           <div class="form-group clearfix">
            <%for(int i=0; i<sizeList.length; i++){ %>
               <div class="icheck d-inline">
                 <input type="checkbox" id="checkbox<%=i%>" name="size" value="<%=sizeList[i]%>">
                 <label for="customCheckbox<%=i%>"><%=sizeList[i] %></label>
               </div>
             <%} %>
             </div>
             <!-- --------------------------------------------------Choose Color----------------------------------------------------- -->
             <div class="form-group clearfix">
                        <%for(int i=0;i<colorList.length;i++){ %>
                      <div class="icheck d-inline">
                        <input type="checkbox" id="color<%=i %>" name="size" value="<%=colorList[i] %>">
                        <label for="checkboxPrimary<%=i %>"><%=colorList[i] %></label>
                      </div>
                  <%} %>
             </div>
             <!-- -------------------------------------------내용을 입력하세요------------------------------------------------------------- -->
           <div class="form-group">
            	<textarea id="detail" class="form-control" placeholder="내용"></textarea>
            </div>
             <!-- -------------------------------------------파일을 선택하세요------------------------------------------------------------- -->
            <div class="form-group">
            <div class="custom-file">
            	<input type="file" class="custom-file-input" multiple id="file"/>
            	 </div>
            	 <span class="btn btn-success col-12 fileinput-button" onClick="triggerFile()">
            	 <i class="fas fa-plus"></i>
            	 <span>파일을 추가해주세요 </span>
            	 </span>
            </div>
            
            <div class="row form-group" id="preview"></div>
            <!-- -------------------------------------------버튼을 선택하세요------------------------------------------------------------- -->
            <div class="form-group">
            	<button type="button" class="btn btn-dark" id="bt_regist">등록</button>
            </div>
            <!-- -------------------------------------------파일을 선택하세요------------------------------------------------------------- -->
           </form>
        </div>
     
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  
  <jsp:include page="/admin/inc/footer.jsp"></jsp:include>
  
  <!-- Control Sidebar -->
  <jsp:include page="/admin/inc/sidebar_right.jsp"></jsp:include>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<jsp:include page="/admin/inc/footer_link.jsp"></jsp:include>
<script type="text/babel">
	function ImageBox(props){
		return(
			<div className={"col-sm-2 border"}>
				<div>
					<a href="#" onClick={(e)=>removeImg(e, props.index)}>X</a>
				</div>
				<img src={props.src} width="100px"/>	
			</div>
	
		);

	}
</script>
<script type="text/javascript">

function triggerFile(){
	//파일컴포넌트를 대상으로 클릭 효과를 낸다 (간접적으로 효과를 낸다 )
	$("#file").trigger("click");
}

function regist(){
	//이미지 미리보기 기능은 단순히 우리만의 배열 처리였을 뿐
	//input type ="file" 컴포넌트는 여전히 유저가 선택한 이미지 정보를 그대로 유지하고 있다
	//따라서 기존의 폼을 그대로 전송하면 안되고, 개발자가 폼에 들어갈 파일을 직접 제어해야 한다
	//이 방법을 jquery가 지원해준다
	
	let formData = new FormData();
	console.log("전송하기 위한 폼에 넣을 파일의 수는 ",fileList.length);
	
	//파일뿐만 아니라 파라미터등을 심을 수 있다
	formData.append("category_idx", $("#category").val);
	formData.append("product_name", $("#product_name").val);
	formData.append("brand", $("#brand").val);
	formData.append("price", $("#price").val);
	formData.append("discount", $("#discount").val);
	
	for(let i=0; i<fileList.length;i++){
		let file = fileList[i];
		formData.append("file", file );		//파일뿐만 아니라 파라미터등을 심을 수 있다
	}	
	
	//비동기방식으로 formData를 전송하자!
	//					ㄴapplication/x-www....이렇게 가면 안되니까 type 밑에 추가해줌
	//	processData:false -> title=dd&writer
	$.ajax({
		url:"/admin/product/regist.jsp",
		type:"post",
		processData:false,		//쿼리 스트링화 방지 
		contentType:false,		//applicatoin/x-www 방지
		data:formData,			//파라미터로 넘겨 받음
		success:function(result, status, xhr){
			alert("상품등록이 되었습니다");
		}
	});
	
}

</script>

<script type="text/babel">
	let tag=[];		// <ImageBox/>	UI 컴포넌트를 누적할 배열 
	let previewRoot;	//리액트에 의해 렌더링 될 컨테이너 요소 
	let fileList=[];		//파일정보를 가진 배열
	let oriFiles;		//원래 유저가 선택한 파일배열 원본


	function removeImg(e, index){
		//시각적인 삭제 처리
		$(e.target).parent().parent().remove(); //target : 이벤트를 일으킨 엘리먼트
		//원본 배열에서 해당 파일을 추출
		let file=oriFiles[index];
	
		//추출한 파일이 삭제대상의 배열에서 몇번째 살고 있는지 index를 조사한다.
		//배열에서 삭제
		let sel_index=fileList.indexOf(file);
		fileList.splice(sel_index, 1);

		//this.files로 인해 선택한 그림이 몇개인지 알 수 있음. 이걸 일단 배열로 한번 담았는데... 
		//누군가가 삭제하고 싶은 이미지를 선택하면, 이미지가 원본의 몇번째 인덱스에 있는지 배열에서 먼저 추출하고
		//그 인덱스를 통해서 삭제를 한 것 
}

		

	function createCategoryOption(result){
		let op = "<option value='0'>상품선택</option>";
		
		for(let i=0; i<result.length; i++){
			let category = result[i]	;		//카테고리 하나 꺼내기 
			op+="<option value=' "+category.category_idx+" '>"+category.category_name+"</option>";
		}
		$("#category").html(op);
	}

	function getCategoryList(){
		$.ajax({
			url:"/admin/category/category_list.jsp",
			type:"get",
			success : function(result, status, xhr) {
				//console.log("result= ", result);
				//옵션 채우기
				createCategoryOption(result);
			}
		});
	}

	//사용자가 선택한 파일들을 매개변수로 받자 
	function previewImg() {	//3개
		tag=[];
		
		for(let i=0; i<fileList.length; i++){
		let reader = new FileReader();
		reader.onload=function(e){	//파일이 읽혀지면...
			//e에는 읽은 파일에 대한 정보가 들어있다...
			tag.push(<ImageBox key={i}  src={e.target.result} index={i}/>);

		 //렌더링
			if( i >= fileList.length-1){		//마지막 이미지에 도달하면...그때 렌더링 되게
				previewRoot.render(tag);
			}
			//$("#preview").html("<img src='"+e.target.result+"' width='100px'>");
		};
		reader.readAsDataURL(fileList[i]);		//()에는 읽을 대상 파일이 와야함
		}
	}
	
	$(function(){
		previewRoot = ReactDOM.createRoot(document.getElementById("preview"));		//()에는 컨테이너가 오면 된다
		getCategoryList();
		
		 $("#detail").summernote({
			 height:200
		 });

			$("#bt_regist").click(function(){
			regist();
		});
		 
		 $("#file").change(function(){
			 this.files;	//파일 컴포넌트에서 선택한 파일의 보유한 배열 
			 				//이 배열은 read only(읽기 전용!!!!!)
			//유저가 선택한 파일에 대한 정보를 배열로 얻기
			oriFiles=this.files;

			 console.log("당신이 선택한 파일 수는 ", this.files.length);
			//fileList=this.files;		//전역변수로 빼둠
			//this.files는 이미 자바스크립트의 파일 배열로서 읽기만 가능하다
			//따라서 수정가능한 배열이 되려면, this.files 안에 있는 File들을 꺼내서 일반 배열로 옮겨버리면 된다
			for(let i=0; i<this.files.length; i++){
			fileList.push(this.files[i])	;		
			}
			 previewImg();
		 });
	});

</script>
</body>
</html>
