<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<c:set var="cl" value="${ pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/common/header.jsp" />

 	<div class="container mt-5">
		<c:if test="${ blogNum.writer == sessionScope.loginuser.username }">
		    <form action="${ cl }/myblogViewUpdate" method="post" autocomplete="off">
		    	<div class="d-flex flex-row mb-3">
		    		<button type="submit" class="btn btn-outline-primary px-3">수정하기</button>
			    </div>
			    <div class="input-group input-group-lg">
				  	<input type="text" id="title" name="title" value="${ blogNum.title }" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg">
				</div>
				<h6 class="card-subtitle mb-2 text-muted">
					<a href="${ cl }/username/${ blogNum.writer }">작성자: ${ blogNum.writer }</a><br>
					<span>작성일 : ${ blogNum.formattedDateTime }</span>
				</h6>
				<div class="mb-3">
				  	<textarea class="form-control" id="blogContent" name="blogContent" rows="3">${ blogNum.blogContent }</textarea>
				</div>
		        <div class="mt-3 mb-5">
		        	<!-- <h6>첨부파일:</h6>
		            <a href="${ board.fileUrl }" download>${ board.fileName }</a> -->
				</div>
		    </form>
		    <div class="mt-4 mb-4">
	            <a href="${ cl }/blog" class="btn btn-dark" style="float: right;">목록으로 바로가기</a>
	        </div><br>
		</c:if>
		<c:if test="${ blogNum.writer != sessionScope.loginuser.username  }">
			<h2 class="card-title mb-3">${ blogNum.title }</h2>
			<h6 class="card-subtitle mb-2 text-muted">
				<a href="${ cl }/username/${ blogNum.writer }">작성자: ${ blogNum.writer }</a><br>
				<span>작성일 : ${ blogNum.formattedDateTime }</span>
			</h6>
	        <p class="card-text mt-4">${ blogNum.blogContent }</p>
	        <div class="mt-3 mb-5">
	        	<!-- <h6>첨부파일:</h6>
	            <a href="${ board.fileUrl }" download>${ board.fileName }</a> -->
			</div>
			<div class="mt-4 mb-4">
	            <a href="${ cl }/blog" class="btn btn-dark" style="float: right;">목록으로 바로가기</a>
	        </div><br>
		</c:if>
        <div class="card border-0">
			<h5 class="card-title m-0">댓글 OO개</h5>
                
            <form action="/addComment" method="post" class="mt-4">
				<div class="input-group mb-3">
					<button type="submit" class="btn btn-dark">댓글작성</button>
				  	<input type="text" class="form-control" id="notFocus" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
				</div>
			</form>             
		</div>
    </div>

<jsp:include page="/WEB-INF/common/footer.jsp" />