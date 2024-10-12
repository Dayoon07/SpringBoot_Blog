<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<c:set var="cl" value="${ pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/common/header.jsp" />

	<section class="container mt-5">
	    <h2 class="text-center">회원가입</h2>
	    <form action="${ cl }/signup" method="post" class="w-50 mx-auto mt-4">
	        <div class="mb-4">
	            <label for="username" class="form-label">사용자이름</label>
	            <input type="text" id="username" name="username" class="form-control" placeholder="사용자이름" required>
	        </div>
	        <div class="mb-4">
	            <label for="useremail" class="form-label">이메일</label>
	            <input type="email" id="useremail" name="useremail" class="form-control" placeholder="이메일" required>
	        </div>
	        <div class="mb-4">
	            <label for="userpassword" class="form-label">비밀번호</label>
	            <input type="password" id="userpassword" name="userpassword" class="form-control" placeholder="비밀번호" required>
	        </div>
	        <div class="mb-4">
	            <label for="profiletext" class="form-label">자기소개 (선택)</label>
	            <textarea id="profiletext" name="profiletext" class="form-control" placeholder="프로필 소개 글"></textarea>
	        </div>
	        <button type="submit" class="btn btn-outline-primary w-100">가입하기</button>
	        <a href="${ cl }/" class="btn btn-outline-dark w-100 my-2">돌아가기</a>
	        <p class="mt-3 text-center">이미 계정이 있습니까? <a href="${ cl }/signin">로그인</a></p>
	    </form>
	</section>

<jsp:include page="/WEB-INF/common/footer.jsp" />