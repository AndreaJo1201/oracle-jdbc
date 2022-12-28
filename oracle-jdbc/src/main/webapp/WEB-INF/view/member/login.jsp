<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>LogIn</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<script>
			$(document).ready(function() {
				$('#submitBtn').click(function() {
					let allCheck = false;
					if($('#memberId').val().length < 1) {
						$('#errorMsg').text('ID를 입력하세요.');
						console.log('아이디미입력');
						$('#memberId').focus();
					} else if($('#memberPw').val().length < 1) {
						$('#errorMsg').text('PassWord를 입력하세요.');
						console.log('비밀번호미입력');
						$('#memberPw').focus();
					} else {
						$('#errorMsg').text('');
						allCheck = true;
						console.log('전송');
					}
					
					if(allCheck) {
						$('#logInForm').submit();
					}
				});
			});
		</script>
	</head>
 
	<body>
		<div>
			<h1>LOG IN</h1>
			<form action="${pageContext.request.contextPath}/member/login" method="post" id="logInForm">
				<table border="1">
					<tr>
						<th>ID</th>
						<td><input type="text" name="memberId" id="memberId"></td>
					</tr>
					<tr>
						<th>PassWord</th>
						<td><input type="password" name="memberPw" id="memberPw"></td>
					</tr>
				</table>
				<span style="color:red;" id="errorMsg"></span>
				<button type="button" name="submitBtn" id="submitBtn">LOG IN</button>
			</form>
			<a href="${pageContext.request.contextPath}/home">뒤로 가기</a>
		</div>
	</body>
</html>