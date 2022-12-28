<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원정보</title>
	</head>

	<body>
		<h1>회원정보</h1>
		<div>
			<h1>${loginMember.memberName}님 반갑습니다.</h1>
		</div>
		<div>
			<a href="${pageContext.request.contextPath}/member/modifyMember">회원정보 수정</a>
			<a href="${pageContext.request.contextPath}/member/removeMember">회원탈퇴</a>
		</div>
		<div>
			<a href="${pageContext.request.contextPath}/home">뒤로 가기</a>
		</div>
	</body>
</html>