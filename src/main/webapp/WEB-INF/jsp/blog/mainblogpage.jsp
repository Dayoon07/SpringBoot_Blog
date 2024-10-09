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
	                <div class="col-md-6 mb-3 list-group">
	                	<a href="${ cl }/blog/blogview?blogid=${ list.blogid }" class="list-group-item list-group-item-action">
				    		<div class="w-100 d-flex justify-content-between py-2">
				      			<h5 class="mb-1 blogTitle">${ list.title }</h5>
				      			<small class="text-body-secondary">${ list.formattedDateTime }</small>
				    		</div>
				    		<p class="mb-1 blogContent">${ list.blogContent }</p>
				    		<small class="text-body-secondary w-100 d-flex justify-content-between">
				    			<span>${ list.writer }</span>
	                            <span>${ list.blogviews } : 조회수</span>
				    		</small>
				  		</a>
	                </div>
	            </c:forEach>
	        </div>
	    </div>
	    <nav aria-label="Page" class="d-flex justify-content-center mt-4">
	        <ul class="pagination" id="pagination">
	            <!-- Pagination content will go here -->
	        </ul>
	    </nav>
	</c:if>

<jsp:include page="/WEB-INF/common/footer.jsp" />