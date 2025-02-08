<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
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
	<title>글 작성</title>
</head>
<body>
	<jsp:include page="${ cl }/WEB-INF/common/header.jsp" />
	
	<div class="container mx-auto mt-10">
        <!-- 왼쪽: 작성된 글 실시간 미리보기 -->
        <div class="left">
            <h2 class="text-2xl font-bold mb-4">작성된 글 미리보기</h2>
            <div class="preview" id="preview">
            	<span id="previewCategory" class="mb-4 px-4 py-2 bg-black text-white rounded-full" 
            		style="word-break: break-word; white-space: pre-wrap;">카테고리</span>
            	<h2 id="previewTitle" class="mt-3" 
    				style="word-break: break-word; white-space: pre-wrap;">제목</h2>
                <img id="previewImg" class="hidden w-full object-cover border rounded-md">
                <p id="previewContent" class="block" 
                	style="width: 610px; word-break: break-word; white-space: pre-wrap;">내용</p>
            </div>
        </div>

        <!-- 오른쪽: 게시글 작성 공간 -->
        <div class="right">
            <h2 class="text-2xl font-bold mb-4">게시글 작성</h2>
            <form id="boardForm" action="${ cl }/boardWrite" method="post" autocomplete="off" enctype="multipart/form-data">
                <input type="hidden" name="dateTime" value="<%= LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")) %>" required readonly>
                <div class="mb-4">
                    <label for="img" class="block text-gray-700">이미지</label>
                    <input type="file" id="img" name="img" class="w-full p-2 border border-gray-300 rounded cursor-pointer" onchange="previewImage(event)">
                </div>
                <div class="mb-4">
                    <label for="category" class="block text-gray-700">카테고리</label>
                    <input type="text" id="category" name="category" class="w-full p-2 border border-gray-300 rounded" placeholder="제목을 입력하세요" required>
                </div>
                <div class="mb-4">
                    <label for="title" class="block text-gray-700">제목</label>
                    <input type="text" id="title" name="title" class="w-full p-2 border border-gray-300 rounded" placeholder="제목을 입력하세요" required>
                </div>
                <div class="mb-4">
                    <label for="content" class="block text-gray-700">내용</label>
                    <textarea id="content" name="content" rows="10" class="w-full p-2 border border-gray-300 rounded resize-none" placeholder="내용을 입력하세요" required></textarea>
                </div>
                <button type="submit" class="w-full bg-black text-white py-2 rounded hover:opacity-70">게시글 작성</button>
            </form>
        </div>
    </div>

    <script>
        // 실시간 미리보기 기능
        const titleInput = document.getElementById('title');
        const contentInput = document.getElementById('content');
        const categoryInput = document.getElementById('category');
        const previewTitle = document.getElementById('previewTitle');
        const previewContent = document.getElementById('previewContent');
        const previewCategory = document.getElementById('previewCategory');

        titleInput.addEventListener('input', () => {
            previewTitle.textContent = titleInput.value || '제목';
        });

        contentInput.addEventListener('input', () => {
            previewContent.textContent = contentInput.value || '내용';
        });
        categoryInput.addEventListener('input', () => {
        	previewCategory.textContent = categoryInput.value || '카테고리';
        });
        
        function previewImage(event) {
            const fileInput = event.target;
            const previewImg = document.getElementById('previewImg');
            const maxSize = 30 * 1024 * 1024; // 30MB 제한

            if (fileInput.files && fileInput.files[0]) {
                let fileSize = fileInput.files[0].size;

                // 파일 크기 체크
                if (fileSize > maxSize) {
                    alert("썸네일 이미지 업로드 최대 용량은 30MB 입니다");
                    fileInput.value = ''; // 파일 선택 초기화
                    previewImg.src = '';
                    previewImg.classList.add('hidden');
                    return;
                }

                const reader = new FileReader();
                reader.onload = function(e) {
                    previewImg.src = e.target.result; // 미리보기 설정
                    previewImg.classList.remove('hidden'); // 이미지 표시
                };
                reader.readAsDataURL(fileInput.files[0]); // 파일을 읽어서 미리보기 설정
            } else {
                previewImg.src = '';
                previewImg.classList.add('hidden');
            }
        }
        
        document.getElementById("img").addEventListener("change", previewImage);
        
    </script>
	
	<jsp:include page="${ cl }/WEB-INF/common/footer.jsp" />
</body>
</html>