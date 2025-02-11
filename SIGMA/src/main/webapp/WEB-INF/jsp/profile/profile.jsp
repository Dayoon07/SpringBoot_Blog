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
    <title>${ profileInfo.username } 작성글 - SIGMA</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
    <jsp:include page="${ cl }/WEB-INF/common/header.jsp" />

    <div class="max-w-screen-md mx-auto p-6">
        <div class="flex gap-6">
            <div>
            	<img src="${ profileInfo.profile }" alt="프로필 사진" class="w-32 h-32 rounded-full object-cover border-2 border-gray-300">
            </div>
            <div class="py-4">
                <h2 class="text-2xl font-bold">${ profileInfo.username }</h2>
                <p class="text-gray-600 mt-1">${ profileInfo.bio }</p>
            </div>
        </div>
        <br><hr><br>
        <div class="w-full">
        	<p class="text-md text-gray-500">이메일 : 
				<a href="mailto:${ profileInfo.useremail }" class="hover:underline hover:text-black">${ profileInfo.useremail }</a>
			</p>
			<p class="text-md text-gray-500 py-2">가입일 : ${ profileInfo.dateTime }</p>
        </div>

        <div class="mt-8 max-w-screen-md mx-auto">
        	<c:if test="${ empty profileUserBoard }">
        		<h3 class="text-4xl font-bold text-center mb-24">작성한 글이 없습니다</h3>
        	</c:if>
		    <c:if test="${ not empty profileUserBoard }">
			    <h3 class="text-2xl font-bold mb-6">작성한 글 ${ profileUserBoard.size() }개</h3>
			    <c:forEach var="pub" items="${ profileUserBoard }">
			        <div class="bg-white shadow-md border rounded-md p-5 mb-6 hover:shadow-lg transition duration-300">
			            <a href="${ cl }/blog/${ URLDecoder.decode(pub.writer, 'UTF-8') }/board/${ URLDecoder.decode(pub.title, 'UTF-8') }" 
			            	class="block w-full h-48 mb-4">
			                <c:if test="${ not empty pub.img and empty pub.video }">
		  						<img src="${ pub.img }" class="w-full h-44" loading="lazy">
		  					</c:if>
		  					<c:if test="${ empty pub.img and not empty pub.video }">
		  						<video src="${ pub.video }"></video>
		  					</c:if>
		  					<c:if test="${ not empty pub.img and not empty pub.video }">
		  						<img src="${ pub.img }" class="w-full h-44" loading="lazy">
		  					</c:if>
		  					<c:if test="${ empty pub.img and empty pub.video }">
		  						<div class="w-full h-48 bg-white flex h-44 justify-center items-center border">이미지 또는 영상이 없음</div>
		  					</c:if>
			            </a>
			            <div class="mb-3">
			                <a href="${ cl }/blog/${ URLDecoder.decode(pub.writer, 'UTF-8') }/board/${ URLDecoder.decode(pub.title, 'UTF-8') }" 
			                	class="text-2xl font-semibold text-gray-800 hover:underline">
				                <c:choose>
				                    <c:when test="${ pub.title.length() > 30 }">
				                        ${ pub.title.substring(0, 30) }...
				                    </c:when>
				                    <c:otherwise>
				                        ${ pub.title }
				                    </c:otherwise>
				                </c:choose>
			                </a>
			            </div>
			            <div class="w-full text-gray-600 text-base leading-relaxed mb-4">
			    			<a href="${ cl }/blog/${ URLDecoder.decode(pub.writer, 'UTF-8') }/board/${ URLDecoder.decode(pub.title, 'UTF-8') }" class="hover:underline">
					    		<c:choose>
					            	<c:when test="${ pub.content.length() > 80 }">
					                	${ pub.content.substring(0, 80) }...
									</c:when>
					                <c:otherwise>
					                	${ pub.content }
									</c:otherwise>
								</c:choose>
							</a>
						</div>
			
			            <div class="flex flex-wrap gap-2 mb-4">
			            	<a href="${ cl }/tags/${ pub.category }">
			            		<span class="bg-gray-100 text-gray-700 px-3 py-1 rounded-full text-sm hover:bg-gray-200 cursor-pointer">
				                    ${ pub.category }
				                </span>
			            	</a>
			            </div>
			
			            <div class="text-gray-500 text-sm flex justify-between">
			                <p>${ pub.dateTime }</p>
			                <div class="flex gap-4">
			                    <p>조회수 : ${ pub.views }</p>
			                    <p>좋아요 : ${ pub.likes }</p>
			                    <p>댓글 : ${ pub.commentCount }</p>
			                </div>
			            </div>
			        </div>
			    </c:forEach>
		    </c:if>
		</div>
  	</div>

    <jsp:include page="${ cl }/WEB-INF/common/footer.jsp" />
</body>
</html>
