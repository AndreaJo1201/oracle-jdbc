<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>회원정보</title>
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
	        
	        <!-- Side Bar Start -->
	        <jsp:include page="/inc/sideBar.jsp"></jsp:include>
	        <!-- Side Bar End -->
	        
	        <!-- content start -->
	        <div class="content">
	        	<jsp:include page="/inc/navBar.jsp"></jsp:include>
	        	<!-- Blank Start -->
				<div class="container-fluid pt-4 px-4">
					<div class="row vh-100 bg-secondary rounded mx-0">
						<div class="col-md-6 mt-2">
							<h3 class="mb-4">기본 정보</h3>
                            <form>
                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">ID</label>
                                    <input type="text" class="form-control" aria-describedby="emailHelp" value="${loginMember.memberId}" readonly="readonly">
                                </div>
								<div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">Name</label>
                                    <input type="text" class="form-control" aria-describedby="emailHelp" value="${loginMember.memberName}" readonly="readonly">
                                </div>
                                <div>
	                                <a href="${pageContext.request.contextPath}/member/modifyMember" class="btn btn-primary">회원정보 수정</a>
	                                <a href="${pageContext.request.contextPath}/member/removeMember" class="btn btn-primary">회원탈퇴</a>
                                </div>
                            </form>
						</div>
					</div>
				</div>
            	<!-- Blank End -->
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
	
	
		<!-- 
		<h1>회원정보</h1>
		<div>
			<h1>${loginMember.memberName}님 반갑습니다.</h1>
		</div>
		<div>
			<a href="${pageContext.request.contextPath}/member/modifyMember">회원정보 수정</a>
			<a href="${pageContext.request.contextPath}/member/removeMember">회원탈퇴</a>
		</div>
		<div>
			<a href="${pageContext.request.contextPath}/home">뒤로 가기</a>
		</div>
		 -->
	</body>
</html>