<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<c:set var="cl" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="${ cl }/resources/css/custom.css">
	<title>SIGMA</title>
</head>
<body>
	<jsp:include page="${ cl }/WEB-INF/common/header.jsp" />
	
	<h1 class="text-3xl text-center mt-10">${ success } <br>3초 후 메인 페이지로 돌아갑니다</h1>
	
	<script>
		setTimeout(() => {
			location.href = "${ cl }/";
		}, 3000);
	</script>
	
	<script src="https://cdn.tailwindcss.com"></script>
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/showdown/dist/showdown.min.js"></script>
	<script src="${ cl }/resources/js/script.js"></script>
</body>
</html>