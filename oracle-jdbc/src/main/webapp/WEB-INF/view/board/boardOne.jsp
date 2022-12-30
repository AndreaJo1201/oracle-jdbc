<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Board One</title>
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
				
				$('#removeBoard').click(function() {
					let removeYorN = confirm('글을 삭제하시겠습니까?');
					if(!removeYorN) {
						event.preventDefault();
					}
				});
			})
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
						<h1 class="mt-4">게시판 상세 정보</h1>
						<div class="container">
							<table class="table table-bordered table-responsive">
								<tr>
									<th class="col-sm-1">제목</th>
									<td class="col-sm-11">${boardOne.boardTitle} </td>
								</tr>
								<tr>
									<th class="col-sm-1">내용</th>
									<td class="col-sm-11">
										<div><textarea rows="20" readonly="readonly" class="bg-secondary text-light" style="border: none; resize:none; width:100%">${boardOne.boardContent}</textarea></div>
									</td>
								</tr>
								<tr>
									<th class="col-sm-1">작성자</th>
									<td class="col-sm-11">${boardOne.memberId }</td>
								</tr>
								<tr>
									<th class="col-sm-1">작성일</th>
									<td class="col-sm-11">${boardOne.createdate }</td>
								</tr>
								<tr>
									<th class="col-sm-1">최종 수정일</th>
									<td class="col-sm-11">${boardOne.updatedate }</td>
								</tr>
							</table>
						</div>
						<div class="p-2 d-flex justify-content-between">
							<div>
								<a href="${pageContext.request.contextPath}/board/boardList" class="btn btn-primary">뒤로 가기</a>
							</div>
							<c:if test="${loginMember.memberId == boardOne.memberId }">
							<div>
								<a href="${pageContext.request.contextPath}/board/modifyBoard?boardNo=${boardOne.boardNo}" class="btn btn-primary mr-1">글 수정</a>
								<a href="${pageContext.request.contextPath}/board/removeBoard?boardNo=${boardOne.boardNo}" id="removeBoard" class="btn btn-primary">글 삭제</a>
							</div>
						</c:if>
						</div>
					</div>
				</div>
				<!-- 
				<table border="1">
					<tr>
						<th>제목</th>
						<td>${boardOne.boardTitle} </td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							<div>${boardOne.boardContent}</div>
						</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>${boardOne.memberId }</td>
					</tr>
					<tr>
						<th>작성일</th>
						<td>${boardOne.createdate }</td>
					</tr>
					<tr>
						<th>최종 수정일</th>
						<td>${boardOne.updatedate }</td>
					</tr>
				</table>
				<c:if test="${loginMember.memberId == boardOne.memberId }">
					<div>
						<a href="${pageContext.request.contextPath}/board/modifyBoard?boardNo=${boardOne.boardNo}">글 수정</a>
						<a href="${pageContext.request.contextPath}/board/removeBoard?boardNo=${boardOne.boardNo}" id="removeBoard">글 삭제</a>
					</div>
				</c:if>
				<div>
					<a href="${pageContext.request.contextPath}/board/boardList">뒤로 가기</a>
				</div>
				 -->
				<!-- main end -->
				
				<jsp:include page="/inc/footer.jsp"></jsp:include>
	        </div>
	        <!-- content end -->
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