<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<c:set var="cl" value="${ pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/common/header.jsp" />

	<c:if test="${ empty blogList }">
		<h1>테이블에 저장된 정보가 없음</h1>
	</c:if>
	
	<c:if test="${ not empty blogList }">
	    <div class="container mt-5 mb-5">
	        <div class="row" id="blog-list">
	            <c:forEach var="list" items="${ blogList }">
	                <!-- col-md-6: 화면이 md 이상일 때 2개의 열로 표시 -->
	                <div class="col-md-6 mb-4">
	                    <a href="${ cl }/blog/blogview?blogid=${ list.blogid }"
	                    	class="list-group-item list-group-item-action">
	                        <div class="d-flex w-100 justify-content-between">
	                            <h5 class="mb-1 blogTitle">${ list.title }</h5>
	                            <small>${ list.formattedDateTime }</small>
	                        </div>
	                        <p class="mb-1 blogContent">${ list.blogContent }</p>
	                        <small class="d-flex w-100 justify-content-between">${ list.writer }<span>${ list.blogviews } : 조회수</span></small>
	                    </a>
	                </div>
	            </c:forEach>
	        </div>
	    </div>
	    <nav aria-label="Page" class="d-flex justify-content-center mt-4">
	        <ul class="pagination" id="pagination"></ul>
	    </nav>
	</c:if>

<jsp:include page="/WEB-INF/common/footer.jsp" />