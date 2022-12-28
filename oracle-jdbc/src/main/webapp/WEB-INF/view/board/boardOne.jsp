<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Board One</title>
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
	</body>
</html>