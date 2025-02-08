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
	<title>메인페이지</title>
</head>
<body>
	<jsp:include page="${ cl }/WEB-INF/common/header.jsp" />
	
	<div class="container mx-auto grid xl:grid-cols-4 lg:grid-cols-3 md:grid-cols-2">
		<c:forEach var="brfa" items="${ boardRepoFindAll }">
			<div class="p-4 hover:bg-gray-200 border">
		  		<a href="${ cl }/${ brfa.writer }/${ brfa.title }">
		  			<c:choose>
		  				<c:when test="${ not empty brfa.img }">
		  					<img src="${ brfa.img }" style="width: 100%; height: 200px;">
						</c:when>
						<c:otherwise>
							<div style="width: 100%; height: 200px;" class="bg-white flex justify-center items-center border">이미지 없음</div>							
						</c:otherwise>
					</c:choose>
		  		</a>
		  		<div class="px-4 py-3 border-t border-b hover:bg-gray-300 cursor-pointer">
		  			글쓴이 : <a href="${ cl }/profile/${ brfa.writer }" class="hover:underline text-lg">${ brfa.writer }</a>
		  		</div>
		  		<div class="px-6 py-4">
		    		<div class="font-bold text-xl mb-2">
		    			<a href="${ cl }/${ brfa.writer }/${ brfa.title }" class="hover:underline">
		    				<c:choose>
								<c:when test="${ brfa.title.length() > 50 }">
									${ brfa.title.substring(0, 50) += "..." }
						        </c:when>
								<c:otherwise>
									${ brfa.title }
						        </c:otherwise>
							</c:choose>
		    			</a>
		    		</div>
		    		<p class="text-gray-700 text-base">
		      			<a href="${ cl }/${ brfa.writer }/${ brfa.title }" class="hover:underline">
		      				<c:choose>
								<c:when test="${ brfa.content.length() > 100 }">
									${ brfa.content.substring(0, 100) += "..." }
						        </c:when>
								<c:otherwise>
									${ brfa.content }
						        </c:otherwise>
							</c:choose>
		      			</a>
		    		</p>
		  		</div>
		  		<div>
		    		<span class="inline-block bg-gray-200 rounded-full px-3 py-1 text-sm font-semibold text-gray-700 mr-2 mb-2 hover:bg-gray-300 cursor-pointer">
		    			#${ brfa.category }
		    		</span>
		  		</div>
			</div>
		</c:forEach>
	</div>
	
	<jsp:include page="${ cl }/WEB-INF/common/footer.jsp" />
</body>
</html>