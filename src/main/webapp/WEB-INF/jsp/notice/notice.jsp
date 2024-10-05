<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<c:set var="cl" value="${ pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/common/header.jsp" />
	
	<section class="container mt-5 my-5">
	    <h2>공지사항</h2>
	    <p class="mb-5">개선 또는 서비스 점검, 새 소식을 알려 드립니다.</p>
	    <div class="card">
	        <div class="list-group list-group-flush" id="noticeList">
	            <c:if test="${ not empty noticeList }">
	                <c:forEach var="nl" items="${ noticeList }">
	                    <div class="list-group-item blog-item" data-noticeid="${ nl.noticeid }">
	                        <a href="${ cl }/notice/view?noticeid=${ nl.noticeid }">
	                            ${ nl.noticetitle } <span style="float: right;">${ nl.formattedDate }</span>
	                        </a>
	                    </div>
	                </c:forEach>
	            </c:if>
	            <c:if test="${ empty noticeList }">
	                <div class="list-group-item">공지사항이 없습니다.</div>
	            </c:if>
	        </div>
	    </div>
	
	    <!-- Pagination Controls -->
	    <nav aria-label="Page navigation">
	        <ul class="pagination justify-content-center mt-4" id="noticePagination">
	            <!-- Pagination buttons will be generated here by JavaScript -->
	        </ul>
	    </nav>
	</section>

<jsp:include page="/WEB-INF/common/footer.jsp" />