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
	<title>SIGMA</title>
</head>
<body>
	<jsp:include page="${ cl }/WEB-INF/common/header.jsp" />
	
	<div class="max-w-screen-md mx-auto my-20 border">
		<form action="${ cl }/result" method="get" autocomplete="on" class="flex items-center pl-4">
			<button type="submit" style="width: 17px; height: 17px;" class="cursor-pointer">
				<svg width="17" height="17" viewBox="0 0 17 17">
					<path fill-rule="evenodd" d="M13.66 7.36a6.3 6.3 0 1 1-12.598 0 6.3 6.3 0 0 1 12.598 0zm-1.73 
						5.772a7.36 7.36 0 1 1 1.201-1.201l3.636 3.635c.31.31.31.815 0 1.126l-.075.075a.796.796 0 
						0 1-1.126 0l-3.636-3.635z" clip-rule="evenodd" fill="currentColor">
					</path>
				</svg>
			</button>
			<input type="text" id="qey" name="qey" value="${ searchWord }" placeholder="검색어를 입력하세요" required 
				class="w-full cursor-auto text-lg h-12 px-4 py-2 focus:outline-none">
		</form>
	</div>
	
	<script src="https://cdn.tailwindcss.com"></script>
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/showdown/dist/showdown.min.js"></script>
	<script src="${ cl }/resources/js/script.js"></script>
</body>
</html>