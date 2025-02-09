marked.setOptions({
	gfm: true,
	breaks: true  // 줄바꿈 유지
});

document.addEventListener('DOMContentLoaded', function() {
	const markdownText = document.getElementById('mdContent').textContent || '내용을 입력하세요';
	const previewContent = document.getElementById('content');
	try {
		const htmlContent = DOMPurify.sanitize(marked.parse(markdownText));
		previewContent.innerHTML = htmlContent;
	} catch (error) {
		console.error('Markdown 변환 중 오류:', error);
		previewContent.textContent = markdownText;
	}
});