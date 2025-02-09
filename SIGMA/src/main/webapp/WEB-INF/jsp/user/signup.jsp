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
		<h2 class="text-2xl font-bold text-center text-gray-800 mb-6">회원가입</h2>
		<form action="${ cl }/signupF" method="post" autocomplete="off" enctype="multipart/form-data" class="space-y-4">
			<div>
				<label for="profile" class="block text-gray-700 font-semibold mb-1">프로필 사진</label>
				<input type="file" id="profile" name="profile" accept="image/*" required class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-black cursor-pointer" />
			</div>
		
			<div>
				<label for="username" class="block text-gray-700 font-semibold mb-1">이름</label>
				<input type="text" id="username" name="username" required class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-black" />
				<div id="username-feedback" class="mt-1"></div>
			</div>

			<div>
				<label for="useremail" class="block text-gray-700 font-semibold mb-1">이메일</label>
				<input type="email" id="useremail" name="useremail" required class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-black" />
			</div>

			<div>
				<label for="userpassword" class="block text-gray-700 font-semibold mb-1">비밀번호</label>
				<input type="text" id="userpassword" name="userpassword" required class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-black" />
			</div>

			<div class="hidden">
				<label for="dateTime" class="block text-gray-700 font-semibold mb-1">가입일</label>
				<input type="text" id="dateTime" name="dateTime" value="<%= LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd a HH:mm:ss")) %>" 
					required class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-black" />
			</div>

			<div>
				<label for="bio" class="block text-gray-700 font-semibold mb-1">소개말</label>
				<textarea id="bio" name="bio" rows="4" class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-black resize-none"></textarea>
			</div>

			<button type="submit" class="w-full bg-black text-white py-2 rounded-lg hover:opacity-70 transition duration-300">회원가입</button>
		</form>
	</div>

	<jsp:include page="${ cl }/WEB-INF/common/footer.jsp" />
	<script src="${ cl }/resources/js/chkName.js"></script>
	<script>
		const profile = document.getElementById("profile");
		const list = ["mov", "mp4", "wmv", "avi", "mkv", "webm", "html5"];
		
		profile.add
		
	</script>
</body>
</html>