<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<c:set var="cl" value="${ pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/common/header.jsp" />

    <main class="container mt-4">
	    <div class="row">
	        <div class="col-md-8">
	            <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
	                <div class="carousel-indicators">
	                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
	                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
	                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
	                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
	                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="4" aria-label="Slide 5"></button>
	                </div>
	                <div class="carousel-inner">
	                    <div class="carousel-item active">
	                        <img src="${ cl }/img/img-1.jpg" class="d-block w-100">
	                    </div>
	                    <div class="carousel-item">
	                        <img src="${ cl }/img/img-2.jpg" class="d-block w-100">
	                    </div>
	                    <div class="carousel-item">
	                        <img src="${ cl }/img/img-3.jpg" class="d-block w-100">
	                    </div>
	                    <div class="carousel-item">
	                        <img src="${ cl }/img/img-4.jpg" class="d-block w-100">
	                    </div>
	                    <div class="carousel-item">
	                        <img src="${ cl }/img/img-5.jpg" class="d-block w-100">
	                    </div>
	                </div>
	                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
	                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	                    <span class="visually-hidden">Previous</span>
	                </button>
	                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
	                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	                    <span class="visually-hidden">Next</span>
	                </button>
	            </div>
	            <div class="card-body mt-5 mb-2">
	                <h3>최신 글</h3>
	            </div>
	            <c:forEach var="board" items="${ defaultList }" varStatus="mainPageAllBoardNumber">
	                <c:if test="${ mainPageAllBoardNumber.index <= 20 }">
	                    <div class="card shadow-sm border rounded">
	                        <div class="card-body">
	                            <h5 class="card-title">
	                                <a href="${ cl }/blog/blogview?blogid=${ board.blogid }">
	                                    ${ board.title }
	                                </a>
	                            </h5>
	                            <h6 class="card-subtitle mb-2 text-muted">
	                                ${ board.writer }
	                                <span style="float: right;">
	                                    ${ board.formattedDateTime }
	                                </span>
	                            </h6>
	                        </div>
	                    </div>
	                </c:if>
	            </c:forEach>
	        </div> <!-- col-md-8 -->
	
	        <!-- 공지사항 및 프로모션 섹션 -->
	        <div class="col-md-4">
	            <div class="card shadow-sm border rounded-0 notice">
	                <div class="card-body">
	                    <c:if test="${ not empty loginuser }">
	                        <h5><a href="${ cl }/username/${ loginuser.username }">${ loginuser.username }님</a></h5>
	                        <p style="font-size: large;">${ loginuser.useremail }</p>
	                        <a href="${ cl }/logout"><button type="button" class="btn btn-dark w-100">로그아웃</button></a><hr>
	                        <h5><a href="${ cl }/blog">블로그</a></h5><hr>
	                        <h5><a href="${ cl }/blog/write">글 작성하기</a></h5><hr>
	                        <h5><a href="${ cl }/notice">공지사항</a></h5><hr>
	                        <h5><a href="#">프로모션</a></h5>
	                    </c:if>
	                    <c:if test="${ empty loginuser }">
	                        <a href="${ cl }/signin"><button type="button" class="btn btn-primary w-100 my-1">로그인</button></a>
	                        <a href="${ cl }/signup"><button type="button" class="btn btn-dark w-100">회원가입</button></a><hr>
	                        <h5><a href="${ cl }/blog">블로그</a></h5><hr>
	                        <h5><a href="${ cl }/notice">공지사항</a></h5><hr>
	                        <h5><a href="#">프로모션</a></h5>
	                    </c:if>
	                </div>
	            </div>
	            <div class="rounded-0 mt-4">
	                <a href="${ cl }/">
	                    <img src="${ cl }/img/f.png" class="w-100 rounded-4 mb-2" alt="promotion">
	                    <img src="${ cl }/img/promotion-img.jpg" class="w-100 rounded-3" alt="promotion">
	                </a>
	            </div>
	        </div>
	    </div>
	</main>

<jsp:include page="/WEB-INF/common/footer.jsp" />