<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<c:set var="cl" value="${ pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/common/header.jsp" />

	<main class="container my-5">
        <!-- 페이지 소개 제목 -->
        <section class="text-center mb-5">
        	<h2 class="display-3 mb-4">웹 소개 페이지</h2>
            <p class="lead">간결하고 유용한 정보를 제공하는 웹 페이지입니다.</p>
            <p class="lead">간단한 CRUD 기능을 가진 블로그 웹 페이지</p>
        </section>

        <!-- 주요 기능 설명 -->
        <section class="row text-center">
            <div class="col-md-4 mb-4">
                <div class="card h-100">
                    <div class="card-body">
                        <h5 class="card-title">간편한 사용성</h5>
                        <p class="card-text">누구나 쉽게 이용할 수 있는 직관적인 인터페이스를 제공합니다.</p>
                    </div>
                </div>
            </div>

            <div class="col-md-4 mb-4">
                <div class="card h-100">
                    <div class="card-body">
                        <h5 class="card-title">실시간 업데이트</h5>
                        <p class="card-text">최신 정보를 빠르게 확인하고, 실시간으로 업데이트됩니다.</p>
                    </div>
                </div>
            </div>

            <div class="col-md-4 mb-4">
                <div class="card h-100">
                    <div class="card-body">
                        <h5 class="card-title">보안 강화</h5>
                        <p class="card-text">사용자의 데이터를 안전하게 보호하는 강력한 보안 시스템을 갖추고 있습니다.</p>
                    </div>
                </div>
            </div>
        </section>

        <!-- 추가 설명 -->
        <section class="text-center mt-5">
            <p class="lead">지금 바로 가입하고 다양한 기능을 사용해 보세요!</p>
            <a href="${ cl }/signup" class="btn btn-outline-primary btn-lg btn-block">회원가입</a>
        </section>
    </main>

<jsp:include page="/WEB-INF/common/footer.jsp" />