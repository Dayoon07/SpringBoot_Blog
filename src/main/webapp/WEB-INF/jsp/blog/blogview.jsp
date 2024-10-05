<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<c:set var="cl" value="${ pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/common/header.jsp" />

 	<div class="container mt-5">
		<h2 class="card-title mb-3">${ blogNum.title }</h2>
		<h6 class="card-subtitle mb-2 text-muted">
        	<span class="float-end">${ blogNum.formattedDateTime }</span><br>
            작성자: ${ blogNum.writer }
		</h6>
        <p class="card-text mt-4">${ blogNum.blogContent }</p>
        <div class="mt-3 mb-5">
        	<!-- <h6>첨부파일:</h6>
            <a href="${ board.fileUrl }" download>${ board.fileName }</a> -->
		</div><hr>
        <div class="card border-0">
			<h5 class="card-title m-0">댓글 OO개</h5>
                
            <form action="/addComment" method="post" class="mt-4">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
				    	<button type="submit" class="btn btn-dark rounded-0">댓글 달기</button>
				  	</div>
				 	<input type="text" id="ytd-btn">
				</div>
			</form>

                <!-- 댓글 리스트 -->
                <!-- <ul class="list-group list-group-flush">
                    <c:forEach var="comment" items="${ board.comments }">
                        <li class="list-group-item">
                            <strong>${ comment.writer }</strong> <span class="text-muted">${ comment.formattedDateTime }</span>
                            <p class="mt-2">${ comment.content }</p>
                        </li>
                    </c:forEach>
                </ul> -->                
		</div>

        <!-- 뒤로 가기 버튼 -->
        <div class="mt-4">
            <a href="${ cl }/blog" class="btn btn-dark">목록으로 바로가기</a>
        </div>
    </div>

<jsp:include page="/WEB-INF/common/footer.jsp" />