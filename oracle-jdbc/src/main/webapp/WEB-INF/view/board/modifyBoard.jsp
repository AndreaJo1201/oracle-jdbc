<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>MODIFY BOARD</title>
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
						$('#modifyBoardForm').submit();
					}
				});
			});
		</script>
	</head>

	<body>
		<h1>글 수정</h1>
			<table border="1">
				<tr>
					<th colspan="2">기존 내용</th>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" readonly="readonly" value="${modifyBoard.boardTitle}"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea cols="100" rows="30" readonly="readonly">${modifyBoard.boardContent}</textarea></td>
				</tr>
			</table>
		<form action="${pageContext.request.contextPath}/board/modifyBoard" method="post" id="modifyBoardForm">
			<table border="1">
				<tr>
					<th colspan="2">수정 내용</th>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="boardTitle" id="boardTitle"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea cols="100" rows="30" name="boardContent" id="boardContent"></textarea></td>
				</tr>
			</table>
			<input type="hidden" value="${modifyBoard.boardNo}" name="boardNo">
			<button type="button" id="submitBtn">작성하기</button>
			<div>
				<span id="errorMsg" style="color:red;"></span>
			</div>
		</form>
		<div>
			<a href="${pageContext.request.contextPath}/board/boardOne?boardNo=${modifyBoard.boardNo}">뒤로 가기</a>
		</div>
	</body>
</html>