<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Register</title>
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
				let allCheck = false;
				$('#submitBtn').click(function() {
					if($('#memberId').val().length < 1) {
						$('#errorMsg').text('ID를 입력하세요.');
						$('#memberId').focus();
					} else if($('#memberPw').val().length < 1) {
						$('#errorMsg').text('PassWord를 입력하세요.');
						$('#memberPw').focus();
					} else if($('#memberName').val().length < 1) {
						$('#errorMsg').text('Name을 입력하세요.');
						$('#memberName').focus();
					} else {
						$('#errorMsg').text('');
						allCheck = true;
					}
					
					if(allCheck) {
						$('#registerForm').submit();
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
	
	
	        <!-- Sign Up Start -->
	        <div class="container-fluid">
	            <div class="row h-100 align-items-center justify-content-center" style="min-height: 100vh;">
	                <div class="col-12 col-sm-8 col-md-6 col-lg-5 col-xl-4">
	                    <div class="bg-secondary rounded p-4 p-sm-5 my-4 mx-3">
	                        <div class="d-flex align-items-center justify-content-between mb-3">
	                            <a href="${pageContext.request.contextPath}/home" class="">
	                                <h3 class="text-primary"><i class="fa fa-user-edit me-2"></i>ORACLE</h3>
	                            </a>
	                            <h3>Sign Up</h3>
	                        </div>
	                        <form action="${pageContext.request.contextPath}/member/addMember" method="post" id="registerForm">
								<div class="form-floating mb-3">
		                            <input type="text" class="form-control" id="memberId" name="memberId" placeholder="name@example.com">
									<label for="floatingInput">ID</label>
		                        </div>
		                         <div class="form-floating mb-4">
		                            <input type="password" class="form-control" id="memberPw" name="memberPw" placeholder="Password">
		                            <label for="floatingPassword">Password</label>
		                        </div>
		                        <div class="form-floating mb-4">
		                            <input type="text" class="form-control" id="memberName" name="memberName" placeholder="jhondoe">
		                            <label for="floatingText">UserName</label>
		                        </div>
		                        <button type="button" class="btn btn-primary py-3 w-100 mb-4" id="submitBtn">Sign Up</button>
		                        <div>
		                        	<span style="color:red;" id="errorMsg"></span>
		                        </div>
	                        </form>
	                        <p class="text-center mb-0">Already have an Account? <a href="${pageContext.request.contextPath}/member/login">LOG IN</a></p>
	                    </div>
	                </div>
	            </div>
	        </div>
	        <!-- Sign Up End -->
	    </div>
		<!--
		<div>
			<h1>Register</h1>
			<form action="${pageContext.request.contextPath}/member/addMember" method="post" id="registerForm">
				<table border="1">
					<tr>
						<th>ID</th>
						<td><input type="text" name="memberId" id="memberId"></td>
					</tr>
					<tr>
						<th>PassWord</th>
						<td><input type="password" name="memberPw" id="memberPw"></td>
					</tr>
					<tr>
						<th>Name</th>
						<td><input type="text" name="memberName" id="memberName"></td>
					</tr>
				</table>
				<span style="color:red;" id="errorMsg"></span>
				<button type="button" name="submitBtn" id="submitBtn">가입하기</button>
			</form>
			<a href="${pageContext.request.contextPath}/home">뒤로 가기</a>
		</div>
		-->
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