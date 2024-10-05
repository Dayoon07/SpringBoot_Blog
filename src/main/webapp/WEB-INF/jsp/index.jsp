<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<c:set var="cl" value="${ pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/common/header.jsp" />

	<!-- Main Content -->
    <main class="container mt-4">
        <div class="row">

            <!-- 최근 뉴스 섹션 -->
            <div class="col-md-8">
                <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="carousel-item active"><img class="d-block w-100" src="${ cl }/img/img-1.jpg" alt="First slide"></div>
                        <div class="carousel-item"><img class="d-block w-100" src="${ cl }/img/img-2.jpg" alt="Second slide"></div>
                        <div class="carousel-item"><img class="d-block w-100" src="${ cl }/img/img-3.jpg" alt="Third slide"></div>
                        <div class="carousel-item"><img class="d-block w-100" src="${ cl }/img/img-4.jpg" alt="Third slide"></div>
                        <div class="carousel-item"><img class="d-block w-100" src="${ cl }/img/img-5.jpg" alt="Third slide"></div>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
                <br>
                <div class="card-body border-top">
                	<h3>최신 글</h3>
                </div>
                <c:forEach var="board" items="${ defaultList }" varStatus="mainPageAllBoardNumber">
                	<c:if test="${ mainPageAllBoardNumber.index <= 10 }">
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
            </div>  <!-- col-md-8 -->

            <!-- 공지사항 및 프로모션 섹션 -->
            <div class="col-md-4">
                <div class="card shadow-sm border rounded-0 notice">
                    <div class="card-body">
                    	<c:if test="${ not empty loginuser }">
                    		<h5><a href="${ cl }/username/${ loginuser.username }">${ loginuser.username }님</a></h5>
                    		<p style="font-size: large;">${ loginuser.useremail }</p>
                    		<a href="${ cl }/logout"><button type="button" class="btn btn-dark btn-block">로그아웃</button></a><hr>
                    		<h5><a href="${ cl }/blog">블로그</a></h5><hr>
                    		<h5><a href="${ cl }/notice">공지사항</a></h5><hr>
	                        <h5><a href="#">프로모션</a></h5>
                    	</c:if>
                    	<c:if test="${ empty loginuser }">
                    		<a href="${ cl }/signin"><button type="button" class="btn btn-primary btn-block my-1">로그인</button></a>
	                        <a href="${ cl }/signup"><button type="button" class="btn btn-dark btn-block">회원가입</button></a><hr>
	                        <h5><a href="${ cl }/blog">블로그</a></h5><hr>
	                        <h5><a href="${ cl }/notice">공지사항</a></h5><hr>
	                        <h5><a href="#">프로모션</a></h5>
                    	</c:if>
                    </div>
                </div>
                <div class="border rounded-0 mt-4">
                    <a href="${ cl }/">
                    	<img src="${ cl }/img/promotion-img.jpg" style="width: 350px; height: auto;">
                    </a>
				</div>
            </div>

        </div>
    </main>

<jsp:include page="/WEB-INF/common/footer.jsp" />