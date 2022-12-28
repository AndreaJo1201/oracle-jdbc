<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원정보 수정</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<script>
			$(document).ready(function() {
				let allCheck = false;
				$('#submitBtn').click(function() {
					if($('#afterName').val().length < 1) {
						$('#errorMsg').text('변경할 이름을 입력해주세요.');
						$('#afterName').focus();
					} else if($('#memberPw').val().length < 1){
						$('#errorMsg').text('비밀번호 입력해주세요.');
						$('#memberPw').focus();
					} else {
						$('#errorMsg').text('');
						allCheck = true;
					}
						
					if(allCheck) {
						$('#modifyMemberForm').submit();
					}
				});
			});
		</script>
	</head>
 
	<body>
		<div>
			<h1>회원정보 수정(이름)</h1>
			<form action="${pageContext.request.contextPath}/member/modifyMember" method="post" id="modifyMemberForm">
				<table border="1">
					<tr>
						<th>ID</th>
						<td><input type="text" name="memberId" id="memberId" readonly="readonly" value="${loginMember.memberId}"></td>
					</tr>
					<tr>
						<th>현재 이름</th>
						<td><input type="text" name="beforeName" id="beforeName" readonly="readonly" value="${loginMember.memberName}"></td>
					</tr>
					<tr>
						<th>변경할 이름</th>
						<td><input type="text" name="afterName" id="afterName"></td>
					</tr>
					<tr>
						<th>비밀번호 입력</th>
						<td><input type="password" name="memberPw" id="memberPw"></td>
					</tr>
				</table>
				<span style="color:red;" id="errorMsg"></span>
				<button type="button" name="submitBtn" id="submitBtn">수정하기</button>
			</form>
		</div>
		<div>
			<a href="${pageContext.request.contextPath}/member/memberOne">뒤로 가기</a>
		</div>
	</body>
</html>