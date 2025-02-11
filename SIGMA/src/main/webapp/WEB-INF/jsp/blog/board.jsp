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
    <link rel="stylesheet" href="${ cl }/resources/css/custom.css">
    <link rel="stylesheet" href="${ cl }/resources/css/board.css">
	<title>${ boardInfo.title } - SIGMA</title>
</head>
<body>
	<jsp:include page="${ cl }/WEB-INF/common/header.jsp" />
	
	<c:if test="${ boardInfo.writerId eq sessionScope.user.memberId }">
		<div class="max-w-screen-md mx-auto mt-4 flex justify-end space-x-4">
  			<form action="${ cl }/blog/${ sessionScope.user.username }/board/edit" method="post">
    			<input type="hidden" name="blogId" value="${ boardInfo.blogId }">
    			<button type="submit" class="px-6 py-2 bg-blue-500 text-white rounded shadow-md hover:bg-blue-600 transition duration-200">
      				수정
    			</button>
  			</form>
  			<form action="${ cl }/blog/${ sessionScope.user.username }/board/delete" method="post" onsubmit="return confirm('정말 삭제하시겠습니까?');">
    			<input type="hidden" name="blogId" value="${ boardInfo.blogId }">
    			<button type="submit" class="px-6 py-2 bg-red-500 text-white rounded shadow-md hover:bg-red-600 transition duration-200">
      				삭제
    			</button>
  			</form>
		</div>
	</c:if>
	
	<div class="max-w-screen-md mx-auto py-8 px-4">
	    <h1 class="block max-w-full break-words text-4xl font-bold mb-2 text-gray-900">
		    ${ boardInfo.title }
		</h1>
	
	    <div class="md:flex md:justify-between md:items-center">
	    	<div class="flex items-center text-md text-gray-500 mb-4">
		        <span class="mr-2 font-medium">
					<a href="${ cl }/blog/${ boardInfo.writer }">${ boardInfo.writer }</a>
				</span>
		        <span class="mx-1">&#8226; &nbsp;</span>
		        <span>${ boardInfo.dateTime }</span>
		    </div>
		    <div class="flex items-center text-md text-gray-500 mb-4">
		        <span>조회수: ${ boardInfo.views }&nbsp;</span>
		        <span class="mx-1">&#8226; &nbsp;</span>
		        <span>좋아요: ${ boardInfo.likes }&nbsp;</span>
		        <span class="mx-1">&#8226; &nbsp;</span>
		        <span>댓글: ${ boardInfo.commentCount }</span>
		    </div>
	    </div>
	    
	    <div class="md:flex md:justify-between md:items-center mb-4">
	    	<a href="${ cl }/tags/${ boardInfo.category }">
	    		<span class="block bg-gray-100 text-gray-700 px-3 py-1 rounded-full text-sm hover:bg-gray-200 cursor-pointer">
					${ boardInfo.category }
				</span>
			</a>
	    </div>
	
	    <c:if test="${ not empty boardInfo.img }">
	        <div class="w-full mb-6">
	            <img src="${ boardInfo.img }" alt="이미지링크" class="w-full h-auto border shadow-xl ">
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
					<a href="${ cl }/blog/${ writerInfo.username }">${ writerInfo.username }</a>
				</h1>
	    		<p>${ writerInfo.bio }</p>
	    	</div>
	    </div>
	    <br><hr><br>
	    <!-- 댓글 작성 폼 -->
	    <c:if test="${ not empty sessionScope.user }">
	    	<div class="w-full mb-6">
		        <h2 class="text-2xl font-semibold mb-4">댓글 작성</h2>
		        <form action="${ cl }/addComment" method="post">
		            <textarea name="commentContent" placeholder="댓글을 입력하세요..." oninput="autoResize(this)" maxlength="250"
		            	class="w-full p-3 border focus:ring-2 focus:ring-black focus:outline-none resize-none overflow-y-hidden"></textarea>
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
	
	    <div class="w-full mb-96">
	        <h2 class="text-2xl font-semibold mb-4">댓글 ${ commentList.size() }개</h2>
	        <c:if test="${ not empty commentList }">
	        	<c:forEach var="commentList" items="${ commentList }">
		        	<div class="p-4">
			            <div class="flex items-center text-md text-gray-500 mb-2">
			            	<a href="${ cl }/blog/${ commentList.commenterName }" class="flex items-center">
			            		<img src="${ commentList.commenterProfile }" class="w-8 h-8 rounded-full object-cover">
			                	<span class="font-medium mx-2">${ commentList.commenterName }</span>
			            	</a>
			                <span>&#8226; &nbsp;</span>
			                <span>${ commentList.dateTime }</span>
			            </div>
				        <textarea id="ELcommentContent" class="text-lg w-full text-gray-800 focus:outline-none focus:ring-hidden resize-none" readonly>${ commentList.commentContent }</textarea>
			        </div>
		        </c:forEach>
	        </c:if>
	    </div>
	</div>
	
	<div id="mdContent" class="hidden">${ boardInfo.content }</div>
	
	<div class="lightBox" id="lightBox">
        <div class="lightBoxContent">
            <button class="lightBoxClose mb-2 text-xl">&times;</button>
            <img class="lightBoxImage" src="" alt="확대된 이미지">
        </div>
    </div>
	
	<jsp:include page="${ cl }/WEB-INF/common/footer.jsp" />
	<script src="${ cl }/resources/js/boardMdEncode.js"></script>
	<script>
		fetch(`${url}/boardCommentCountSave?commentCount=${commentList.size()}&blogId=${boardInfo.blogId}`, {method: 'POST'})
			.then(response => response.json())
			.then(data => {
				console.log("댓글 수: " + data + "개");
			})
			.catch((error) => {
			    console.error('에러:', error);
			});
	</script>
	
</body>
</html>