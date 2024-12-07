<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<c:set var="cl" value="${ pageContext.request.contextPath }" />

	<footer class="bg-white m-4 dark:bg-gray-800">
    	<div class="w-full mx-auto max-w-screen-xl p-4 md:flex md:items-center md:justify-between border-t">
      		<span class="text-sm text-gray-500 sm:text-center dark:text-gray-400">
      			Copyright 2021. Dayoon inc. all rights reserved.
    		</span>
    		<ul class="flex flex-wrap items-center mt-3 text-sm font-medium text-gray-500 dark:text-gray-400 sm:mt-0">
        		<li>
            		<a href="#" class="hover:underline me-4 md:me-6">+82-010-8466-8317</a>
        		</li>
    		</ul>
    	</div>
	</footer>

<script src="https://cdn.tailwindcss.com"></script>
<script src="https://unpkg.com/flowbite@1.4.0/dist/flowbite.js"></script>
<script src="${ cl }/resources/js/sidebar.js"></script>
