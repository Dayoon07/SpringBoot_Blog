<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<c:set var="cl" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>${ userProfileList.username }</title>
</head>
<body>
	<jsp:include page="/WEB-INF/common/header.jsp" />
	
	<c:if test="${ not empty sessionScope.userSession }">
	    <c:if test="${ sessionScope.userSession.memberid == userProfileList.memberid}">
	    	
	    </c:if>
	</c:if>
	
	<div class="bg-gray-200 text-black">
    	<div class="max-w-screen-lg mx-auto px-6 py-8">
      		<div class="flex items-center">
        		<div class="ml-6">
					<h1 class="text-3xl font-bold">${ userProfileList.username }</h1>
        		</div>
      		</div>
    	</div>
  	</div>

	<main class="container mx-auto px-6 mt-6 space-y-6">
		<section class="flex flex-col lg:flex-row space-y-6 lg:space-y-0 lg:space-x-6">
      		<aside class="lg:w-1/4 space-y-6">
        		<div class="bg-white rounded-lg border-gray-300 border p-6">
          			<h2 class="text-xl font-semibold mb-4">정보</h2>
          			<p class="text-gray-700"><strong>Email:</strong> ${ userProfileList.useremail }</p>
        		</div>

				<div class="bg-white rounded-lg border-gray-300 border p-6">
	          		<h2 class="text-xl font-semibold mb-4">자기소개말</h2>
	          		<ul class="space-y-2">
		            	<li class="text-gray-700">${ userProfileList.profilebio }</li>
	          		</ul>
	        	</div>
      		</aside>
      		
      		<section class="lg:w-3/4 space-y-6 border-gray-200">
		  		<div class="bg-white rounded-lg shadow p-6 border">
		    		<h2 class="text-xl font-semibold mb-4">${ userProfileList.username }의 최신 글</h2>
		    		
		    		<div class="grid grid-cols-1 sm:grid-cols-2 gap-6">
		      			<c:forEach var="userProfileBlog" items="${ userProfileBoardBlog }">
		      				<div class="border border-gray-200 rounded-lg p-4 hover:shadow-md transition">
		      					<c:if test="${ not empty sessionScope.userSession }">
								    <c:if test="${ sessionScope.userSession.memberid == userProfileList.memberid}">
								    	<div class="flex mb-2">
								    		<form action="${ cl }/deleteBlog?blogid=${ userProfileBlog.blogid }" method="post" autocomplete="off">
									    		<input type="hidden" name="username" value="${ userProfileList.username }">
									    		<input type="hidden" name="memberid" value="${ userProfileList.memberid }">
					      						<button type="submit" class="bg-red-600 text-white py-1 px-5 rounded-lg mr-3">삭제</button>
					      					</form>
					      					<form action="${ cl }/changeBlog?blogid=${ userProfileBlog.blogid }" method="post" autocomplete="off">
									    		<input type="hidden" name="blogid" value="${ userProfileBlog.blogid }">
					      						<button type="submit" class="bg-blue-600 text-white py-1 px-5 rounded-lg">수정</button>
					      					</form>
								    	</div>
								    </c:if>
								</c:if>
			        			<h3 class="text-lg font-semibold text-blue-500">
			        				<a href="${ cl }/blog/board?blogid=${ userProfileBlog.blogid }&writer=${ userProfileBlog.writer }&title=${ userProfileBlog.title }">
			        					${ userProfileBlog.title }
			        				</a>
						        </h3>
						        <p class="text-sm text-gray-600 mt-2">
						          	${ userProfileBlog.content.length() > 50 ? userProfileBlog.content.substring(0, 50) : userProfileBlog.content }
						        </p>
						        <div class="flex items-center justify-start mt-4 text-xs text-gray-500">
						          	<span class="pr-3">좋아요 : ${ userProfileBlog.likes }</span>
						          	<span class="pr-3">댓글 : ${ userProfileBlog.commentCount }</span>
						          	<span>조회수 : ${ userProfileBlog.views }</span>
						        </div>
			      			</div>
		      			</c:forEach>
		    		</div>
		  		</div>
			</section>
		</section>
	</main> 

	<jsp:include page="/WEB-INF/common/footer.jsp" />
</body>
</html>