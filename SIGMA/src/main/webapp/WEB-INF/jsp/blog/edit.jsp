<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDateTime" %>
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
    <link rel="stylesheet" href="${ cl }/resources/css/write.css">
    <link rel="stylesheet" href="${ cl }/resources/css/custom.css">
	<title>글 수정 - SIGMA</title>
</head>
<body>
	<jsp:include page="${ cl }/WEB-INF/common/header.jsp" />
	
	<div class="container mx-auto mt-5 px-4">
        <div class="lg:flex space-x-8">
            <!-- 왼쪽 (미리보기 영역) -->
            <div style="height: 750px;" class="flex-1 p-4 rounded-lg overflow-y-scroll">
                <h2 class="text-3xl font-bold mb-4 text-gray-800">작성된 글 미리보기</h2>
                <div id="preview" class="border p-5 rounded">
                    <span id="previewCategory" class="bg-gray-300 text-gray-700 px-3 py-1 rounded-full text-sm cursor-pointer">카테고리</span>
                    <h2 id="previewTitle" class="mt-3 text-2xl font-semibold text-gray-900" style="word-break: break-word; white-space: pre-wrap;">제목</h2>
                    <img id="previewImg" class="hidden w-full object-cover border rounded-md" />
                    <video id="previewVideo" class="hidden w-full object-cover border rounded-md mb-4" controls></video>
                    <p id="previewContent" class="block mt-4 text-gray-700" style="width: 610px; word-break: break-word; white-space: pre-wrap;">내용</p>
                </div>	
            </div>

            <!-- 오른쪽 (게시글 작성 폼) -->
            <div class="flex-1 bg-white p-4 rounded-lg">
                <h2 class="text-3xl font-bold mb-4 text-gray-800">게시글 작성</h2>
                <form id="boardForm" action="${ cl }/boardEdit" method="post" autocomplete="off" enctype="multipart/form-data">
                    <input type="hidden" name="dateTime" value="${ editedBoardInfo.dateTime }" required readonly>
                    <input type="hidden" name="blogId" value="${ editedBoardInfo.blogId }" required readonly>
                    <input type="hidden" name="writer" value="${ editedBoardInfo.writer }" required readonly>
                    <input type="hidden" name="writerId" value="${ editedBoardInfo.writerId }" required readonly>
                    <input type="hidden" name="writerProfile" value="${ editedBoardInfo.writerProfile }" required readonly>
                    <input type="hidden" name="views" value="${ editedBoardInfo.views }" required readonly>
                    <input type="hidden" name="likes" value="${ editedBoardInfo.likes }" required readonly>
                    <input type="hidden" name="commentCount" value="${ editedBoardInfo.commentCount }" required readonly>

					<div class="mb-6">
                        <label for="title" class="block text-lg font-semibold text-gray-700">제목</label>
                        <input type="text" id="title" name="title" value="${ editedBoardInfo.title }" 
                        	class="w-full p-3 border-gray-300 border-b focus:border-black focus:outline-none" 
                        	placeholder="제목을 입력하세요" required maxlength="100">
                    </div>
                    
                    <div class="mb-6">
                        <label for="category" class="block text-lg font-semibold text-gray-700">카테고리</label>
                        <input type="text" id="category" name="category" value="${ editedBoardInfo.category }"
                        	class="w-full p-3 border-gray-300 border-b focus:border-black focus:outline-none" 
                        	placeholder="카테고리를 입력하세요" required maxlength="15">
                    </div>
                    
                    <div class="flex items-center mb-6">
                    	<div>
	                    	<label for="img" class="inline-block px-4 py-2 bg-black text-white font-semibold cursor-pointer hover:opacity-70 rounded transition">
				        		이미지 업로드
				    		</label>
				    		<c:if test="${ not empty editedBoardInfo.img }">
				    			<input type="file" id="img" name="img" value="${ editedBoardInfo.img }" accept="image/*" class="hidden" onchange="previewImage(event)">
				    		</c:if>
				    		<c:if test="${ empty editedBoardInfo.img }">
				    			<input type="file" id="img" name="img" accept="image/*" class="hidden" onchange="previewImage(event)">
				    		</c:if>
                    	</div>
                    	<div class="mx-5">
                    		<label for="video" class="inline-block px-4 py-2 bg-black text-white font-semibold cursor-pointer hover:opacity-70 rounded transition">
				        		비디오 업로드
				    		</label>
				    		<c:if test="${ not empty editedBoardInfo.video }">
				    			<input type="file" id="video" name="video" value="${ editedBoardInfo.video }" accept="video/*" class="hidden" onchange="previewImage(event)">
				    		</c:if>
				    		<c:if test="${ empty editedBoardInfo.video }">
				    			<input type="file" id="video" name="video" accept="video/*" class="hidden" onchange="previewImage(event)">
				    		</c:if>
                    	</div>
                    </div>

                    <div class="mb-6">
					    <label for="content" class="block text-lg font-semibold text-gray-700">내용</label>
					
					    <div id="toolbar" class="md:flex gap-2 pb-2">
					        <button type="button" class="px-3 py-1 bg-gray-200 rounded hover:bg-gray-300" onclick="insertMarkdown('**', '**')">굵게</button>
						    <button type="button" class="px-3 py-1 bg-gray-200 rounded hover:bg-gray-300" onclick="insertMarkdown('--- ', '')">구분선</button>
						    <button type="button" class="px-3 py-1 bg-gray-200 rounded hover:bg-gray-300" onclick="insertMarkdown('*', '*')">기울림</button>
						    <button type="button" class="px-3 py-1 bg-gray-200 rounded hover:bg-gray-300" onclick="insertMarkdown('~~', '~~')">취소선</button>
						    <button type="button" class="px-3 py-1 bg-gray-200 rounded hover:bg-gray-300" onclick="insertMarkdown('> ', '')">인용문</button>
						    <button type="button" class="px-3 py-1 bg-gray-200 rounded hover:bg-gray-300" onclick="insertMarkdown('```\n', '\n```')">코드 블록</button>
						    <button type="button" class="px-3 py-1 bg-gray-200 rounded hover:bg-gray-300" onclick="insertMarkdown(' - ', '')">리스트</button>
					    </div>
					    <div id="toolbar" class="md:flex gap-2 pb-2">
					    	<button type="button" class="px-3 py-1 bg-gray-200 rounded hover:bg-gray-300" onclick="insertMarkdown('# ', '')">H1</button>
						    <button type="button" class="px-3 py-1 bg-gray-200 rounded hover:bg-gray-300" onclick="insertMarkdown('## ', '')">H2</button>
						    <button type="button" class="px-3 py-1 bg-gray-200 rounded hover:bg-gray-300" onclick="insertMarkdown('### ', '')">H3</button>
						    <button type="button" class="px-3 py-1 bg-gray-200 rounded hover:bg-gray-300" onclick="insertMarkdown('[링크텍스트](https://)', '')">링크</button>
						    <button type="button" class="px-3 py-1 bg-gray-200 rounded hover:bg-gray-300" onclick="insertMarkdown('![이미지링크](https://)', '')">이미지</button>
					    </div>
					
					    <textarea id="content" name="content" rows="10" class="w-full p-3 border-gray-300 border resize-none focus:outline-none" placeholder="내용을 입력하세요" required>${ editedBoardInfo.content }</textarea>
					</div>
                    <button type="submit" class="w-full bg-black text-white py-3 rounded-lg hover:bg-opacity-80 transition duration-300">글 수정</button>
                </form>
            </div>
        </div>
    </div>
    
	<jsp:include page="${ cl }/WEB-INF/common/footer.jsp" />
    <script src="${ cl }/resources/js/edit.js"></script>
</body>
</html>