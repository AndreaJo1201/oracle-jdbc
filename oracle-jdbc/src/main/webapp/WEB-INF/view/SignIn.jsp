<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>SignIn</title>
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
						$('#signInForm').submit();
					}
				});
			});
			
			$(document).ready(function() {
				if(${loginFalse}) {
					alert('가입한 회원이 아니거나 비밀번호가 틀렸습니다.');
				};
			});
		</script>
	</head>
 
	<body>
		<div>
			<h1>SignIn</h1>
			<form action="${pageContext.request.contextPath}/SignInActionController" method="post" id="signInForm">
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
				<button type="button" name="submitBtn" id="submitBtn">SIGN IN</button>
			</form>
		</div>
		<div>
			<a href="${pageContext.request.contextPath}/RegisterFormController">Register</a>
		</div>
	</body>
</html>