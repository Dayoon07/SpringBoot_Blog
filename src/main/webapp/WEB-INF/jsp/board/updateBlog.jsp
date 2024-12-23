<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<c:set var="cl" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>${ changeMyBlog.title } - 수정</title>
</head>
<body class="bg-[#eeeeee]">
	<jsp:include page="/WEB-INF/common/header.jsp" />

	<div class="max-w-screen-lg border-r border-l border-b mx-auto bg-white overflow-hidden shadow-lg">
	    <form action="${ cl }/changeMyBlog?blogid=${ changeMyBlog.blogid }" method="post" autocomplete="off">
	    	<div class="p-6 rounded-t-lg border-b text-black">
				<p class="text-lg font-semibold">작성자 : <input type="text" name="writer" value="${ changeMyBlog.writer }" readonly></p>
		        <p class="text-md">작성일 : <input type="text" name="datetime" value="${ changeMyBlog.datetime }" readonly></p>
		        <img src="${ changeMyBlogImg.filepath }" alt="${ changeMyBlogImg.filename }" style="max-width: 100%;">
		        <h1 class="mt-4 text-3xl font-bold">
		        	제목 <textarea name="title" class="block p-3 w-full h-auto text-lg text-gray-900 bg-gray-50 rounded-lg border border-gray-300 
			        focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white 
			        dark:focus:ring-blue-500 dark:focus:border-blue-500 mt-5 mb-5 resize-none mx-auto">${ changeMyBlog.title }</textarea>
		        </h1>
		        <div class="flex items-center pt-4">
		            <h3 class="text-lg font-medium">카테고리</h3>
		            &nbsp;&nbsp;&nbsp;
		            #<input type="text" name="category" value="${ changeMyBlog.category }" readonly>
		        </div>
		    </div>
		    <div class="px-6 pb-6 pt-2">
		    	<h1 class="mt-4 text-3xl font-bold">내용</h1>
		        <textarea name="content" class="block p-3 w-full h-auto text-lg text-gray-900 bg-gray-50 rounded-lg border border-gray-300 
		        	focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white 
		        	dark:focus:ring-blue-500 dark:focus:border-blue-500 mt-5 mb-5 resize-none mx-auto">${ changeMyBlog.content }</textarea>
		        <button type="submit" class="bg-white shadow border w-24 text-black text-xl px-4 py-2 mt-3 
		        	rounded-lg hover:bg-blue-600 hover:text-white transition duration-300 ease-in-out">수정</button>
		    </div>
	    </form>
	</div>

	<jsp:include page="/WEB-INF/common/footer.jsp" />
</body>
</html>