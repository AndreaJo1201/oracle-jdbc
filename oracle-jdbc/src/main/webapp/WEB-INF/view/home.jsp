<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>HOME</title>
	</head>

	<body>
		<c:if test="${loginMember == null }">
			<h1>Home(로그인 전)</h1>
			<div>
				<a href="${pageContext.request.contextPath}/member/login">로그인</a>
				<a href="${pageContext.request.contextPath}/member/addMember">회원가입</a>
			</div>
		</c:if>
		
		<c:if test="${loginMember != null }">
			<h1>Home(로그인 후)</h1>
			<div>
				<a href="${pageContext.request.contextPath}/member/memberOne">회원정보</a>
				<a href="${pageContext.request.contextPath}/board/boardList">게시판</a>
				<a href="${pageContext.request.contextPath}/member/logout">로그아웃</a>
			</div>
		</c:if>
	</body>
</html>