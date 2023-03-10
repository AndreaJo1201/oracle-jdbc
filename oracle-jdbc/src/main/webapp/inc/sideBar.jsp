<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="sidebar pe-4 pb-3">
    <nav class="navbar bg-secondary navbar-dark">
        <a href="${pageContext.request.contextPath}/home" class="navbar-brand mx-4 mb-3">
            <h3 class="text-primary"><i class="fa fa-user-edit me-2"></i>Oracle</h3>
        </a>
        <div class="d-flex align-items-center ms-4 mb-4">
            <div class="position-relative">
                <img class="rounded-circle" src="${pageContext.request.contextPath}/img/user.jpg" alt="" style="width: 40px; height: 40px;">
                <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
            </div>
            <div class="ms-3">
                <h6 class="mb-0">${loginMember.memberName}</h6>
            </div>
        </div>
        <div class="navbar-nav w-100">
            <a href="${pageContext.request.contextPath}/home" class="nav-item nav-link"><i class="fa fa-tachometer-alt me-2"></i>Home</a>
            <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-laptop me-2"></i>회원정보</a>
                <div class="dropdown-menu bg-transparent border-0">
               		<a href="${pageContext.request.contextPath}/member/memberOne" class="dropdown-item">기본 정보</a>
                    <a href="${pageContext.request.contextPath}/member/modifyMember" class="dropdown-item">회원정보 수정</a>
                    <a href="${pageContext.request.contextPath}/member/removeMember" class="dropdown-item">회원탈퇴</a>
                </div>
            </div>
			<a href="${pageContext.request.contextPath}/board/boardList" class="nav-item nav-link"><i class="fa fa-table me-2"></i>게시판</a>
            <a href="${pageContext.request.contextPath}/member/logout" class="nav-item nav-link"><i class="fa fa-th me-2"></i>Log Out</a>
        </div>
    </nav>
</div>