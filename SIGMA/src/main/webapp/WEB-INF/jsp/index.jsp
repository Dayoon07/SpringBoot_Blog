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
	<title>SIGMA</title>
</head>
<body>
	<jsp:include page="${ cl }/WEB-INF/common/header.jsp" />
	
	<div class="container mx-auto grid xl:grid-cols-4 lg:grid-cols-3 md:grid-cols-2 gap-4">
		<c:forEach var="brfa" items="${ boardRepoFindAll }">
    		<div class="grid-item rounded overflow-hidden p-4 hover:bg-gray-100">
				<a href="${ cl }/blog/${ brfa.writer }" class="block p-2 mb-2 hover:bg-gray-200 flex items-center">
					<img src="${ brfa.writerProfile }" class="w-8 h-8 rounded-full object-cover">
					<span class="mx-2 text-md">${ brfa.writer }</span>
				</a>
  				<a href="${ cl }/blog/${ brfa.writer }/board?id=${ brfa.blogId }" style="height: 170px;" class="block overflow-hidden">
  					<c:if test="${ not empty brfa.img and empty brfa.video }">
  						<img src="${ brfa.img }" class="w-full" loading="lazy">
  					</c:if>
  					<c:if test="${ empty brfa.img and not empty brfa.video }">
  						<video src="${ brfa.video }"></video>
  					</c:if>
  					<c:if test="${ not empty brfa.img and not empty brfa.video }">
  						<img src="${ brfa.img }" class="w-full" loading="lazy">
  					</c:if>
  					<c:if test="${ empty brfa.img and empty brfa.video }">
  						<div style="height: 170px;" class="w-full bg-white flex justify-center items-center border">이미지 또는 영상이 없음</div>
  					</c:if>
		  		</a>
			  	<div class="py-4">
			    	<div class="font-bold text-xl mb-2">
			    		<a href="${ cl }/blog/${ brfa.writer }/board?id=${ brfa.blogId }" class="hover:underline">
		    				<c:choose>
								<c:when test="${ brfa.title.length() > 15 }">
									${ brfa.title.substring(0, 15) += "..." }
						        </c:when>
								<c:otherwise>
									${ brfa.title }
						        </c:otherwise>
							</c:choose>
		    			</a>
			    	</div>
			    	<div class="h-20">
			    		<p class="text-gray-700 text-base">
			      			<a href="${ cl }/blog/${ brfa.writer }/board?id=${ brfa.blogId }" class="hover:underline">
			      				<c:choose>
									<c:when test="${ brfa.content.length() > 60 }">
										${ brfa.content.substring(0, 60) += "..." }
							        </c:when>
									<c:otherwise>
										${ brfa.content }
							        </c:otherwise>
								</c:choose>
			      			</a>
			    		</p>
			    	</div>
			  	</div>
		  		<div class="py-2 border-gray-300 border-t text-gray-500 text-sm">
		  			${ brfa.dateTime.substring(0, 10) } <br>
		  			조회수 : ${ brfa.views } &nbsp; &#8226; &nbsp; 
		  			좋아요 : ${ brfa.likes } &nbsp; &#8226; &nbsp; 
		  			댓글 : ${ brfa.commentCount }
		  		</div>
			</div>
		</c:forEach>
	</div>
	
	<script src="https://cdn.tailwindcss.com"></script>
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="${ cl }/resources/js/script.js"></script>
</body>
</html>