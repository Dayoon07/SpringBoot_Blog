<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<c:set var="cl" value="${ pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/common/header.jsp" />

	<section class="container mt-5">
	    <h2 class="text-center">로그인</h2>
	    <form action="/signin" method="post" class="w-50 mx-auto mt-4">
	        <div class="form-group">
	            <label for="useremail">이메일</label>
	            <input type="email" id="useremail" name="useremail" class="form-control" placeholder="이메일" required>
	        </div>
	        <div class="form-group">
	            <label for="userpassword">비밀번호</label>
	            <input type="password" id="userpassword" name="userpassword" class="form-control" placeholder="비밀번호" required>
	        </div>
	        <button type="submit" class="btn btn-outline-primary btn-block">로그인</button>
	        <p class="mt-3 text-center">계정이 없습니까? <a href="${ cl }/signup">회원가입</a></p>
	    </form>
	</section>

<jsp:include page="/WEB-INF/common/footer.jsp" />