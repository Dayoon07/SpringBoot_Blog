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
	<title>${ searchWord } 검색결과 - SIGMA</title>
</head>
<body>
	<jsp:include page="${ cl }/WEB-INF/common/header.jsp" />
	
	<div class="max-w-screen-md mx-auto my-20 border">
		<form action="${ cl }/result" method="get" autocomplete="on" class="flex items-center pl-4">
			<button type="submit" style="width: 17px; height: 17px;" class="cursor-pointer">
				<svg width="17" height="17" viewBox="0 0 17 17">
					<path fill-rule="evenodd" d="M13.66 7.36a6.3 6.3 0 1 1-12.598 0 6.3 6.3 0 0 1 12.598 0zm-1.73 
						5.772a7.36 7.36 0 1 1 1.201-1.201l3.636 3.635c.31.31.31.815 0 1.126l-.075.075a.796.796 0 
						0 1-1.126 0l-3.636-3.635z" clip-rule="evenodd" fill="currentColor">
					</path>
				</svg>
			</button>
			<input type="text" id="qey" name="qey" value="${ searchWord }" placeholder="검색어를 입력하세요" required 
				class="w-full cursor-auto text-lg h-12 px-4 py-2 focus:outline-none">
		</form>
	</div>
	
	<div class="max-w-screen-md mx-auto my-20">
		<c:forEach var="srl" items="${ searchResultLists }">
			<div class="flex flex-col space-y-4 mb-10">
	            <div class="flex items-center space-x-3">
	                <a href="${ cl }/blog/${ srl.writer }" class="block">
	                    <img src="${ srl.writerProfile }" class="w-12 h-12 rounded-full">
	                </a>
	                <div class="text-lg font-semibold">
	                    <a href="${ cl }/blog/${ srl.writer }" class="text-black hover:underline">${ srl.writer }</a>
	                </div>
	            </div>
	
	            <div class="relative pt-[52.356%] overflow-hidden rounded-lg shadow-md">
	            	<a href="${ cl }/blog/${ srl.writer }/board?id=${ srl.blogId }">
	                	<c:if test="${ not empty srl.img and empty srl.video }">
	  						<img src="${ srl.img }" class="absolute inset-0 w-full h-full object-cover" loading="lazy">
	  					</c:if>
	  					<c:if test="${ empty srl.img and not empty srl.video }">
	  						<video src="${ srl.video }" class="absolute inset-0 w-full h-full object-cover"></video>
	  					</c:if>
	  					<c:if test="${ not empty srl.img and not empty srl.video }">
	  						<img src="${ srl.img }" class="absolute inset-0 w-full h-full object-cover" loading="lazy">
	  					</c:if>
	  					<c:if test="${ empty srl.img and empty srl.video }">
	  						<div style="height: 170px;" class="w-full bg-white flex justify-center items-center border">이미지 또는 영상이 없음</div>
	  					</c:if>
	            	</a>
				</div>
	
				<h2 class="text-xl font-bold text-gray-800 hover:text-blue-600">
			    	<a href="${ cl }/blog/${ srl.writer }/board?id=${ srl.blogId }">
						<c:choose>
							<c:when test="${ srl.title.length() > 25 }">
								${ srl.title.substring(0, 25) += "..." }
							</c:when>
							<c:otherwise>
								${ srl.title }
						    </c:otherwise>
						</c:choose>		
	    			</a>
				</h2>
	
	            <p class="text-gray-600">
					<c:choose>
						<c:when test="${ srl.content.length() > 75 }">
							${ srl.content.substring(0, 75) += "..." }
						</c:when>
						<c:otherwise>
							${ srl.content }
						</c:otherwise>
					</c:choose>		
				</p>
				
				<div class="flex flex-wrap gap-2 mb-4">
					<a href="${ cl }/tags/${ srl.category }">
						<span class="bg-gray-100 text-gray-700 px-3 py-1 rounded-full text-sm hover:bg-gray-200 cursor-pointer">
		            		${ srl.category }
		            	</span>
		            </a>
				</div>
	
	            <div class="flex items-center text-sm text-gray-500 space-x-2">
	                ${ srl.dateTime } <br>
		  			조회수 : ${ srl.views } &nbsp; &#8226; &nbsp; 
		  			좋아요 : ${ srl.likes } &nbsp; &#8226; &nbsp; 
		  			댓글 : ${ srl.commentCount }
	            </div>
	        </div>
		</c:forEach>
    </div>
	
	<script src="https://cdn.tailwindcss.com"></script>
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/showdown/dist/showdown.min.js"></script>
	<script src="${ cl }/resources/js/script.js"></script>
</body>
</html>