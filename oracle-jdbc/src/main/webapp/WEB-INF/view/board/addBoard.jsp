<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>ADD BOARD</title>
		<meta content="width=device-width, initial-scale=1.0" name="viewport">
	    <meta content="" name="keywords">
	    <meta content="" name="description">
	    
        <!-- Google Web Fonts -->
	    <link rel="preconnect" href="https://fonts.googleapis.com">
	    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="">
	    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Roboto:wght@500;700&display=swap" rel="stylesheet"> 
	    
	    <!-- Icon Font Stylesheet -->
	    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
	    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
	
	    <!-- Libraries Stylesheet -->
	    <link href="${pageContext.request.contextPath}/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
	    <link href="${pageContext.request.contextPath}/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />
	
	    <!-- Customized Bootstrap Stylesheet -->
	    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
	
	    <!-- Template Stylesheet -->
	    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
	    
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<script>
			$(document).ready(function() {
				let check = false;
				$('#submitBtn').click(function() {
					if($('#boardTitle').val().length < 1) {
						$('#errorMsg').text('제목을 입력하세요.');
						$('#boardTitle').focus();
					} else if($('#boardContent').val().length < 1) {
						$('#errorMsg').text('내용을 입력하세요.');
						$('#boardContent').focus();
					} else {
						$('#errorMsg').text('');
						check = true;
					}
					
					if(check) {
						$('#addBoardForm').submit();
					}
				});
			});
		</script>
	</head>

	<body>
		<div class="container-fluid position-relative d-flex p-0">
	        <!-- Spinner Start -->
	        <div id="spinner" class="show bg-dark position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
	            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
	                <span class="sr-only">Loading...</span>
	            </div>
	        </div>
	        <!-- Spinner End -->
	        
	        <!-- Side Bar Start -->
	        <jsp:include page="/inc/sideBar.jsp"></jsp:include>
	        <!-- Side Bar End -->
	        <!-- content start -->
	        <div class="content">
				<jsp:include page="/inc/navBar.jsp"></jsp:include>
				
				<!-- main start -->
				<div class="container-fluid pt-4 px-4">
					<div class="row bg-secondary h-100 rounded mx-0">
						<h1 class="mt-4">새 글 작성</h1>
						<form action="${pageContext.request.contextPath }/board/addBoard" method="post" id="addBoardForm">
							<table class="table table-bordered table-responsive">
								<tr>
									<th class="col-sm-1">제목</th>
									<td class="col-sm-11"><input type="text" name="boardTitle" id="boardTitle" class="bg-secondary text-light" style="border:none; width:100%"></td>
								</tr>
								<tr>
									<th class="col-sm-1">내용</th>
									<td class="col-sm-11"><textarea rows="30" name="boardContent" id="boardContent" class="bg-secondary text-light" style="border:none; resize:none; width:100%"></textarea></td>
								</tr>
							</table>
							<span id="errorMsg" style="color:red;"></span>
						</form>
						<div class="d-flex justify-content-between mb-4">
							<a href="${pageContext.request.contextPath}/board/boardList" class="btn btn-primary">뒤로 가기</a>
							<button type="button" id="submitBtn" class="btn btn-primary">작성하기</button>
						</div>
					</div>
				</div>
		<!-- 
		<h1>새 글 작성</h1>
		<form action="" method="post" id="addBoardForm">
			<table border="1">
				<tr>
					<th>제목</th>
					<td><input type="text" name="boardTitle" id="boardTitle"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea cols="100" rows="30" name="boardContent" id="boardContent"></textarea></td>
				</tr>
			</table>
			<button type="button" id="submitBtn">작성하기</button>
			<span id="errorMsg" style="color:red;"></span>
		</form>
		<div>
			<a href="${pageContext.request.contextPath}/board/boardList">뒤로 가기</a>
		</div>
		 -->
		 				<!-- main end -->
				
				<jsp:include page="/inc/footer.jsp"></jsp:include>
	        </div>
	        <!-- content end -->
	        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
		</div>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
		<script src="${pageContext.request.contextPath}/lib/chart/chart.min.js"></script>
		<script src="${pageContext.request.contextPath}/lib/easing/easing.min.js"></script>
		<script src="${pageContext.request.contextPath}/lib/waypoints/waypoints.min.js"></script>
		<script src="${pageContext.request.contextPath}/lib/owlcarousel/owl.carousel.min.js"></script>
		<script src="${pageContext.request.contextPath}/lib/tempusdominus/js/moment.min.js"></script>
		<script src="${pageContext.request.contextPath}/lib/tempusdominus/js/moment-timezone.min.js"></script>
		<script src="${pageContext.request.contextPath}/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>
		
		<!-- Template Javascript -->
		<script src="${pageContext.request.contextPath}/js/main.js"></script>
	</body>
</html>