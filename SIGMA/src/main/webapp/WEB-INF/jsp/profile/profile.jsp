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
        <div class="w-full md:flex md:justify-between">
        	<div>
        		<p class="text-md text-gray-500">이메일 : 
					<a href="mailto:${ profileInfo.useremail }" class="hover:underline hover:text-black">${ profileInfo.useremail }</a>
				</p>
				<p class="text-md text-gray-500 py-2">가입일 : ${ profileInfo.dateTime }</p>
        	</div>
        	<c:if test="${ not empty sessionScope.user and sessionScope.user.memberId eq profileInfo.memberId }">
        		<div>
					<button class="px-6 py-2 bg-red-600 text-white font-semibold rounded focus:outline-none hover:bg-red-500" 
						type="button" onclick="openDropModal()" >계정 삭제</button>
	        	</div>
        	</c:if>
        </div>

        <div class="mt-8 max-w-screen-md mx-auto">
        	<div class="flex mb-4 border-gray-200 border-b-2">
			    <a href="${ cl }/blog/${ profileInfo.username }" 
			       class="px-6 py-3 bg-gray-200">
			        블로그
			    </a>
			    <a href="${ cl }/blog/${ profileInfo.username }/like" 
			       class="px-6 py-3">
			        좋아요 표시한 글
			    </a>
			</div>
        	<c:if test="${ empty profileUserBoard }">
        		<h3 class="text-2xl font-bold text-center my-24">작성한 글이 없습니다</h3>
        	</c:if>
		    <c:if test="${ not empty profileUserBoard }">
			    <h3 class="text-2xl font-bold mb-6">작성한 글 ${ profileUserBoard.size() }개</h3>
			    <c:forEach var="pub" items="${ profileUserBoard }">
			        <div class="bg-white shadow-md border rounded-md mb-6 hover:shadow-lg transition duration-300">
			            <a href="${ cl }/blog/${ URLDecoder.decode(pub.writer, 'UTF-8') }/board/${ URLDecoder.decode(pub.title, 'UTF-8') }" 
			            	class="block w-full h-48 mb-4 overflow-hidden">
			                <c:if test="${ not empty pub.img and empty pub.video }">
		  						<img src="${ pub.img }" class="w-full" loading="lazy">
		  					</c:if>
		  					<c:if test="${ empty pub.img and not empty pub.video }">
		  						<video src="${ pub.video }"></video>
		  					</c:if>
		  					<c:if test="${ not empty pub.img and not empty pub.video }">
		  						<img src="${ pub.img }" class="w-full" loading="lazy">
		  					</c:if>
		  					<c:if test="${ empty pub.img and empty pub.video }">
		  						<div class="w-full h-48 bg-white flex justify-center items-center border">이미지 또는 영상이 없음</div>
		  					</c:if>
			            </a>
			            <div class="mb-3 px-5">
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
			            <div class="w-full text-gray-600 text-base leading-relaxed mb-4 px-5">
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
			
			            <div class="flex flex-wrap gap-2 mb-4 px-5">
			            	<a href="${ cl }/tags/${ pub.category }">
			            		<span class="bg-gray-100 text-gray-700 px-3 py-1 rounded-full text-sm hover:bg-gray-200 cursor-pointer">
				                    ${ pub.category }
				                </span>
			            	</a>
			            </div>
			
			            <div class="text-gray-500 text-sm flex justify-between px-5 pb-5">
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
  	
  	<div id="dropAccountModal" class="hidden fixed bg-black opacity-50 top-0 left-0 w-full h-full z-10"></div>
  	
  	<div id="dropAccountForm" style="position: absolute; top: 200px; left: 50%; transform: translate(-50%);" class="hidden z-30">
  		<div style="width: 400px;" class="p-10 bg-white rounded-md">
  			<h1 class="text-xl font-semibold">정말 계정을 삭제하시겠습니까?</h1>
  			<p class="pt-6 pb-12">계정 삭제 시, 작성한 모든 글과 댓글은 삭제됩니다. 계정은 복구되지 않습니다.</p>
  			<div class="space-y-4">
  				<form action="${ cl }/dropAccount" method="post" autocomplete="off">
	    			<button type="submit" class="px-6 py-2 bg-red-600 text-white font-semibold rounded w-full hover:bg-red-500">계정 삭제</button>
	    			<input type="hidden" name="memberId" value="${ profileInfo.memberId }">
	    		</form>
	    		<button type="button" onclick="cancelDropAccount()" class="px-6 py-2 bg-gray-100 text-black border font-semibold rounded w-full hover:bg-gray-200">취소</button>
	    	</div>
  		</div>
  	</div>

    <jsp:include page="${ cl }/WEB-INF/common/footer.jsp" />
    <script src="${ cl }/resources/js/profile.js"></script>
</body>
</html>
