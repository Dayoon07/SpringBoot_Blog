<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDateTime" %>
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

	<div class="bg-white rounded-xl p-8 max-w-md w-full mx-auto">
		<h2 class="text-2xl font-bold text-center text-gray-800 mb-6">로그인</h2>
		<form action="${ cl }/login" method="post" autocomplete="off" class="space-y-4">
			<div>
				<label for="username" class="block text-gray-700 font-semibold mb-1">이름</label>
				<input type="text" id="username" name="username" required class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-black" />
			</div>

			<div>
				<label for="userpassword" class="block text-gray-700 font-semibold mb-1">비밀번호</label>
				<input type="password" id="userpassword" name="userpassword" required class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-black" />
			</div>

			<div>
				<button type="submit" class="w-full bg-black text-white py-2 rounded-lg hover:opacity-70 transition duration-300">로그인</button>
			</div>
		</form>
	</div>

	<jsp:include page="${ cl }/WEB-INF/common/footer.jsp" />
</body>
</html>