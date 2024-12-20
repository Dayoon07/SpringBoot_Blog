<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<c:set var="cl" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>${ NotFoundBlog }</title>
</head>
<body>
	<jsp:include page="/WEB-INF/common/header.jsp" />
	
	<h1 class="text-3xl text-center mt-20 my-32">
		${ NotFoundBlog }
	</h1>
	
	<jsp:include page="/WEB-INF/common/footer.jsp" />
</body>
</html>