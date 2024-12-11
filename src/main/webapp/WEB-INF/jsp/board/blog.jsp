<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<c:set var="cl" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>${ particularBlog.title }</title>
</head>
<body>
	<jsp:include page="/WEB-INF/common/header.jsp" />
	
	<div class="max-w-3xl mx-auto mt-5 bg-white rounded-lg overflow-hidden">
    	<div class="p-6 bg-gradient-to-r from-indigo-500 to-blue-500 text-white">
      		<div class="flex items-center mt-2">
        		<div class="w-12 h-12 bg-white text-black rounded-full text-xl flex justify-center items-center">
        			${ particularBlog.writer.substring(0, 1) }
        		</div>
        		<div class="ml-3">
          			<a href="${ cl }/profile/${ particularBlog.writer }" class="text-2xl font-medium">${ particularBlog.writer }</a>
          			<p class="text-xl text-indigo-200">
          				<c:choose>
							<c:when test="${ particularBlog.datetime.substring(0, 4) == '2024' }">
								${ particularBlog.datetime.substring(6) }
							</c:when>
							<c:otherwise>
								${ particularBlog.datetime }
							</c:otherwise>
						</c:choose>
          			</p>
        		</div>
      		</div><br>
      		<h1 class="text-2xl font-bold">${ particularBlog.title }</h1>
		</div>
		
		<div class="p-6 border-b border-gray-200">
      		<div class="flex items-center">
      			<h3 class="text-lg font-medium text-gray-600">카테고리 </h3>&nbsp;&nbsp;&nbsp;
      			<span class="px-3 py-1 text-lg bg-blue-100 text-blue-600 rounded-full">#${ particularBlog.category }</span>
      		</div>
    	</div>

    	<div class="p-6">
      		<p class="text-lg text-gray-800 leading-relaxed">
        		${ particularBlog.content }
      		</p>
      		<!-- <img src="https://via.placeholder.com/600x400" alt="블로그 이미지" class="mt-4 w-full rounded-lg shadow"> -->
    	</div>

    	<div class="flex justify-between items-center border-t border-gray-200 px-6 py-4">
      		<form action="${ cl }/blogLike?blogid=${ particularBlog.blogid }">
      			<button type="submit" class="flex items-center text-sm text-gray-500 hover:text-gray-900">
	      			👍 <span class="ml-1">좋아요 ${ particularBlog.likes }</span>
	      		</button>
      		</form>
      		<button class="flex items-center text-sm text-gray-500 hover:text-gray-900">
      			💬 <span class="ml-1">댓글</span>
      		</button>
    	</div>

    	<div class="p-6 border-t border-gray-200">
      		<h3 class="text-lg font-semibold text-gray-800">댓글</h3>
      		
      		<form action="${ cl }/comment" method="post" autocomplete="off" class="mt-3 mb-2">
      			<textarea rows="2" cols="55" name="commentcontent" placeholder="댓글 추가..." class="px-3 py-2 border 
      				border-gray-300 focus:outline-none focus:ring-2 focus:ring-blue-500 resize-none"></textarea><br>
      			<button type="submit" class="border border-gray-300 px-5 py-2 hover:bg-gray-200">댓글 작성</button>
      		</form>
      		
      		<div class="mt-4 space-y-4">
        		<div class="flex items-start">
	          		<img src="https://via.placeholder.com/40" alt="프로필 사진" class="w-10 h-10 rounded-full">
	          		<div class="ml-4">
		            	<h4 class="text-sm font-medium text-gray-900">댓글 작성자</h4>
		            	<p class="text-sm text-gray-700">이 글은 정말 흥미롭네요. 유익한 정보 감사합니다!</p>
		            	<p class="text-xs text-gray-500 mt-1">2시간 전</p>
	          		</div>
	        	</div>
      		</div>
		</div>
	</div>
	
	<div class="max-w-3xl mx-auto bg-white shadow-md overflow-hidden">
  		<div class="p-4 bg-blue-500 text-white font-bold text-lg">
  			최신 블로그 목록
  		</div>
  		
  		<table class="w-full border-collapse border-t">
    		<thead class="bg-gray-100">
      			<tr>
        			<th class="px-4 py-2 text-left text-sm font-medium text-gray-700 border-b">번호</th>
			        <th class="px-4 py-2 text-left text-sm font-medium text-gray-700 border-b">제목</th>
			        <th class="px-4 py-2 text-left text-sm font-medium text-gray-700 border-b">작성자</th>
			        <th class="px-4 py-2 text-left text-sm font-medium text-gray-700 border-b">작성일</th>
			        <th class="px-4 py-2 text-left text-sm font-medium text-gray-700 border-b">조회수</th>
      			</tr>
    		</thead>
			<tbody>
	      	<c:forEach var="pb" items="${ particularBlogAndFindAllBlogs }" varStatus="status">
	      		<c:if test="${status.index < 20}">
		        	<tr class="hover:bg-gray-50 transition duration-200">
		          		<td class="px-4 py-2 text-sm text-gray-900 border-b">${ pb.blogid }</td>
		          		<td class="px-4 py-2 text-sm text-blue-600 font-medium border-b">
		          			<a href="${ cl }/blog/board?blogid=${ pb.blogid }&writer=${ pb.writer }&title=${ pb.title }">${ pb.title }</a>
		          		</td>
		          		<td class="px-4 py-2 text-sm text-gray-900 border-b">${ pb.writer }</td>
		          		<td class="px-4 py-2 text-sm text-gray-900 border-b">
							${ pb.datetime.length() >= 6 && pb.datetime.substring(0, 4) == '2024' ? pb.datetime.substring(6) : pb.datetime }
		          		</td>
		          		<td class="px-4 py-2 text-sm text-gray-900 border-b">${ pb.views }</td>
		        	</tr>
				</c:if>
	      	</c:forEach>
    		</tbody>
  		</table>
	</div>
	
	<jsp:include page="/WEB-INF/common/footer.jsp" />
</body>
</html>