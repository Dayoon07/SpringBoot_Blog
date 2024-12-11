<%@page import="com.e.d.controller.MainController"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<c:set var="cl" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>메인페이지</title>
</head>
<body>
	<jsp:include page="/WEB-INF/common/header.jsp" />
	
	<div class="w-full mx-auto">
	    <div id="default-carousel" class="w-full relative overflow-hidden shadow-lg" data-carousel="static">
	        <!-- Carousel wrapper -->
	        <div class="relative h-64 w-full" data-carousel-inner>
	            <!-- Item 1 -->
	            <div class="hidden duration-700 ease-in-out w-full" data-carousel-item>
	                <img src="${ cl }/resources/img/pexels-5.jpg"
	                    class="object-cover w-full h-full" alt="Slide 1">
	            </div>
	            <!-- Item 2 -->
	            <div class="hidden duration-700 ease-in-out" data-carousel-item>
	                <img src="${ cl }/resources/img/pexels-7.jpg"
	                    class="object-cover w-full h-full" alt="Slide 2">
	            </div>
	            <!-- Item 3 -->
	            <div class="hidden duration-700 ease-in-out" data-carousel-item>
	                <img src="${ cl }/resources/img/pexels-16.jpg"
	                    class="object-cover w-full h-full" alt="Slide 3">
	            </div>
	            <!-- Item 4 -->
	            <div class="hidden duration-700 ease-in-out" data-carousel-item>
	                <img src="${ cl }/resources/img/pexels-18.jpg"
	                    class="object-cover w-full h-full" alt="Slide 3">
	            </div>
	        </div>
	        <!-- Slider controls -->
	        <button type="button"
	            class="flex absolute top-1/2 left-3 z-40 items-center justify-center w-10 h-10 bg-gray-200/50 rounded-full hover:bg-gray-300 focus:outline-none transition"
	            data-carousel-prev>
	            <svg class="w-5 h-5 text-gray-600" fill="none" stroke="currentColor" viewBox="0 0 24 24"
	                xmlns="http://www.w3.org/2000/svg">
	                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7"></path>
	            </svg>
	        </button>
	        <button type="button"
	            class="flex absolute top-1/2 right-3 z-40 items-center justify-center w-10 h-10 bg-gray-200/50 rounded-full hover:bg-gray-300 focus:outline-none transition"
	            data-carousel-next>
	            <svg class="w-5 h-5 text-gray-600" fill="none" stroke="currentColor" viewBox="0 0 24 24"
	                xmlns="http://www.w3.org/2000/svg">
	                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"></path>
	            </svg>
	        </button>
	    </div>
	</div>
	
	<div class="m-10 mx-auto max-w-screen-lg">
		<c:if test="${ not empty findAllBlogs }">
			<c:forEach var="blog" items="${ findAllBlogs }">
				<a href="${ cl }/blog/board?blogid=${ blog.blogid }&writer=${ blog.writer }&title=${ blog.title }">
					<div class="mx-auto bg-white mx-5 border border-gray-300 rounded-lg mb-5 py-4 px-6 hover:bg-gray-200">
			    		<div class="flex items-center mb-3">
			      			<div class="w-10 h-10 bg-gray-500 text-white rounded-full flex justify-center items-center">${ blog.writer.substring(0, 1) }</div>
			      			<div class="ml-3 flex justify-between items-center">
			        			<p class="text-xl font-medium mr-3">${ blog.writer }</p>
			        			<!-- <p class="text-md text-gray-500">
								    <c:choose>
								        <c:when test="${ blog.datetime.substring(0, 4) == '2024' }">
								            ${ blog.datetime.substring(6) }
								        </c:when>
								        <c:otherwise>
								            ${ blog.datetime }
								        </c:otherwise>
								    </c:choose>
								</p> -->
								<p class="text-md text-gray-500">
								    ${ blog.datetime.length() >= 6 && blog.datetime.substring(0, 4) == '2024' ? blog.datetime.substring(6) : blog.datetime }
								</p>
			      			</div>
			    		</div>
			    		<p class="text-xl text-gray-800 mb-3">${ blog.title }</p><br>
			    		<p class="text-xl text-gray-800 mb-3">
			    			${ blog.content.length() > 100 ? blog.content.substring(0, 100) + "..." : blog.content }
						</p>
						<div class="flex space-x-4 text-lg text-gray-500">
				      		<button class="hover:text-gray-800">👍 좋아요 ${ blog.likes }</button>
				      		<button class="hover:text-gray-800">💬 댓글 </button>
				      		<button class="hover:text-gray-800">조회수 ${ blog.views } </button>
				    	</div>
			  		</div>
		  		</a>
			</c:forEach>
		</c:if>
	</div>
	
	<c:if test="${ not empty findAllBlogs }">
		<div class="flex justify-center">
			${ pageBar }
		</div>
	</c:if>
	
	<c:if test="${ empty findAllBlogs }">
		<h1>저장된 글이 없습니다.</h1>
	</c:if>
	
	
	<jsp:include page="/WEB-INF/common/footer.jsp" />
</body>
</html>