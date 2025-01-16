<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<c:set var="cl" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>title</title>
</head>
<body>
	<jsp:include page="/WEB-INF/common/header.jsp" />
	
	<div class="m-10 mx-auto max-w-screen-lg">
		<c:if test="${ not empty searchLists }">
			<c:forEach var="blog" items="${ searchLists }">
				<a href="${ cl }/blog/board?blogid=${ blog.blogid }&writer=${ blog.writer }&title=${ blog.title }">
					<div class="bg-white mx-5 border border-gray-300 rounded-lg mb-5 py-4 px-6 hover:bg-gray-200">
			    		<div class="flex items-center mb-3">
			      			<div class="w-10 h-10 bg-gray-500 text-white rounded-full flex justify-center items-center">${ blog.writer.substring(0, 1) }</div>
			      			<div class="ml-3 flex justify-between items-center">
			        			<p class="text-xl font-medium mr-3">${ blog.writer }</p>
								<p class="text-md text-gray-500">
								    ${ blog.datetime.substring(0, 4) == LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy")) ? blog.datetime.substring(6) : blog.datetime.substring(0, 13) }
								</p>
			      			</div>
			    		</div>
			    		<p class="text-xl text-gray-800 mb-3">${ blog.title }</p><br>
			    		<p class="text-xl text-left text-gray-800 mb-3">
			    			${ blog.content.length() > 100 ? blog.content.substring(0, 100) : blog.content }
						</p>
						<div class="flex space-x-4 text-lg text-gray-500">
				      		<button class="hover:text-gray-800">👍 좋아요 ${ blog.likes == 0 ? " 없음" : blog.likes }</button>
				      		<button class="hover:text-gray-800">
				      			💬
				      			<c:choose>
								    <c:when test="${ blog.commentCount == 0 }">
								        댓글 없음
								    </c:when>
								    <c:otherwise>
								        댓글 ${ blog.commentCount }개 
								    </c:otherwise>
								</c:choose>
				      		</button>
				      		<button class="hover:text-gray-800">&nbsp;조회수 ${ blog.views == 0 ? " 없음" : blog.views } </button>
				    	</div>
			  		</div>
		  		</a>
			</c:forEach>
		</c:if>
	</div>
	
	<jsp:include page="/WEB-INF/common/footer.jsp" />
</body>
</html>