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
    <title>${ profileInfo.username }님이 누른 좋아요 목록 - SIGMA</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
    <jsp:include page="${ cl }/WEB-INF/common/header.jsp" />

    <div class="max-w-screen-md mx-auto p-6">
        <div class="flex gap-6">
			<img src="${ profileInfo.profile }" alt="프로필 사진" class="w-32 h-32 rounded-full object-cover border-2 border-gray-300">
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
        	<div class="flex mb-4 border-gray-300 border-b-2">
			    <a href="${ cl }/blog/${ profileInfo.username }" 
			       class="px-6 py-3">
			        블로그
			    </a>
			    <a href="${ cl }/blog/${ profileInfo.username }/like" 
			       class="px-6 py-3 bg-gray-300">
			        좋아요 표시한 글
			    </a>
			</div>
        	<c:if test="${ empty myLikeList }">
        		<h3 class="text-4xl font-bold text-center mb-24">좋아요를 누른 글이 없습니다</h3>
        	</c:if>
		    <c:if test="${ not empty myLikeList }">
			    <h3 class="text-2xl font-bold mb-6">좋아요를 누른 글 ${ myLikeList.size() }개</h3>
			    <c:forEach var="mll" items="${ myLikeList }">
			        <div class="bg-white shadow-md border rounded-md mb-6 hover:shadow-lg transition duration-300">
			            <a href="${ cl }/blog/${ URLDecoder.decode(mll.writer, 'UTF-8') }/board/${ URLDecoder.decode(mll.title, 'UTF-8') }" 
			            	class="block w-full h-48 mb-4 overflow-hidden">
			                <c:if test="${ not empty mll.img and empty mll.video }">
		  						<img src="${ mll.img }" class="w-full" loading="lazy">
		  					</c:if>
		  					<c:if test="${ empty mll.img and not empty mll.video }">
		  						<video src="${ mll.video }"></video>
		  					</c:if>
		  					<c:if test="${ not empty mll.img and not empty mll.video }">
		  						<img src="${ mll.img }" class="w-full" loading="lazy">
		  					</c:if>
		  					<c:if test="${ empty mll.img and empty mll.video }">
		  						<div class="w-full h-48 bg-white flex justify-center items-center border">이미지 또는 영상이 없음</div>
		  					</c:if>
			            </a>
			            <div class="mb-3 px-5">
			                <a href="${ cl }/blog/${ URLDecoder.decode(mll.writer, 'UTF-8') }/board/${ URLDecoder.decode(mll.title, 'UTF-8') }" 
			                	class="text-2xl font-semibold text-gray-800 hover:underline">
				                <c:choose>
				                    <c:when test="${ mll.title.length() > 30 }">
				                        ${ mll.title.substring(0, 30) }...
				                    </c:when>
				                    <c:otherwise>
				                        ${ mll.title }
				                    </c:otherwise>
				                </c:choose>
			                </a>
			            </div>
			            <div class="w-full text-gray-600 text-base leading-relaxed mb-4 px-5">
			    			<a href="${ cl }/blog/${ URLDecoder.decode(mll.writer, 'UTF-8') }/board/${ URLDecoder.decode(mll.title, 'UTF-8') }" class="hover:underline">
					    		<c:choose>
					            	<c:when test="${ mll.content.length() > 80 }">
					                	${ mll.content.substring(0, 80) }...
									</c:when>
					                <c:otherwise>
					                	${ mll.content }
									</c:otherwise>
								</c:choose>
							</a>
						</div>
			
			            <div class="flex flex-wrap gap-2 mb-4 px-5">
			            	<a href="${ cl }/tags/${ mll.category }">
			            		<span class="bg-gray-100 text-gray-700 px-3 py-1 rounded-full text-sm hover:bg-gray-200 cursor-pointer">
				                    ${ mll.category }
				                </span>
			            	</a>
			            </div>
			
			            <div class="text-gray-500 text-sm flex justify-between px-5 pb-5">
			                <p>${ mll.dateTime }</p>
			                <div class="flex gap-4">
			                    <p>조회수 : ${ mll.views }</p>
			                    <p>좋아요 : ${ mll.likes }</p>
			                    <p>댓글 : ${ mll.commentCount }</p>
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
