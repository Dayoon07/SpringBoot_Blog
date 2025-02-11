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
	<title>${ tagWord } - SIGMA</title>
</head>
<body>
	<jsp:include page="${ cl }/WEB-INF/common/header.jsp" />
	
	<div class="max-w-screen-md mx-auto mt-4">
		<c:if test="${ not empty categoryBoardList }">
	        <h1 class="font-semibold text-3xl mt-16 mb-4">#${ tagWord }</h1>
	        <p class="text-lg text-gray-500 mb-16">#${ tagWord }와 관련된 ${ categoryBoardList.size() }개의 글이 있습니다</p>
	        
	        <c:forEach var="cbl" items="${ categoryBoardList }">
		        <div class="flex flex-col space-y-4 mb-10">
		            <div class="flex items-center space-x-3">
		                <a href="${ cl }/blog/${ URLDecoder.decode(cbl.writer, 'UTF-8') }" class="block">
		                    <img src="${ cbl.writerProfile }" class="w-12 h-12 rounded-full">
		                </a>
		                <div class="text-lg font-semibold">
		                    <a href="${ cl }/blog/${ URLDecoder.decode(cbl.writer, 'UTF-8') }" class="text-black hover:underline">${ cbl.writer }</a>
		                </div>
		            </div>
		
		            <div class="relative pt-[52.356%] overflow-hidden rounded-lg shadow-md">
		            	<a href="${ cl }/blog/${ URLDecoder.decode(cbl.writer, 'UTF-8') }/board/${ URLDecoder.decode(cbl.title, 'UTF-8') }">
		                	<c:if test="${ not empty cbl.img and empty cbl.video }">
		  						<img src="${ cbl.img }" class="absolute inset-0 w-full h-full object-cover" loading="lazy">
		  					</c:if>
		  					<c:if test="${ empty cbl.img and not empty cbl.video }">
		  						<video src="${ cbl.video }" class="absolute inset-0 w-full h-full object-cover"></video>
		  					</c:if>
		  					<c:if test="${ not empty cbl.img and not empty cbl.video }">
		  						<img src="${ cbl.img }" class="absolute inset-0 w-full h-full object-cover" loading="lazy">
		  					</c:if>
		  					<c:if test="${ empty cbl.img and empty cbl.video }">
		  						<div style="height: 170px;" class="w-full bg-white flex justify-center items-center border">이미지 또는 영상이 없음</div>
		  					</c:if>
		            	</a>
					</div>
		
					<h2 class="text-xl font-bold text-gray-800 hover:text-blue-600">
				    	<a href="${ cl }/blog/${ URLDecoder.decode(cbl.writer, 'UTF-8') }/board/${ URLDecoder.decode(cbl.title, 'UTF-8') }">
							<c:choose>
								<c:when test="${ cbl.title.length() > 25 }">
									${ cbl.title.substring(0, 25) }...
								</c:when>
								<c:otherwise>
									${ cbl.title }
							    </c:otherwise>
							</c:choose>		
		    			</a>
					</h2>
		
		            <p class="text-gray-600">
						<c:choose>
							<c:when test="${ cbl.content.length() > 75 }">
								${ cbl.content.substring(0, 75) }...
							</c:when>
							<c:otherwise>
								${ cbl.content }
							</c:otherwise>
						</c:choose>		
					</p>
					
					<div class="flex flex-wrap gap-2 mb-4">
						<a href="${ cl }/tags/${ cbl.category }">
							<span class="bg-gray-100 text-gray-700 px-3 py-1 rounded-full text-sm hover:bg-gray-200 cursor-pointer">
			            		${ cbl.category }
			            	</span>
			            </a>
					</div>
		
		            <div class="flex items-center text-sm text-gray-500 space-x-2">
		                ${ cbl.dateTime } <br>
			  			조회수 : ${ cbl.views } &nbsp; &#8226; &nbsp; 
			  			좋아요 : ${ cbl.likes } &nbsp; &#8226; &nbsp; 
			  			댓글 : ${ cbl.commentCount }
		            </div>
		        </div>
			</c:forEach>
		</c:if>
		<c:if test="${ empty categoryBoardList }">
			<h1 class="text-center mt-32 mb-96 text-3xl">${ tagWord }와 관련된 글이 없습니다</h1>
		</c:if>
	</div>
	
	<jsp:include page="${ cl }/WEB-INF/common/footer.jsp" />
</body>
</html>