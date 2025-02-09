<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
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
	<title>${ boardInfo.title } - SIGMA</title>
</head>
<body>
	<jsp:include page="${ cl }/WEB-INF/common/header.jsp" />
	
	<div class="max-w-screen-md mx-auto py-8 px-4">
	    <h1 class="text-4xl font-bold mb-2 text-gray-900">${ boardInfo.title }</h1>
	
	    <div class="flex items-center text-md text-gray-500 mb-4">
	        <span class="mr-2 font-medium">
				<a href="${ cl }/blog/${ boardInfo.writer }">${ boardInfo.writer }</a>
			</span>
	        <span class="mx-1">&#8226; &nbsp;</span>
	        <span>${ boardInfo.dateTime }</span>
	    </div>
	
	    <c:if test="${ not empty boardInfo.img }">
	        <div class="w-full mb-6">
	            <img src="${ boardInfo.img }" class="w-full h-auto border shadow-xl">
	        </div>
	    </c:if>
	    <c:if test="${ not empty boardInfo.video }">
	    	<div class="w-full mb-6">
	    		<video controls autoplay preload="auto" class="w-full h-full">
			  		<source src="${ boardInfo.video }" type="video/${ boardInfo.video.substring(boardInfo.video.lastIndexOf('.') + 1) }">
				</video>
	        </div>
	    </c:if>
	
	    <div id="content" class="w-full"></div> 
	    
	    <div class="w-full mt-10 flex justify-between">
	    	<div>
	    		<a href="${ cl }/blog/${ writerInfo.username }">
	    			<img src="${ writerInfo.profile }" class="w-32 h-32 rounded-full object-cover">
	    		</a>
	    	</div>
	    	<div class="py-2 w-4/5">
	    		<h1 class="text-2xl mb-2">
					<a href="${ cl }/${ writerInfo.username }">${ writerInfo.username }</a>
				</h1>
	    		<p>${ writerInfo.bio }</p>
	    	</div>
	    </div>
	    <br><hr><br>
	    <!-- 댓글 작성 폼 -->
	    <c:if test="${ not empty sessionScope.user }">
	    	<div class="w-full mb-6">
		        <h2 class="text-2xl font-semibold mb-4">댓글 작성</h2>
		        <form action="${ cl }/addComment" method="post" class="flex justify-between">
		            <textarea name="commentContent" placeholder="댓글을 입력하세요..." 
		            	class="w-4/5 p-3 h-12 border focus:ring-2 focus:ring-black focus:outline-none resize-none overflow-y-hidden"></textarea>
		            <button type="submit" class="w-32 bg-black text-white px-4 py-2 hover:opacity-70">댓글 작성</button>
		        	<input type="hidden" name="commenterId" value="${ sessionScope.user.memberId }">
		        	<input type="hidden" name="" value="${ sessionScope.user.memberId }">
		        	<input type="hidden" name="commenterProfile" value="${ sessionScope.user.profile }">
		        	<input type="hidden" name="blogWriterId" value="${ boardInfo.writerId }">
		        	<input type="hidden" name="dateTime" value="<%= LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")) %>">
		        	<input type="hidden" name="blogId" value="${ boardInfo.blogId }">
		        	<input type="hidden" name="commenterName" value="${ sessionScope.user.username }">
		        </form>
		    </div>
	    </c:if>
	    <c:if test="${ empty sessionScope.user }">
	    	<div class="w-full mb-6">
		        <h2 class="text-xl font-semibold mb-4 text-gray-500">댓글 작성은 로그인 후 사용할 수 있습니다</h2>
		    </div>
	    </c:if>
	
	    <div class="w-full">
	        <h2 class="text-2xl font-semibold mb-4">댓글 ${ commentList.size() }개</h2>
	        <c:if test="${ not empty commentList }">
	        	<c:forEach var="commentList" items="${ commentList }">
		        	<div class="p-4">
			            <div class="flex items-center text-sm text-gray-500 mb-2">
			                <span class="font-medium mr-2">${ commentList.commenterName }</span>
			                <span class="mx-1">&#8226; &nbsp;</span>
			                <span>${ commentList.dateTime }</span>
			            </div>
			            <p class="text-gray-800">${ commentList.commentContent }</p>
			        </div>
		        </c:forEach>
	        </c:if>
	    </div>
	</div>
	
	<div id="mdContent" class="hidden">${ boardInfo.content }</div>
	
	<jsp:include page="${ cl }/WEB-INF/common/footer.jsp" />
	<script src="${ cl }/resources/js/boardMdEncode.js"></script>
	
</body>
</html>