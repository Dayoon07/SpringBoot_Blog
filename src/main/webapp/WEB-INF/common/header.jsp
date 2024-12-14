<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<c:set var="cl" value="${ pageContext.request.contextPath }" />

	<header class="w-full p-2 pl-10 bg-white border-b flex justify-between items-center" id="header" style="height: 60px;">
		<div class="flex justify-between items-center">
			<a href="${ cl }/" class="text-2xl text-blue-600">벨로그 vs 블로그</a>
		</div>
		
		<!-- <form action="${ cl }/search" method="get" autocomplete="on" 
			class="flex px-4 py-3 border-b border-[#333] focus-within:border-blue-500 
		    overflow-hidden w-full max-w-sm font-[sans-serif]">
			<button type="submit">
        		<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 192.904 192.904" width="18px" class="fill-gray-600 mr-3">
	          		<path d="m190.707 180.101-47.078-47.077c11.702-14.072 18.752-32.142 18.752-51.831C162.381 36.423 125.959 0 81.191 0 36.422 0 0 36.423 
	          			0 81.193c0 44.767 36.422 81.187 81.191 81.187 19.688 0 37.759-7.049 51.831-18.751l47.079 47.078a7.474 7.474 0 0 0 5.303 2.197 
	          			7.498 7.498 0 0 0 5.303-12.803zM15 81.193C15 44.694 44.693 15 81.191 15c36.497 0 66.189 29.694 66.189 66.193 0 36.496-29.692 
	          			66.187-66.189 66.187C44.693 147.38 15 117.689 15 81.193z">
	          		</path>
	        	</svg>
        	</button>
        	<input type="text" name="searchque" id="searchque" placeholder="검색어를 입력하세요..." required class="w-full outline-none text-lg" />
		</form> -->
		
		<c:if test="${ empty sessionScope.userSession }">
			<div class="flex justify-between">
				<a href="${ cl }/signin">
		            <button type="button" class="py-2 text-lg text-black hover:bg-gray-200 rounded-md mr-3" style="width: 100px;">로그인</button>
		        </a>
		        <a href="${ cl }/signup">
		            <button type="button" class="py-2 text-lg text-black hover:bg-gray-200 rounded-md" style="width: 120px;">회원가입</button>
		        </a>
			</div>
		</c:if>
		<c:if test="${ not empty sessionScope.userSession }">
			<div class="flex justify-between items-center mr-9">
				<a href="${ cl }/profile/${ sessionScope.userSession.username }" class="text-lg font-semibold">
				    ${ sessionScope.userSession.username }님
				</a>
				<button type="button" class="text-3xl ml-5" onclick="openSide()">&#9776;</button>
			</div>
			<aside id="sidebar" class="fixed top-0 right-0 w-64 h-full shadow-lg bg-gray-900 hidden z-50">
				<div style="height: 60px;" class="flex justify-end items-center shadow-lg">
					<button type="button" class="text-3xl mr-10 text-white" onclick="closeSide()">&#9776;</button>
				</div>
				<nav>
					<ul>
				    	<li><a href="${ cl }/" class="flex items-center w-full p-2 text-gray-900 transition duration-75 pl-11 group 
							hover:bg-gray-100 dark:text-white dark:hover:bg-gray-700 text-white hover:text-black text-xl">홈</a></li>
						<li><a href="${ cl }/profile/${ sessionScope.userSession.username }" class="flex items-center w-full p-2 text-gray-900 
							transition duration-75 pl-11 group hover:bg-gray-100 dark:text-white dark:hover:bg-gray-700 text-white 
							hover:text-black text-xl">프로필</a></li>
						<li><a href="${ cl }/board/write" class="flex items-center w-full p-2 text-gray-900 transition duration-75 pl-11 group 
							hover:bg-gray-100 dark:text-white dark:hover:bg-gray-700 text-white hover:text-black text-xl">글 작성</a></li>
					</ul><br>
				    <form action="${ cl }/logout" method="post" autocomplete="off">
						<input type="hidden" name="memberid" id="memberid" value="${ sessionScope.userSession.memberid }" required readonly>
						<button type="submit" class="w-full p-2 text-gray-900 transition duration-75 pl-11 group text-left 
							hover:bg-gray-100 dark:text-white dark:hover:bg-gray-700 text-white hover:text-black text-xl">로그아웃</button>
					</form>
				</nav>
			</aside>
		</c:if>
	</header>