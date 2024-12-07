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
	    	<p>안녕하세요 ${ userProfileList.username }님 권한이 허용되었습니다.</p>
	    </c:if>
	</c:if>
	
	<div class="max-w-screen-md mx-auto bg-white dark:bg-gray-800 shadow-lg rounded-lg overflow-hidden my-10">
	    <div class="w-full mx-auto max-w-screen-xl p-6 space-y-6">
	    	<c:if test="${ not empty sessionScope.userSession }">
			    <c:if test="${ not empty sessionScope.userSession && sessionScope.userSession.memberid == userProfileList.memberid}">
			    	<p>안녕하세요 ${ userProfileList.username }님</p>
			    </c:if>
			</c:if>
	        <div class="flex items-center space-x-4">
	            <div class="w-16 h-16 rounded-full bg-gray-300 dark:bg-gray-700 flex items-center justify-center">
	                <span class="text-xl font-semibold text-gray-800 dark:text-gray-200">
	                    ${userProfileName}
	                </span>
	            </div>
	            
	            <div>
	                <h1 class="text-2xl font-bold text-gray-900 dark:text-white">
	                    ${userProfileList.username}
	                </h1>
	                <p class="text-gray-500 dark:text-gray-400 text-sm">
	                    가입일: ${userProfileList.joindate}
	                </p>
	            </div>
	        </div>
	        
	        <div class="border-t border-gray-200 dark:border-gray-700 pt-4">
	            <h2 class="text-xl font-semibold text-gray-700 dark:text-gray-300 mb-2">
	                프로필 소개
	            </h2>
	            <p class="text-gray-600 dark:text-gray-400 leading-relaxed">
	                ${userProfileList.profilebio}
	            </p>
	        </div>
	    </div>
	
	    <div class="bg-gray-100 dark:bg-gray-700 p-4 text-right">
	        <button class="px-4 py-2 bg-blue-500 hover:bg-blue-600 text-white font-semibold rounded-lg shadow-md transition duration-300">
	            프로필 편집
	        </button>
	    </div>
	</div>

	
	<jsp:include page="/WEB-INF/common/footer.jsp" />
</body>
</html>