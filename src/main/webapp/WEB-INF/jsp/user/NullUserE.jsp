<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<c:set var="cl" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>${ NullUserException }</title>
	<link rel="stylesheet" href="/css/bootstrap.5.3.min.css">
</head>
<body>
	<div class="container mt-5">
		<div class="row justify-content-center">
			<div class="col-md-6 text-center">
				<h2 class="fw-bold">요청에 해당하는 <br> 사용자 정보가 없습니다</h2>
				<a href="${ cl }/">
					<button type="button" class="btn btn-dark mt-3">돌아가기</button>
				</a>
			</div>
		</div>
	</div>
</body>
</html>