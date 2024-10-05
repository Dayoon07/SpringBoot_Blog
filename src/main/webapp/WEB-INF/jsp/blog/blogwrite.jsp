<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<c:set var="cl" value="${ pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/common/header.jsp" />

	<div class="container mt-5">
        <h2 class="mb-4">글 작성하기</h2>
        <form action="/blogWrite" method="post" autocomplete="off">
            <div class="mb-3">
                <label for="writer" class="form-label">제목</label>
                <input type="text" class="form-control" id="writer" name="writer" placeholder="작성자" value="${ loginuser.username }" required readonly>
            </div>
            <div class="mb-3">
                <label for="title" class="form-label">제목</label>
                <input type="text" class="form-control" id="title" name="title" required>
            </div>
            <div class="mb-3">
                <label for="blogcontent" class="form-label">내용</label>
                <textarea class="form-control" id="blogcontent" name="blogcontent" rows="5" style="resize: none;" required></textarea>
            </div>
            <button type="submit" class="btn btn-primary" style="float: right;">글 작성하기</button>
        </form>
    </div><br><br><br>

<jsp:include page="/WEB-INF/common/footer.jsp" />