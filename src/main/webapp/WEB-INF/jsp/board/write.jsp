<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<c:set var="cl" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>글 작성</title>
</head>
<body>
	<jsp:include page="/WEB-INF/common/header.jsp" />
	
	<div style="width: 600px;" class="p-5 m-5 mx-auto">
		<div class="mx-auto flex justify-center items-center">
			<h1 class="text-3xl">Vlog</h1>
		</div><br><br>
		<form action="${ cl }/createPost" method="post" autocomplete="off">
			<div class="space-y-6">
				<div class="flex justify-between items-center">
					<div>
						<label class="text-gray-800 text-md mb-2 block">카테고리</label>
						<select class="text-gray-800 bg-white border border-gray-300 text-md px-4 py-3 rounded-none outline-blue-500" 
							name="category" id="category" style="width: 200px;">
							<option value="general">일반</option>
							<option value="tech">기술</option>
							<option value="life">라이프스타일</option>
						</select>
					</div>
					<div>
						<label class="text-gray-800 text-md mb-2 block">작성자</label>
						<input type="text" name="writer" id="writer" value="${ sessionScope.userSession.username }"
							class="text-gray-800 bg-white border border-gray-300 text-md px-4 py-3 rounded-md outline-blue-500"
							required readonly style="width: 350px;" />
					</div>
				</div>
				<div>
					<label class="text-gray-800 text-md mb-2 block">제목</label>
					<input type="text" name="title" id="title" placeholder="글 제목을 입력하세요"
						class="text-gray-800 bg-white border border-gray-300 w-full text-md px-4 py-3 rounded-md outline-blue-500"
						required />
				</div>
				<div>
					<label class="text-gray-800 text-md mb-2 block">내용</label>
					<textarea class="text-gray-800 bg-white border border-gray-300 w-full text-md px-4 py-3 rounded-md outline-blue-500 resize-none"
						rows="8" name="content" id="content" placeholder="글 내용을 입력하세요" required></textarea>
				</div>
			</div>
			<div class="!mt-12">
				<button type="submit" class="w-full px-4 py-2 text-md rounded-sm font-bold border-2 text-[#007bff] border-[#007bff] bg-[#007bff] 
          			transition-all ease-in-out duration-300 bg-transparent hover:bg-[#007bff] hover:text-white">
					글 작성
				</button>
			</div>
		</form>
	</div>
	
	<jsp:include page="/WEB-INF/common/footer.jsp" />
</body>
</html>