document.addEventListener("DOMContentLoaded", function () {
    const noticeList = Array.from(document.querySelectorAll('#noticeList .list-group-item')); // 공지사항 항목들을 가져옴
    const itemsPerPage = 20; // 페이지당 항목 수
    let currentPage = 1; // 현재 페이지 번호

    function renderNoticeList(page) {
        const startIndex = (page - 1) * itemsPerPage;
        const endIndex = page * itemsPerPage;

        // 모든 공지사항 항목을 숨기고 해당 페이지 항목만 표시
        noticeList.forEach((item, index) => {
            item.style.display = (index >= startIndex && index < endIndex) ? 'block' : 'none';
        });

        // 스크롤을 페이지 상단으로 이동
        window.scrollTo({ top: 0, behavior: 'smooth' });
    }

    function renderPagination(totalItems) {
        const paginationContainer = document.getElementById('noticePagination');
        paginationContainer.innerHTML = ''; // 기존 페이지네이션 버튼 삭제
        const totalPages = Math.ceil(totalItems / itemsPerPage);

        for (let i = 1; i <= totalPages; i++) {
            const pageItem = document.createElement('li');
            pageItem.className = `page-item ${i === currentPage ? 'active' : ''}`;
            
            const pageLink = document.createElement('a');
            pageLink.className = 'page-link';
            pageLink.href = '#';
            pageLink.textContent = i;

            // 페이지 버튼 클릭 이벤트
            pageLink.addEventListener('click', (e) => {
                e.preventDefault();
                currentPage = i; // 클릭한 페이지로 이동
                renderNoticeList(currentPage);
                renderPagination(noticeList.length); // 페이지네이션 갱신
            });

            pageItem.appendChild(pageLink);
            paginationContainer.appendChild(pageItem);
        }
    }

    // 초기 공지사항 목록과 페이지네이션 렌더링
    renderNoticeList(currentPage);
    renderPagination(noticeList.length);
});
