<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>BOARD LIST</title>
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
				$('#rowPerPage').change(function() {
					$('#pageForm').submit();
				});
			});
		</script>
	</head>
	<!-- 주소수정필요 -->
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
	        <div class="content">
				<jsp:include page="/inc/navBar.jsp"></jsp:include>
				<div class="container-fluid pt-4 px-4 ">
					<div class="row bg-secondary h-100 rounded mx-0">
						<h1 class="mt-4">BOARD LIST</h1>
						<div class="container">
							<form method="get" action="${pageContext.request.contextPath}/board/boardList" id="pageForm" class="text-end">
								<select name="rowPerPage" id="rowPerPage">
									<c:if test="${rowPerPage == 10}">
										<option value="10" selected="selected">10개씩 보기</option>
										<option value="20">20개씩 보기</option>
										<option value="30">30개씩 보기</option>
									</c:if>
									<c:if test="${rowPerPage == 20}"> 
										<option value="10">10개씩 보기</option>
										<option value="20" selected="selected">20개씩 보기</option>
										<option value="30">30개씩 보기</option>
									</c:if>
									<c:if test="${rowPerPage == 30}">
										<option value="10">10개씩 보기</option>
										<option value="20">20개씩 보기</option>
										<option value="30" selected="selected">30개씩 보기</option>
									</c:if>
								</select>
							</form>
							<br>
							<table class="table table-hover table-bordered text-center col-12">
								<thead>
									<tr>
										<th class="col-1">boardNo</th>
										<th class="col-7">boardTitle</th>
										<th class="col-4">createDate</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="b" items="${boardList }">
										<tr>
											<td class="col-1">${b.boardNo}</td>
											<td class="col-7"><a href="${pageContext.request.contextPath}/board/boardOne?boardNo=${b.boardNo}">${b.boardTitle}</a></td>
											<td class="col-4">${b.createdate }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="text-center p-2">
							<ul class="pagination justify-content-center">
								<li class="page-item">
									<a href="${pageContext.request.contextPath}/board/boardList?rowPerPage=${rowPerPage}&currentPage=1" class="page-link">처음</a>
								</li>
								<c:if test="${currentPage > 1}">
									<li class="page-item">
										<a href="${pageContext.request.contextPath}/board/boardList?rowPerPage=${rowPerPage}&currentPage=${currentPage-1}" class="page-link">이전</a>
									</li>
								</c:if>
								<c:if test="${endPage <= lastPage}">
									<c:forEach var="i" begin="${beginPage}" end="${endPage}" step="1">
										<c:if test="${currentPage == i}">
											<li class="page-item active">
												<a href="${pageContext.request.contextPath}/board/boardList?rowPerPage=${rowPerPage}&currentPage=${i}" class="page-link">${i}</a>
											</li>
										</c:if>
										<c:if test="${currentPage != i}">
											<li class="page-item">
												<a href="${pageContext.request.contextPath}/board/boardList?rowPerPage=${rowPerPage}&currentPage=${i}" class="page-link">${i}</a>
											</li>
										</c:if>
									</c:forEach>
								</c:if>
								<c:if test="${endPage > lastPage}">
									<c:forEach var="i" begin="${beginPage}" end="${lastPage}" step="1">
										<c:if test="${currentPage == i}">
											<li class="page-item active">
												<a href="${pageContext.request.contextPath}/board/boardList?rowPerPage=${rowPerPage}&currentPage=${i}" class="page-link">${i}</a>
											</li>
										</c:if>
										<c:if test="${currentPage != i}">
											<li class="page-item">
												<a href="${pageContext.request.contextPath}/board/boardList?rowPerPage=${rowPerPage}&currentPage=${i}" class="page-link">${i}</a>
											</li>
										</c:if>
									</c:forEach>
								</c:if>
								<c:if test="${currentPage < lastPage}">
									<li class="page-item">
										<a href="${pageContext.request.contextPath}/board/boardList?rowPerPage=${rowPerPage}&currentPage=${currentPage+1}" class="page-link">다음</a>
									</li>
								</c:if>
								<li class="page-item">
									<a href="${pageContext.request.contextPath}/board/boardList?rowPerPage=${rowPerPage}&currentPage=${lastPage}" class="page-link">마지막</a>	
								</li>
							</ul>
						</div>
						<div class="p-2 d-flex justify-content-end">
							<a href="${pageContext.request.contextPath}/board/addBoard" class="btn btn-primary">새 글 작성</a>
						</div>
					</div>
				</div>
				<!--
				<h1>BOARD LIST</h1>
				<form method="get" action="${pageContext.request.contextPath}/board/boardList" id="pageForm">
					<select name="rowPerPage" id="rowPerPage">
						<c:if test="${rowPerPage == 10}">
							<option value="10" selected="selected">10개씩 보기</option>
							<option value="20">20개씩 보기</option>
							<option value="30">30개씩 보기</option>
						</c:if>
						<c:if test="${rowPerPage == 20}"> 
							<option value="10">10개씩 보기</option>
							<option value="20" selected="selected">20개씩 보기</option>
							<option value="30">30개씩 보기</option>
						</c:if>
						<c:if test="${rowPerPage == 30}">
							<option value="10">10개씩 보기</option>
							<option value="20">20개씩 보기</option>
							<option value="30" selected="selected">30개씩 보기</option>
						</c:if>
					</select>
				</form>
				<table border="1">
					<tr>
						<th>boardNo</th>
						<th>boardTitle</th>
						<th>createDate</th>
					</tr>
					<c:forEach var="b" items="${boardList }">
						<tr>
							<td>${b.boardNo}</td>
							<td><a href="${pageContext.request.contextPath}/board/boardOne?boardNo=${b.boardNo}">${b.boardTitle}</a></td>
							<td>${b.createdate }</td>
						</tr>
					</c:forEach>
				</table>
				<div>
					<a href="${pageContext.request.contextPath}/board/boardList?rowPerPage=${rowPerPage}&currentPage=${currentPage-1}">이전</a>
					<a href="${pageContext.request.contextPath}/board/boardList?rowPerPage=${rowPerPage}&currentPage=${currentPage+1}">다음</a>
				</div>
				<div>
					<a href="${pageContext.request.contextPath}/board/addBoard">새 글 작성</a>
				</div>
				<div>
					<a href="${pageContext.request.contextPath}/home">뒤로 가기</a>
				</div>
				-->
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