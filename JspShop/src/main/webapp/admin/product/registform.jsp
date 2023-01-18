<%@page import="com.jspshop.domain.Admin"%>
<%@page import="com.jspshop.repository.AdminDAO"%>
<%@ page contentType="text/html;charset=UTF-8" %>

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
            <div class="form-group">
            	<select class="form-control">
            		<option value="0">카테고리 선택</option>
            	</select>
            	
            </div>
        	<div class="form-group">
            	<input type="text" class="form-control" placeholder="상품명">
            </div>
        	<div class="form-group">
            	<input type="email" class="form-control" placeholder="브랜드">
            </div>
        	<div class="form-group">
            	<input type="number" class="form-control" placeholder="가격">
            </div>
        	<div class="form-group">
            	<input type="number" class="form-control" placeholder="할인가">
            </div>
           <div class="form-group">
            	<textarea id="detail" class="form-control" placeholder="내용"></textarea>
            </div>
            <div class="form-group">
            	<input type="file" class="form-control" placeholder="">
            </div>
            <div class="form-group">
            	<input type="file" class="form-control" placeholder="">
            </div>
            <div class="form-group">
            	<input type="file" class="form-control" placeholder="">
            </div>
            <div class="form-group">
            	<input type="file" class="form-control" placeholder="">
            </div>
            <div class="form-group">
            	<input type="file" class="form-control" placeholder="">
            </div>
            <div class="form-group">
            	<button type="button" class="btn btn-dark">등록</button>
            </div>
            
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

<script type="text/javascript">
	$(function(){
		 $("#detail").summernote({
			 height:200
		 });
	});

</script>
</body>
</html>
