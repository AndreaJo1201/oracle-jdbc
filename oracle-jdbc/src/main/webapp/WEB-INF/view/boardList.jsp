<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<script>
			$(document).ready(function() {
				$('#rowPerPage').change(function() {
					$('#pageForm').submit();
				});
			});
		</script>
	</head>
 
	<body>
		<h1>BOARD LIST</h1>
		<form method="get" action="${pageContext.request.contextPath}/BoardListController" id="pageForm">
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
					<td><a href="${pageContext.request.contextPath}/BoardOneController?boardNo=${b.boardNo}">${b.boardTitle}</a></td>
					<td>${b.createdate }</td>
				</tr>
			</c:forEach>
		</table>
		<div>
			<a href="${pageContext.request.contextPath}/BoardListController?rowPerPage=${rowPerPage}&currentPage=${currentPage-1}">이전</a>
			<a href="${pageContext.request.contextPath}/BoardListController?rowPerPage=${rowPerPage}&currentPage=${currentPage+1}">다음</a>
		</div>
		<c:if test="${loginMember==null}">
			<div>
				<a href="${pageContext.request.contextPath}/SignInFormController">SIGN IN</a>
			</div>
		</c:if>
		<c:if test="${loginMember!=null}">
			<div>
				<a href="${pageContext.request.contextPath}/SignOutController">SIGN OUT</a>
			</div>
		</c:if>
	</body>
</html>