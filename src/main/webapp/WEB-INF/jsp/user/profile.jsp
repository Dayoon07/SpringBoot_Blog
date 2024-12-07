<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<c:set var="cl" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>${ userProfileList.username } 프로필</title>
</head>
<body>
	<jsp:include page="/WEB-INF/common/header.jsp" />
	
	<c:if test="${ not empty sessionScope.userSession }">
	    <c:if test="${ not empty sessionScope.userSession && sessionScope.userSession.memberid == userProfileList.memberid}">
	    	안녕하세요 ${ userProfileList.username }님 권한이 허용되었습니다.
	    </c:if>
	</c:if>
	
	<div class="bg-white dark:bg-gray-800 shadow-lg rounded-lg overflow-hidden m-4">
	    <div class="w-full mx-auto max-w-screen-xl p-6 md:flex md:items-center">
	        <!-- 프로필 이미지 및 이름 -->
	        <div class="flex-shrink-0 mb-4 md:mb-0 md:mr-6 items-center justify-center">
	            ${ userProfileName }
	        </div>
	
	        <!-- 프로필 정보 -->
	        <div class="flex-grow">
	            <!-- 사용자 이름 -->
	            <h1 class="text-3xl font-bold text-gray-900 dark:text-white mb-2">
	                ${userProfileList.username}
	            </h1>
	            <p>가입일 : ${ userProfileList.joindate }</p>
	            
	            <!-- 프로필 소개 -->
	            <h2 class="text-xl font-semibold text-gray-700 dark:text-gray-300 mb-4">프로필 소개</h2>
	            <p class="text-gray-600 dark:text-gray-400 leading-relaxed">
	                ${userProfileList.profilebio}
	            </p>
	        </div>
	    </div>
	
	    <!-- 버튼 영역 -->
	    <div class="bg-gray-100 dark:bg-gray-700 p-4 text-right">
	        <button class="px-4 py-2 bg-blue-500 hover:bg-blue-600 text-white font-semibold rounded-lg shadow-md transition duration-300">
	            프로필 편집
	        </button>
	    </div>
	</div>

	
	<jsp:include page="/WEB-INF/common/footer.jsp" />
</body>
</html>