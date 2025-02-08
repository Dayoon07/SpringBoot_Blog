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
    <title>${ profileInfo.username }의 프로필</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
    <jsp:include page="${ cl }/WEB-INF/common/header.jsp" />

    <div class="max-w-screen-md mx-auto p-6">
        <div class="flex gap-6">
            <div>
            	<img src="${ profileInfo.profile }" alt="프로필 사진" class="w-32 h-32 rounded-full object-cover border-2 border-gray-300">
            </div>
            <div class="py-4">
                <h2 class="text-2xl font-bold">${ profileInfo.username }</h2>
                <p class="text-gray-600 mt-1">${ profileInfo.bio }</p>
            </div>
        </div>
        <br><hr><br>
        <div class="w-full">
        	<p class="text-md text-gray-500">이메일 : 
				<a href="mailto:${ profileInfo.useremail }" class="hover:underline hover:text-black">${ profileInfo.useremail }</a>
			</p>
			<p class="text-md text-gray-500 py-2">가입일 : ${ profileInfo.dateTime }</p>
        </div>

        <div class="mt-8">
            <h3 class="text-xl font-semibold mb-4">작성한 글</h3>
            <% for (int i = 0; i < 10; i++) { %>
            	<div class="border-b border-gray-200 py-4">
                    <a href="${ cl }/post/view" class="text-blue-600 hover:underline text-lg font-bold">제목</a>
                    <p class="text-gray-700 mt-1">내용</p>
                    <p class="text-sm text-gray-500 mt-1">작성일: 2025-02-09 03:18:23</p>
                </div>
            <% } %>
        </div>
    </div>

    <jsp:include page="${ cl }/WEB-INF/common/footer.jsp" />
</body>
</html>
