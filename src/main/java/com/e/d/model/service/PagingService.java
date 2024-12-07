package com.e.d.model.service;

import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;
import org.springframework.web.util.UriComponentsBuilder;

@Service
public class PagingService {

    public String generatePageBar(Page<?> page, String basePath) {
        StringBuilder pageBar = new StringBuilder();
        String baseClass = "flex items-center justify-center px-3 h-10 text-sm border border-gray-300";
        String activeClass = "text-blue-600 bg-blue-50";
        String hoverClass = "hover:bg-gray-100 hover:text-gray-700";
        String roundedClass = "rounded-lg";

        pageBar.append("<nav aria-label=\"Page navigation\">\n<ul class=\"inline-flex -space-x-px\">\n");

        // 처음으로 버튼
        if (page.getNumber() > 0) {
            String firstUrl = UriComponentsBuilder.fromPath(basePath)
                    .queryParam("page", 0)
                    .toUriString();
            pageBar.append("<li><a href=\"" + firstUrl + "\" class=\"" + baseClass + " " + hoverClass + " " + roundedClass + "\">처음</a></li>");
        }

        // 이전 버튼
        if (page.hasPrevious()) {
            String prevUrl = UriComponentsBuilder.fromPath(basePath)
                    .queryParam("page", page.getNumber() - 1)
                    .toUriString();
            pageBar.append("<li><a href=\"" + prevUrl + "\" class=\"" + baseClass + " " + hoverClass + "\">이전</a></li>");
        }

        // 페이지 범위 계산
        int range = 5; // 한 번에 표시할 페이지 버튼 수
        int totalPages = page.getTotalPages();
        int startPage = Math.max(0, Math.min(totalPages - range, page.getNumber() - range / 2));
        int endPage = Math.min(totalPages, startPage + range);

        // 페이지 번호 버튼
        for (int i = startPage; i < endPage; i++) {
            String pageUrl = UriComponentsBuilder.fromPath(basePath)
                    .queryParam("page", i)
                    .toUriString();
            if (i == page.getNumber()) {
                pageBar.append("<li><a href=\"" + pageUrl + "\" class=\"" + baseClass + " " + activeClass + "\">" + (i + 1) + "</a></li>");
            } else {
                pageBar.append("<li><a href=\"" + pageUrl + "\" class=\"" + baseClass + " " + hoverClass + "\">" + (i + 1) + "</a></li>");
            }
        }

        // 다음 버튼
        if (page.hasNext()) {
            String nextUrl = UriComponentsBuilder.fromPath(basePath)
                    .queryParam("page", page.getNumber() + 1)
                    .toUriString();
            pageBar.append("<li><a href=\"" + nextUrl + "\" class=\"" + baseClass + " " + hoverClass + "\">다음</a></li>");
        }

        // 마지막으로 버튼
        if (page.getNumber() < totalPages - 1) {
            String lastUrl = UriComponentsBuilder.fromPath(basePath)
                    .queryParam("page", totalPages - 1)
                    .toUriString();
            pageBar.append("<li><a href=\"" + lastUrl + "\" class=\"" + baseClass + " " + hoverClass + " " + roundedClass + "\">끝</a></li>");
        }

        pageBar.append("</ul>\n</nav>");
        return pageBar.toString();
    }
}
