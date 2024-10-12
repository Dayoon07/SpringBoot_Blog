<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<c:set var="cl" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>블로그 페이지 | (나혼자서만듬)</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
	<header class="bg-white py-3 border-bottom">
        <div class="container d-flex justify-content-between align-items-center">
            <div class="d-flex align-items-center">
                <a href="/" class="navbar-brand px-2">MyVlog</a>
                <form action="${ cl }/blog/blogSearch" method="get" autocomplete="on">
				    <div class="input-group">
				        <input type="text" id="header-search-input" name="blogSearch" class="form-control border rounded-0" placeholder="search" aria-label="search" aria-describedby="search">
				        <div class="input-group-append">
				            <button class="btn btn-dark px-4 border-left rounded-0" type="submit">검색</button>
				        </div>
				    </div>
				</form>
            </div>
            <div>
				<button class="btn px-3 fs-5" id="sidebar-btn" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">
			        &#9776; <!-- 햄버거 아이콘 -->
			    </button>
			
			    <div class="offcanvas offcanvas-end text-bg-light" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
			        <div class="offcanvas-header">
			            <h3 class="offcanvas-title" id="offcanvasRightLabel">메뉴</h3>
			            <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
			        </div>
			        <div class="offcanvas-body p-0 m-0">
			            <c:if test="${ not empty loginuser }">
			            	<div class="list-group rounded-0">
				                <a class="list-group-item list-group-item-action" href="${ cl }/username/${ loginuser.username }">${ loginuser.username }님</a>
				                <a class="list-group-item list-group-item-action" href="${ cl }/myBlog/${ loginuser.username }">작성한 글 조회</a>
				                <a class="list-group-item list-group-item-action" href="${ cl }/blog/write">글 작성하기</a>
				                <a class="list-group-item list-group-item-action" href="${ cl }/logout">로그아웃</a><br><br>
				                <a class="list-group-item list-group-item-action" href="${ cl }/">홈</a>
			            		<a class="list-group-item list-group-item-action" href="${ cl }/notice">공지사항</a>
					            <a class="list-group-item list-group-item-action" href="${ cl }/welcome">소개</a>
					            <a class="list-group-item list-group-item-action" href="mailto:gangd0642@gmail.com">연락처</a><br><br>
					            <p class="text-center">&copy; 2024 MyVlog. All rights reserved.</p>
				            </div>
			            </c:if>
			            <c:if test="${ empty loginuser }">
			            	<div class="list-group rounded-0">
			            		<a class="list-group-item list-group-item-action" href="${ cl }/signin">로그인</a>
			            		<a class="list-group-item list-group-item-action" href="${ cl }/signup">회원가입</a><br><br>
			            		<a class="list-group-item list-group-item-action" href="${ cl }/">홈</a>
			            		<a class="list-group-item list-group-item-action" href="${ cl }/notice">공지사항</a>
					            <a class="list-group-item list-group-item-action" href="${ cl }/welcome">소개</a>
					            <a class="list-group-item list-group-item-action" href="mailto:gangd0642@gmail.com">문의하기</a><br><br>
					            <p class="text-center">&copy; 2024 MyVlog. All rights reserved.</p>
			            	</div>
			            </c:if>
			        </div>
			    </div>
			</div>
        </div>
    </header>