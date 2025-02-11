<%@ page import="java.net.URLDecoder" %>
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
			
	<div class="container mx-auto mt-5 grid xl:grid-cols-4 lg:grid-cols-3 md:grid-cols-2 gap-6">
		<c:forEach var="brfa" items="${ boardRepoFindAll }">
    		<div class="grid-item overflow-hidden hover:bg-gray-100 border">
				<a href="${ cl }/blog/${ URLDecoder.decode(brfa.writer, 'UTF-8') }" class="block p-2 hover:bg-gray-200 flex justify-between items-center">
					<span class="flex items-center">
						<img src="${ brfa.writerProfile }" class="w-8 h-8 rounded-full object-cover">
						<c:choose>
							<c:when test="${ brfa.writer.length() > 9 }">
								<span class="mx-2 text-md">${ brfa.writer.substring(0, 9) }...</span>
							</c:when>
							<c:otherwise>
								<span class="mx-2 text-md">${ brfa.writer }</span>
							</c:otherwise>
						</c:choose>
					</span>
					<span class="mr-2">
						${ brfa.dateTime.substring(0, 10) } <br>
					</span>
				</a>
  				<a href="${ cl }/blog/${ URLDecoder.decode(brfa.writer, 'UTF-8') }/board/${ URLDecoder.decode(brfa.title, 'UTF-8') }" style="height: 180px;" class="block overflow-hidden">
  					<c:if test="${ not empty brfa.img and empty brfa.video }">
  						<img src="${ brfa.img }" class="w-full h-44" loading="lazy">
  					</c:if>
  					<c:if test="${ empty brfa.img and not empty brfa.video }">
  						<video src="${ brfa.video }" class="w-full h-44"></video>
  					</c:if>
  					<c:if test="${ not empty brfa.img and not empty brfa.video }">
  						<img src="${ brfa.img }" class="w-full h-44" loading="lazy">
  					</c:if>
  					<c:if test="${ empty brfa.img and empty brfa.video }">
  						<div class="w-full bg-white flex h-44 justify-center items-center border">이미지 또는 영상이 없음</div>
  					</c:if>
		  		</a>
			  	<div class="py-3 mx-4">
			    	<div class="font-bold text-xl mb-2">
			    		<a href="${ cl }/blog/${ URLDecoder.decode(brfa.writer, 'UTF-8') }/board/${ URLDecoder.decode(brfa.title, 'UTF-8') }" class="hover:underline">
		    				<c:choose>
								<c:when test="${ brfa.title.length() > 15 }">
									${ brfa.title.substring(0, 15) }...
						        </c:when>
								<c:otherwise>
									${ brfa.title }
						        </c:otherwise>
							</c:choose>
		    			</a>
			    	</div>
			    	<div class="h-12">
			    		<p class="text-gray-700 text-base">
			      			<a href="${ cl }/blog/${ URLDecoder.decode(brfa.writer, 'UTF-8') }/board/${ URLDecoder.decode(brfa.title, 'UTF-8') }" class="hover:underline">
			      				<c:choose>
									<c:when test="${ brfa.content.length() > 35 }">
										${ brfa.content.substring(0, 35) }...
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
		  			<div class="mx-4">
			  			조회수 : ${ brfa.views } &nbsp; &#8226; &nbsp; 
			  			좋아요 : ${ brfa.likes } &nbsp; &#8226; &nbsp; 
			  			댓글 : ${ brfa.commentCount }
			  		</div>
		  		</div>
			</div>
		</c:forEach>
	</div>
	
	<footer class="container mx-auto bg-white m-4">
    	<div class="p-4 md:flex md:items-center md:justify-between border-t">
      		<span class="text-sm text-gray-500 sm:text-center dark:text-gray-400">
      			Copyright 2024. Dayoon. All Rights Reserved.
    		</span>
    		<ul class="flex flex-wrap items-center mt-3 text-sm font-medium text-gray-500 dark:text-gray-400 sm:mt-0">
        		<li><a href="mailto:gangd0642@gmail.com" class="hover:text-blue-600 hover:underline">gangd0642@gmail.com</a></li>
    		</ul>
    	</div>
	</footer>
	
	<script src="https://cdn.tailwindcss.com"></script>
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="${ cl }/resources/js/script.js"></script>
</body>
</html>