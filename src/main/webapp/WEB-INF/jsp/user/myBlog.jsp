<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<c:set var="cl" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/common/header.jsp" />

	<c:if test="${ not empty selectByUserBlog }">
		<div class="container mt-5 mb-5">
			<div class="row" id="blog-list">
		    	<c:forEach var="list" items="${ selectByUserBlog }">
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
	</c:if>
	<c:if test="${ empty selectByUserBlog }">
		<h3 class="text-center">작성한 글이 없습니다.</h3>
	</c:if>
	
<jsp:include page="/WEB-INF/common/footer.jsp" />
