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

// js 파일 만드는 것조차 귀찮아지고 있다
document.addEventListener('DOMContentLoaded', () => {
    document.querySelectorAll('#ELcommentContent').forEach(textarea => {
        textarea.style.height = 'auto';
        textarea.style.height = textarea.scrollHeight + 'px';
    });
});
function autoResize(textarea) {
    textarea.style.height = 'auto';
    textarea.style.height = (textarea.scrollHeight) + 'px';
}
document.addEventListener('DOMContentLoaded', () => {
    const lightbox = document.getElementById("lightBox");
    const lightboxImg = lightbox.querySelector(".lightBoxImage");
    const lightboxClose = lightbox.querySelector(".lightBoxClose");

    // 이미지를 클릭했을 때 Lightbox 활성화
    document.querySelectorAll("img[alt='이미지링크']").forEach(img => {
        img.addEventListener("click", function() {
            lightboxImg.src = this.src;
            lightboxImg.alt = this.alt;
            lightbox.classList.add("active");
            document.body.style.overflow = "hidden"; // 스크롤 비활성화
        });
    });

    // Lightbox 닫기 버튼
    lightboxClose.addEventListener("click", closeLightbox);

    // Lightbox 외부 영역 클릭 시 닫기
    lightbox.addEventListener("click", (e) => {
        if (e.target === lightbox) {
            closeLightbox();
        }
    });

    // ESC 키를 눌렀을 때 닫기
    document.addEventListener("keydown", (e) => {
        if (e.key === "Escape" && lightbox.classList.contains("active")) {
            closeLightbox();
        }
		console.log(`너가 눌렀던 키야 ${e.key}`);
    });

    // Lightbox 닫기 함수
    function closeLightbox() {
        lightbox.classList.remove("active");
        document.body.style.overflow = ""; // 스크롤 활성화
    }
});