<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<c:set var="cl" value="${ pageContext.request.contextPath }" />

	<footer class="container mx-auto bg-white m-4">
    	<div class="p-4 md:flex md:items-center md:justify-between border-t">
      		<span class="text-sm text-gray-500 sm:text-center dark:text-gray-400">
      			Copyright 2024. Dayoon. All Rights Reserved.
    		</span>
    		<ul class="flex flex-wrap items-center mt-3 text-sm font-medium text-gray-500 dark:text-gray-400 sm:mt-0">
        		<li><a href="mailto:gangd0642@gmail.com" class="hover:text-blue-600 hover:underline">gangd0642@gmail.com</a></li>
    		</ul>
    	</div>
	</footer>

	<script src="https://cdn.tailwindcss.com"></script>
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/marked/4.0.2/marked.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/dompurify/2.3.3/purify.min.js"></script>	<!-- XSS 방지용 -->
	<script src="${ cl }/resources/js/script.js"></script>

	<!--
	<script src="https://cdn.jsdelivr.net/npm/marked/marked.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/showdown/dist/showdown.min.js"></script>
	-->