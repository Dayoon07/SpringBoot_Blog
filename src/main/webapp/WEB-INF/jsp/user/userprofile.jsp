<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<c:set var="cl" value="${ pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/common/header.jsp" />

	<div class="container mt-5">
        <h2>회원 정보</h2>
        
        <c:if test="${ not empty loginuser }">
        	<form action="/refreshUser" method="post" autocomplete="off">
	            <div class="mb-3">
	                <label for="username" class="form-label">아이디</label>
	                <input type="text" class="form-control" id="username" name="username" value="${userinfo.userId}" readonly required>
	            </div>
	            <div class="mb-3">
	                <label for="fullName" class="form-label">이름</label>
	                <input type="text" class="form-control" id="fullName" name="fullName" value="${userinfo.username}" required>
	            </div>
	            <div class="mb-3">
	                <label for="email" class="form-label">이메일</label>
	                <input type="email" class="form-control" id="email" name="email" value="${userinfo.useremail}" readonly required>
	            </div>
	            <div class="mb-3">
	                <label for="email" class="form-label">비밀번호</label>
	                <input type="email" class="form-control" id="email" name="email" value="${userinfo.userpassword}" required>
	            </div>
	            <div class="mb-3">
	                <label for="email" class="form-label">텍스트</label>
	                <input type="email" class="form-control" id="email" name="email" value="${userinfo.profiletext}" required>
	            </div>
	            <div class="mb-3">
	                <label for="joinDate" class="form-label">가입일 (Join Date)</label>
	                <input type="text" class="form-control" id="joinDate" name="joinDate" value="${userinfo.formattedDateTime}" readonly required>
	            </div>
				<div class="mb-3">
	                <label for="joinDate" class="form-label">팔로워 수</label>
	                <input type="text" class="form-control" id="joinDate" name="joinDate" value="${userinfo.followerId}" required required>
	            </div>
	            <div class="mb-3">
	                <label for="joinDate" class="form-label">팔로잉</label>
	                <input type="text" class="form-control" id="joinDate" name="joinDate" value="${userinfo.followedId}" required required>
	            </div>
	        </form>
        </c:if>
        <c:if test="${ empty loginuser }">
        	<form>
	            <div class="mb-3">
	                <label for="username" class="form-label">아이디</label>
	                <input type="text" class="form-control" id="username" name="username" value="${userinfo.userId}" readonly>
	            </div>
	            <div class="mb-3">
	                <label for="fullName" class="form-label">이름</label>
	                <input type="text" class="form-control" id="fullName" name="fullName" value="${userinfo.username}" readonly>
	            </div>
	            <div class="mb-3">
	                <label for="email" class="form-label">이메일</label>
	                <input type="email" class="form-control" id="email" name="email" value="${userinfo.useremail}" readonly>
	            </div>
	            <div class="mb-3">
	                <label for="email" class="form-label">비밀번호</label>
	                <input type="email" class="form-control" id="email" name="email" value="${userinfo.userpassword}" readonly>
	            </div>
	            <div class="mb-3">
	                <label for="email" class="form-label">텍스트</label>
	                <input type="email" class="form-control" id="email" name="email" value="${userinfo.profiletext}" readonly>
	            </div>
	            <div class="mb-3">
	                <label for="joinDate" class="form-label">가입일 (Join Date)</label>
	                <input type="text" class="form-control" id="joinDate" name="joinDate" value="${userinfo.formattedDateTime}" readonly>
	            </div>
				<div class="mb-3">
	                <label for="joinDate" class="form-label">팔로워 수</label>
	                <input type="text" class="form-control" id="joinDate" name="joinDate" value="${userinfo.followerId}" readonly>
	            </div>
	            <div class="mb-3">
	                <label for="joinDate" class="form-label">팔로잉</label>
	                <input type="text" class="form-control" id="joinDate" name="joinDate" value="${userinfo.followedId}" readonly>
	            </div>
	        </form>
        </c:if>
    </div>

<jsp:include page="/WEB-INF/common/footer.jsp" />