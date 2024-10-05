<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<c:set var="cl" value="${ pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/common/header.jsp" />

	<div class="container mt-5">
        <h2>${noticeView.noticetitle}</h2>
        <p>작성일: ${noticeView.formattedDate}</p><hr>
        <p>${noticeView.noticecontent}</p><hr><br><br>
        <a href="/notice"><button type="button" class="btn btn-dark">목록으로 돌아가기</button></a>
    </div>
	

<jsp:include page="/WEB-INF/common/footer.jsp" />