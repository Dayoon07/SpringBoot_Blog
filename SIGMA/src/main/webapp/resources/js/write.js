const titleInput = document.getElementById('title');
const contentInput = document.getElementById('content');
const categoryInput = document.getElementById('category');
const previewTitle = document.getElementById('previewTitle');
const previewContent = document.getElementById('previewContent');
const previewCategory = document.getElementById('previewCategory');
const previewImg = document.getElementById('previewImg');
const previewVideo = document.getElementById('previewVideo');

titleInput.addEventListener('input', () => {
	previewTitle.textContent = titleInput.value || '제목을 입력하세요';
});

contentInput.addEventListener('input', () => {
	const markdownText = contentInput.value || '내용을 입력하세요';

	try {
		// markdown을 HTML로 변환 DOMPurify는 footer에
		const htmlContent = DOMPurify.sanitize(marked.parse(markdownText));
		previewContent.innerHTML = htmlContent;
	} catch (error) {
		console.error('Markdown 변환 중 오류:', error);
		previewContent.textContent = markdownText;
	}
});
categoryInput.addEventListener('input', () => {
	previewCategory.textContent = categoryInput.value || '카테고리를 입력하세요';
});

function previewFile(event) {
	const fileInput = event.target;
	const isVideo = fileInput.id === 'video';
	const previewElement = isVideo ? previewVideo : previewImg;
	const maxSize = 30 * 1024 * 1024; // 30MB
	const fileType = isVideo ? '영상' : '이미지';

	if (fileInput.files && fileInput.files[0]) {
		let fileSize = fileInput.files[0].size;

		if (fileSize > maxSize) {
			alert(`${fileType} 파일 업로드 최대 용량은 30MB 입니다`);
			fileInput.value = '';
			previewElement.src = '';
			previewElement.classList.add('hidden');

			if (isVideo) {
				previewVideo.load();
			}
			return;
		}

		const reader = new FileReader();
		reader.onload = function(e) {
			previewElement.src = e.target.result;
			previewElement.classList.remove('hidden');

			if (isVideo) {
				previewVideo.load();
			}
		};
		reader.readAsDataURL(fileInput.files[0]);
	} else {
		previewElement.src = '';
		previewElement.classList.add('hidden');
		if (isVideo) {
			previewVideo.load();
		}
	}
}

// 파일 입력 요소에 이벤트 리스너 추가
document.getElementById("img").addEventListener("change", previewFile);
document.getElementById("video").addEventListener("change", previewFile);

function insertMarkdown(startTag, endTag) {
	const textarea = document.getElementById('content');
	const startPos = textarea.selectionStart;
	const endPos = textarea.selectionEnd;
	const selectedText = textarea.value.substring(startPos, endPos);

	// 마크다운 문법 적용
	const newText = startTag + selectedText + endTag;

	// 새로운 내용 삽입
	textarea.value = textarea.value.substring(0, startPos) + newText + textarea.value.substring(endPos);

	// 커서 위치 조정
	textarea.focus();
	textarea.setSelectionRange(startPos + startTag.length, startPos + newText.length - endTag.length);
}

document.addEventListener("submit", (e) => {
	const r = /^[^\s]+$/;
	if (!r.test(categoryInput.value)) {
		e.preventDefault();
		alert("카테고리에는 공백이 들어갈 수 없습니다");
	}
});