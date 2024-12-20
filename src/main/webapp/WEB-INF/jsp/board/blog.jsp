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
	<title>${ particularBlog.title }</title>
</head>
<body class="bg-[#eeeeee]">
	<jsp:include page="/WEB-INF/common/header.jsp" />

	<div class="max-w-screen-lg border-r border-l border-b mx-auto bg-white overflow-hidden">
		<div class="p-6 rounded-t-lg border-b"> <!-- bg-gradient-to-r from-indigo-500 to-blue-500 text-white -->
			<div class="flex items-center mt-2">
				<div class="w-12 h-12 bg-gray-400 text-black rounded-full text-2xl flex justify-center items-center font-bold">
					<c:if test="${ not empty particularBlog.writer }">
					    ${ particularBlog.writer.substring(0, 1).toUpperCase() }
					</c:if>
				</div>
				<div class="ml-3">
					<c:if test="${ not empty blogWriterInfo }">
						<a href="${ cl }/profile?username=${ blogWriterInfo.username }&memberid=${ blogWriterInfo.memberid }" class="text-2xl font-semibold">
							${ particularBlog.writer }
						</a>
					</c:if>
					<p class="text-md text-gray-800">
						${ particularBlog.datetime.substring(0, 4) == LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy")) ? particularBlog.datetime.substring(6) : particularBlog.datetime }
					</p>
				</div>
			</div>
			<h1 class="mt-4 text-3xl font-bold">${ particularBlog.title }</h1><br>
			<div class="flex items-center pb-2">
				<h3 class="text-lg font-medium text-gray-600">카테고리 </h3>&nbsp;&nbsp;&nbsp;
				<span class="px-4 py-2 text-lg bg-blue-100 text-blue-600 rounded-full">#${ particularBlog.category }</span>
			</div>
		</div>

		<div class="p-6 text-lg text-gray-800">${ particularBlog.content }</div>

		<div class="p-6 border-gray-200 border-t">
			<div class="flex justify-start items-center">
				<h3 class="text-lg font-semibold text-gray-800 mr-10">댓글 ${ allComment.size() }개</h3>
				<form action="${ cl }/blogLike?blogid=${ particularBlog.blogid }" method="post" autocomplete="off">
					<input type="hidden" name="blogid" value="${ particularBlog.blogid }">
					<input type="hidden" name="writer" value="${ particularBlog.writer }">
					<input type="hidden" name="title" value="${ particularBlog.title }">
					<button type="submit" class="flex items-center text-lg text-gray-500 hover:text-gray-900">
						👍 <span class="ml-1">좋아요 ${ particularBlog.likes }</span>
					</button>
				</form>
				<h3 class="text-lg text-gray-500 ml-10">조회수 ${ particularBlog.views }회</h3>
			</div>
			<c:if test="${ empty sessionScope.userSession }">
				<div class="my-3 ml-5"><a href="${ cl }/signup" class="text-lg text-gray-500 hover:underline hover:text-black">댓글 작성은 로그인 후 작성할 수 있습니다.</a></div>
			</c:if>
			<c:if test="${ not empty sessionScope.userSession }">
				<form action="${ cl }/commentAdd?blogid=${ particularBlog.blogid }&writer=${ particularBlog.writer }&title=${ particularBlog.title }"
				method="post" autocomplete="off" class="mt-3 mb-2">
					<input type="hidden" name="blogid" value="${ particularBlog.blogid }">
					<input type="hidden" name="writer" value="${ particularBlog.writer }">
					<input type="hidden" name="title" value="${ particularBlog.title }">
					<input type="hidden" name="blogboardTitle" value="${ particularBlog.title }">
					<input type="hidden" name="commenter" value="${ sessionScope.userSession.username }">
					<textarea rows="2" cols="55" name="commentcontent" placeholder="댓글 추가..." class="px-3 py-2 border rounded-lg 
						border-gray-300 focus:outline-none focus:ring-2 focus:ring-blue-500 resize-none"></textarea><br>
					<button type="submit" class="border border-gray-300 px-5 py-2 hover:bg-gray-200 rounded-lg">댓글 작성</button>
				</form>
			</c:if>
			<div class="mt-4">
				<c:if test="${ empty allComment }"></c:if>
				<c:if test="${ not empty allComment }">
					<c:forEach var="comment" items="${ allComment }">
						<div class="w-full mx-auto bg-gray-50 p-4 mb-5 shadow-md border">
						    <div class="flex items-center mb-3 border-b border-gray-300 pb-2">
						        <h4 class="text-lg font-medium ${ comment.commenter.equals(particularBlog.writer) ? 'text-indigo-600' : 'text-gray-900' }">
						            ${ comment.commenter.equals(particularBlog.writer) ? "글쓴이" : comment.commenter }
						        </h4>
						        <p class="text-sm text-gray-500 ml-3">
						            ${ comment.commentDatetime.substring(0, 4).equals(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy"))) ? comment.commentDatetime.substring(6) : comment.commentDatetime }
						        </p>
						    </div>
						    <div class="text-gray-800 text-lg leading-relaxed break-words">
						        ${ comment.commentContent }
						    </div>
						</div>
					</c:forEach>
				</c:if>
			</div>
		</div>
		
		<div class="w-full border-gray-500 border-t">
			<div class="w-full flex justify-center items-center	p-2 border-gray-200 border-b">
				<div class="w-1/12">번호</div>
				<div class="w-4/12">제목</div>
				<div class="w-2/12">작성자</div>
				<div class="w-3/12">작성일</div>
				<div class="w-1/12">조회수</div>
			</div>
			<c:forEach var="pb" items="${ particularBlogAndFindAllBlogs }" varStatus="status">
				<c:if test="${ status.index < 20 }">
					<!-- 번호, 제목, 작성자, 작성일, 조회수 -->
					<a href="${ cl }/blog/board?blogid=${ pb.blogid }&writer=${ pb.writer }&title=${ pb.title }" class="w-full flex 
						justify-center items-center	p-2 border-gray-200 border-b hover:bg-gray-200 hover:underline">
						<div class="w-1/12">${ pb.blogid }</div>
						<div class="w-4/12">${ pb.title.length() > 20 ? pb.title.substring(0, 20) : pb.title }</div>
						<div class="w-2/12">${ pb.writer.length() > 10 ? pb.writer.substring(0, 9) : pb.writer }</div>
						<div class="w-3/12">${ pb.datetime.substring(0, 4) == LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy")) ? pb.datetime.substring(6) : pb.datetime.substring(0, 13) }</div>
						<div class="w-1/12">${ pb.views }</div>
					</a>
				</c:if>
			</c:forEach>
		</div>
	</div>

	<jsp:include page="/WEB-INF/common/footer.jsp" />
</body>
</html>