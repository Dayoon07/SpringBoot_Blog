<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<c:set var="cl" value="${ pageContext.request.contextPath }" />

	<header class="container mx-auto p-2 pl-10 bg-white border-b flex justify-between items-center" id="header" style="height: 60px;">
		<div>
			<a href="${ cl }/" class="text-2xl font-semibold text-blue-600 hover:text-blue-800">SIGMA</a>
	  	</div>
	  	
	  	<c:if test="${ empty sessionScope.user }">
	  		<div class="flex items-center space-x-4">
	  			<a href="${ cl }/signin">
	  				<button type="button" class="py-2 text-lg text-black hover:bg-gray-200 rounded-md px-4">로그인</button>
	      		</a>
	      		<a href="${ cl }/signup">
	        		<button type="button" class="py-2 text-lg text-black hover:bg-gray-200 rounded-md px-4">회원가입</button>
	      		</a>
	    	</div>
	  	</c:if>
	
		<c:if test="${ not empty sessionScope.user }">
			<div class="flex items-center space-x-6 mr-6">
	      		<div class="space-x-4">
	        		<a href="${ cl }/searchPage" class="text-lg font-medium text-gray-700 hover:text-black hover:underline">검색</a>
	        		<a href="${ cl }/write" class="text-lg font-medium text-gray-700 hover:text-black hover:underline">글 작성</a>
	      		</div>
	      		<div class="flex items-center space-x-4">
	        		<div>
	          			<a href="${ cl }/profile/${ sessionScope.user.username }" class="text-lg font-semibold text-gray-800">
	            			${ sessionScope.user.username }
	          			</a>
	        		</div>
	        		<div class="relative">
	        			<img src="${ sessionScope.user.profile }" class="w-10 h-10 rounded-full object-cover cursor-pointer" onclick="openProfile()">
	        			<div id="profileDiv" class="hidden fixed top-0 right-0 w-full h-full bg-transparent z-10" onclick="closeProfile()"></div>
						<div id="profileRealDiv" class="hidden absolute top-14 right-0 w-60 bg-white rounded-lg border z-20">
							<a href="${ cl }/profile/${ sessionScope.user.username }">
								<button type="button" class="w-full px-4 py-2 cursor-pointer hover:bg-gray-200 text-left">내 블로그</button>
							</a>
							<form action="${ cl }/logout" method="post" autocomplete="off">
								<input type="hidden" name="memberId" value="${ sessionScope.user.memberId }">
								<button type="submit" class="btn w-full px-4 py-2 cursor-pointer hover:bg-gray-200 text-left">로그아웃</button>
							</form>
						</div>
	        		</div>
	      		</div>
	    	</div>
	    </c:if>
	</header>