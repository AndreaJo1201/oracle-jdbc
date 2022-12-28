<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원탈퇴</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<script>
			$(document).ready(function() {
				let allCheck = false;
				$('#submitBtn').click(function() {
					if($('#memberPw').val().length < 1){
						$('#errorMsg').text('비밀번호를 입력해주세요.');
						$('#memberPw').focus();
					} else {
						$('#errorMsg').text('');
						allCheck = true;
					}
						
					if(allCheck) {
						$('#removeMemberForm').submit();
					}
				});
			});
		</script>
	</head>
 
	<body>
		<div>
			<h1>회원탈퇴</h1>
			<form action="${pageContext.request.contextPath}/member/removeMember" method="post" id="removeMemberForm">
				<table border="1">
					<tr>
						<th>ID</th>
						<td><input type="text" name="memberId" id="memberId" readonly="readonly" value="${loginMember.memberId}"></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type="text" name="memberName" id="memberName" readonly="readonly" value="${loginMember.memberName}"></td>
					</tr>
					<tr>
						<th>비밀번호 입력</th>
						<td><input type="password" name="memberPw" id="memberPw"></td>
					</tr>
				</table>
				<span style="color:red;" id="errorMsg"></span>
				<button type="button" name="submitBtn" id="submitBtn">탈퇴하기</button>
			</form>
		</div>
		<div>
			<a href="${pageContext.request.contextPath}/member/memberOne">뒤로 가기</a>
		</div>
	</body>
</html>