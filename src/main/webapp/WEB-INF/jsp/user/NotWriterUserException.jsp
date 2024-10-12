<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="cl" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>${ NotWriterUserException }</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="container mt-5">
		<div class="row justify-content-center">
			<div class="col-md-6 text-center">
				<h2 class="fw-bold">해당 사용자의 블로그를 <br> 볼 수 있는 권한이 없습니다.</h2>
				<a href="${ cl }/" class="btn btn-dark mt-3">돌아가기</a>
			</div>
		</div>
	</div>
</body>
</html>
