<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<c:set var="cl" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>일치하는 회원님의 정보가 없습니다.</title>
</head>
<body>

	<h1>일치하는 회원님의 정보가 없습니다.</h1>
	<a href="${ cl }/" class="p-5 bg-black rounded-md">돌아가기</a>	
	
</body>
</html>