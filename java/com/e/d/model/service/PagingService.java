package com.e.d.model.service;

import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;
import org.springframework.web.util.UriComponentsBuilder;

@Service
public class PagingService {
	
	public String generatePageBar(Page<?> page, String basePath) {
	    StringBuilder pageBar = new StringBuilder();
	    String baseClass = "flex items-center justify-center px-3 h-10 text-md border border-gray-300";
	    String activeClass = "text-blue-600 bg-blue-50 px-3";
	    String hoverClass = "hover:bg-gray-100 hover:text-gray-700 px-3";
	    String roundedClass = "rounded-lg";

	    pageBar.append("<nav aria-label=\"Page navigation\">\n");
	    pageBar.append("\t<ul class=\"inline-flex -space-x-px\">\n");

	    // 처음으로 버튼
	    if (page.getNumber() > 0) {
	        String firstUrl = UriComponentsBuilder.fromPath(basePath)
	                .queryParam("page", 0)
	                .toUriString();
	        pageBar.append("\t\t<li>\n");
	        pageBar.append("\t\t\t<a href=\"").append(firstUrl).append("\" class=\"")
	               .append(baseClass).append(" ").append(hoverClass).append(" ").append("\">처음</a>\n");
	        pageBar.append("\t\t</li>\n");
	    }

	    // 이전 버튼
	    if (page.hasPrevious()) {
	        String prevUrl = UriComponentsBuilder.fromPath(basePath)
	                .queryParam("page", page.getNumber() - 1)
	                .toUriString();
	        pageBar.append("\t\t<li>\n");
	        pageBar.append("\t\t\t<a href=\"").append(prevUrl).append("\" class=\"")
	               .append(baseClass).append(" ").append(hoverClass).append("\">이전</a>\n");
	        pageBar.append("\t\t</li>\n");
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
	        pageBar.append("\t\t<li>\n");
	        pageBar.append("\t\t\t<a href=\"").append(pageUrl).append("\" class=\"")
	               .append(baseClass).append(" ").append((i == page.getNumber() ? activeClass : hoverClass)).append("\">")
	               .append(i + 1).append("</a>\n");
	        pageBar.append("\t\t</li>\n");
	    }

	    // 다음 버튼
	    if (page.hasNext()) {
	        String nextUrl = UriComponentsBuilder.fromPath(basePath)
	                .queryParam("page", page.getNumber() + 1)
	                .toUriString();
	        pageBar.append("\t\t<li>\n");
	        pageBar.append("\t\t\t<a href=\"").append(nextUrl).append("\" class=\"")
	               .append(baseClass).append(" ").append(hoverClass).append("\">다음</a>\n");
	        pageBar.append("\t\t</li>\n");
	    }

	    // 마지막으로 버튼
	    if (page.getNumber() < totalPages - 1) {
	        String lastUrl = UriComponentsBuilder.fromPath(basePath)
	                .queryParam("page", totalPages - 1)
	                .toUriString();
	        pageBar.append("\t\t<li>\n");
	        pageBar.append("\t\t\t<a href=\"").append(lastUrl).append("\" class=\"")
	               .append(baseClass).append(" ").append(hoverClass).append(" ").append("\">끝</a>\n");
	        pageBar.append("\t\t</li>\n");
	    }

	    pageBar.append("\t</ul>\n");
	    pageBar.append("</nav>");
	    return pageBar.toString();
	}
	
}
