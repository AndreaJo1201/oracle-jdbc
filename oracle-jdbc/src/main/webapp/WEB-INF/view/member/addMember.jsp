<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Register</title>
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
	</body>
</html>