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
	<title>${ boardInfo.title }</title>
</head>
<body>
	<jsp:include page="${ cl }/WEB-INF/common/header.jsp" />
	
	<div class="max-w-screen-md mx-auto py-8 px-4">
	    <h1 class="text-4xl font-bold mb-2 text-gray-900">${ boardInfo.title }</h1>
	
	    <div class="flex items-center text-md text-gray-500 mb-4">
	        <span class="mr-2 font-medium">
				<a href="${ cl }/profile/${ boardInfo.writer }">${ boardInfo.writer }</a>
			</span>
	        <span class="mx-1">&#8226; &nbsp;</span>
	        <span>${ boardInfo.dateTime }</span>
	    </div>
	
	    <c:if test="${ not empty boardInfo.img }">
	        <div class="w-full mb-6">
	            <img src="${ boardInfo.img }" class="w-full h-auto border shadow-xl">
	        </div>
	    </c:if>
	
	    <div class="prose prose-lg max-w-none text-gray-800 leading-relaxed">
	        ${ boardInfo.content }
	    </div>
	    
	    <div class="w-full mt-10 flex justify-between">
	    	<div>
	    		<img src="${ writerInfo.profile }" class="w-32 h-32 rounded-full object-cover">
	    	</div>
	    	<div class="py-2 w-3/5">
	    		<h1 class="text-2xl mb-2">${ writerInfo.username }</h1>
	    		<p>${ writerInfo.bio }</p>
	    	</div>
	    	<div class="py-2">
	    		<button class="px-6 py-2 rounded-full bg-black text-white">팔로우</button>
	    	</div>
	    </div>
	    <br><hr><br>
	    <!-- 댓글 작성 폼 -->
	    <c:if test="${ not empty sessionScope.user }">
	    	<div class="w-full mb-6">
		        <h2 class="text-2xl font-semibold mb-4">댓글 작성</h2>
		        <form action="${ cl }/addComment" method="post" class="flex justify-between">
		            <textarea name="commentContent" placeholder="댓글을 입력하세요..." 
		            	class="w-4/5 p-3 h-12 border focus:ring-2 focus:ring-black focus:outline-none resize-none"></textarea>
		            <button type="submit" cla	ss="w-32 bg-black text-white px-4 py-2 hover:opacity-70">댓글 작성</button>
		        </form>
		    </div>
	    </c:if>
	    <c:if test="${ empty sessionScope.user }">
	    	<div class="w-full mb-6">
		        <h2 class="text-xl font-semibold mb-4 text-gray-500">댓글 작성은 로그인 후 사용할 수 있습니다</h2>
		    </div>
	    </c:if>
	
	    <!-- 댓글 리스트 -->
	    <div class="w-full">
	        <h2 class="text-2xl font-semibold mb-4">댓글 몇개</h2>
	
	        <!-- 댓글 1 -->
	        <div class="p-4">
	            <div class="flex items-center text-sm text-gray-500 mb-2">
	                <span class="font-medium mr-2">사용자1</span>
	                <span class="mx-1">&#8226; &nbsp;</span>
	                <span>2025-02-09 12:34</span>
	            </div>
	            <p class="text-gray-800">이 게시글 정말 유익하네요! 잘 읽었습니다.</p>
	        </div>
	
	        <!-- 댓글 2 -->
	        <div class="p-4">
	            <div class="flex items-center text-sm text-gray-500 mb-2">
	                <span class="font-medium mr-2">사용자2</span>
	                <span class="mx-1">&#8226; &nbsp;</span>
	                <span>2025-02-09 13:20</span>
	            </div>
	            <p class="text-gray-800">좋은 정보 감사합니다. 궁금한 점이 있는데 답변 부탁드려요!</p>
	        </div>
	    </div>
	</div>
	
	<jsp:include page="${ cl }/WEB-INF/common/footer.jsp" />
</body>
</html>