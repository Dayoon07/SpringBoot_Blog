document.addEventListener("DOMContentLoaded", function () {
    const blogList = Array.from(document.querySelectorAll('#blog-list .col-md-6')); // 블로그 항목들을 가져옴
    const itemsPerPage = 24; // 페이지당 항목 수
    let currentPage = 1; // 현재 페이지 번호
    const maxPageButtons = 7; // 한 번에 표시할 최대 페이지 버튼 수

    function renderBlogList(page) {
        const blogListContainer = document.getElementById('blog-list');
        const startIndex = (page - 1) * itemsPerPage;
        const endIndex = page * itemsPerPage;

        // 모든 블로그 항목을 숨기고 해당 페이지 항목만 표시
        blogList.forEach((item, index) => {
            if (index >= startIndex && index < endIndex) {
                item.style.display = 'block'; // 해당 페이지에 해당하는 항목만 표시
            } else {
                item.style.display = 'none'; // 나머지 항목은 숨김
            }
        });
        
        // 스크롤을 페이지 상단으로 이동
        window.scrollTo({ top: 0, behavior: 'smooth' });
    }

    function renderPagination(totalItems) {
        const paginationContainer = document.getElementById('pagination');
        paginationContainer.innerHTML = ''; // 기존 페이지네이션 버튼 삭제
        const totalPages = Math.ceil(totalItems / itemsPerPage);

        // 이전 버튼
        const prevPageItem = document.createElement('li');
        prevPageItem.className = `page-item ${currentPage === 1 ? 'disabled' : ''}`;
        const prevPageLink = document.createElement('a');
        prevPageLink.className = 'page-link';
        prevPageLink.href = '#';
        prevPageLink.textContent = '<';
        prevPageLink.addEventListener('click', (e) => {
            e.preventDefault();
            if (currentPage > 1) {
                currentPage--;
                renderBlogList(currentPage);
                renderPagination(blogList.length);
            }
        });
        prevPageItem.appendChild(prevPageLink);
        paginationContainer.appendChild(prevPageItem);

        // 현재 페이지 기준으로 앞뒤로 maxPageButtons 범위 내에서만 버튼 표시
        const startPage = Math.max(1, currentPage - Math.floor(maxPageButtons / 2));
        const endPage = Math.min(totalPages, startPage + maxPageButtons - 1);

        for (let i = startPage; i <= endPage; i++) {
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
                renderBlogList(currentPage);
                renderPagination(blogList.length); // 페이지네이션 갱신
            });

            pageItem.appendChild(pageLink);
            paginationContainer.appendChild(pageItem);
        }

        // 다음 버튼
        const nextPageItem = document.createElement('li');
        nextPageItem.className = `page-item ${currentPage === totalPages ? 'disabled' : ''}`;
        const nextPageLink = document.createElement('a');
        nextPageLink.className = 'page-link';
        nextPageLink.href = '#';
        nextPageLink.textContent = '>';
        nextPageLink.addEventListener('click', (e) => {
            e.preventDefault();
            if (currentPage < totalPages) {
                currentPage++;
                renderBlogList(currentPage);
                renderPagination(blogList.length);
            }
        });
        nextPageItem.appendChild(nextPageLink);
        paginationContainer.appendChild(nextPageItem);

        // 처음으로 가는 버튼
        const firstPageItem = document.createElement('li');
        firstPageItem.className = `page-item ${currentPage === 1 ? 'disabled' : ''}`;
        const firstPageLink = document.createElement('a');
        firstPageLink.className = 'page-link';
        firstPageLink.href = '#';
        firstPageLink.textContent = '<<';
        firstPageLink.addEventListener('click', (e) => {
            e.preventDefault();
            if (currentPage !== 1) {
                currentPage = 1; // 첫 페이지로 이동
                renderBlogList(currentPage);
                renderPagination(blogList.length);
            }
        });
        firstPageItem.appendChild(firstPageLink);
        paginationContainer.insertBefore(firstPageItem, prevPageItem); // 이전 버튼 앞에 추가

        // 끝으로 가는 버튼
        const lastPageItem = document.createElement('li');
        lastPageItem.className = `page-item ${currentPage === totalPages ? 'disabled' : ''}`;
        const lastPageLink = document.createElement('a');
        lastPageLink.className = 'page-link';
        lastPageLink.href = '#';
        lastPageLink.textContent = '>>';
        lastPageLink.addEventListener('click', (e) => {
            e.preventDefault();
            if (currentPage !== totalPages) {
                currentPage = totalPages; // 마지막 페이지로 이동
                renderBlogList(currentPage);
                renderPagination(blogList.length);
            }
        });
        lastPageItem.appendChild(lastPageLink);
        paginationContainer.appendChild(lastPageItem); // 마지막 버튼 추가
    }

    // 초기 블로그 목록과 페이지네이션 렌더링
    renderBlogList(currentPage);
    renderPagination(blogList.length);
});