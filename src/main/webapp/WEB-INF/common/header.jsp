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
    <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"> -->
    <link rel="stylesheet" href="/css/bootstrap.4.5.2min.css">
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
	<header class="bg-white py-3 border-bottom">
        <div class="container d-flex justify-content-between align-items-center">
            <div class="d-flex align-items-center">
                <a href="/" class="navbar-brand">MyVlog</a>
                <form action="${ cl }/blog/blogSearch" method="get" autocomplete="on">
				    <div class="input-group">
				        <input type="text" name="blogSearch" class="form-control border rounded-0" placeholder="search" aria-label="search" aria-describedby="search">
				        <div class="input-group-append">
				            <button class="btn btn-dark px-4 border-left rounded-0" type="submit">검색</button>
				        </div>
				    </div>
				</form>
            </div>
            <div class="dropdown">
                <button class="btn btn-white dropdown-toggle"
                    type="button" id="menuButton" data-toggle="dropdown"
                    aria-haspopup="true" aria-expanded="false"
                    style="padding-left: 30px; padding-right: 30px;">
                    &#9776;
                </button>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="menuButton">
                	<c:if test="${ not empty loginuser }">
	                	<h6 class="dropdown-header">프로필</h6>
                    	<div class="dropdown-divider"></div>
                    	<a class="dropdown-item" href="${ cl }/username/${ loginuser.username }">${ loginuser.username }님</a>
                    	<a class="dropdown-item" href="${ cl }/myBlog/${ loginuser.username }">내가 쓴 게시글 조회</a>
						<a class="dropdown-item" href="${ cl }/blog/write">게시글 작성하기</a>                    	
                    	<div class="dropdown-divider"></div>
                    	<a class="dropdown-item" href="${ cl }/logout">로그아웃</a>
                    	<div class="dropdown-divider"></div>
                    </c:if>
                    <c:if test="${ empty loginuser }"></c:if>
                    <!-- 네비게이션 메뉴 -->
                    <h6 class="dropdown-header">네비게이션</h6>
                    <a class="dropdown-item" href="${ cl }/">홈</a>
                    <a class="dropdown-item" href="${ cl }/welcome">소개</a>
                    <a class="dropdown-item" href="#">연락처</a>
                    <div class="dropdown-divider"></div>
                    
                    <!-- 공지사항 메뉴
                    <h6 class="dropdown-header">공지사항</h6>
                    <a class="dropdown-item" href="#">공지사항 내용 1</a>
                    <a class="dropdown-item" href="#">공지사항 내용 2</a>
                    <a class="dropdown-item" href="#">공지사항 내용 3</a>
                    <div class="dropdown-divider"></div> -->
                    
                    <!-- 하단 메뉴 -->
                    <small class="dropdown-item-text text-muted">&copy; 2024 MyVlog. All rights reserved.</small>
                </div>
            </div>
        </div>
    </header>