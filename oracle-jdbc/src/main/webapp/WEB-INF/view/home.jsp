<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>HOME</title>
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
	                            <h3>HOME</h3>
	                        </div>
                       		<c:if test="${loginMember == null }">
								<div>
									<a href="${pageContext.request.contextPath}/member/login" class="btn btn-primary py-3 w-100 mb-4">로그인</a>
									<a href="${pageContext.request.contextPath}/member/addMember" class="btn btn-primary py-3 w-100 mb-4"">회원가입</a>
								</div>
							</c:if>
							
							<c:if test="${loginMember != null }">
								<div>
									<a href="${pageContext.request.contextPath}/member/memberOne" class="btn btn-primary py-3 w-100 mb-4">회원정보</a>
									<a href="${pageContext.request.contextPath}/board/boardList" class="btn btn-primary py-3 w-100 mb-4">게시판</a>
									<a href="${pageContext.request.contextPath}/member/logout" class="btn btn-primary py-3 w-100 mb-4">로그아웃</a>
								</div>
							</c:if>
						</div>
	                </div>
	            </div>
	        </div>
	        <!-- Sign Up End -->
	    </div>
		<!-- 
		<c:if test="${loginMember == null }">
			<h1>Home(로그인 전)</h1>
			<div>
				<a href="${pageContext.request.contextPath}/member/login">로그인</a>
				<a href="${pageContext.request.contextPath}/member/addMember">회원가입</a>
			</div>
		</c:if>
		
		<c:if test="${loginMember != null }">
			<h1>Home(로그인 후)</h1>
			<div>
				<a href="${pageContext.request.contextPath}/member/memberOne">회원정보</a>
				<a href="${pageContext.request.contextPath}/board/boardList">게시판</a>
				<a href="${pageContext.request.contextPath}/member/logout">로그아웃</a>
			</div>
		</c:if>
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