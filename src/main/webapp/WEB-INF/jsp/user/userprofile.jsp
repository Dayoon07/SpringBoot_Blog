<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<c:set var="cl" value="${ pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/common/header.jsp" />

	<div class="container mt-5">
        <h2 class="text-center">${ userinfo.username }님의 회원 정보</h2>
        
        <c:if test="${ not empty loginuser }">
        	<form action="${ cl }/updateMemberInfo" method="post" autocomplete="off" class="container w-50">
	            <div class="mb-3">
	                <label for="userId" class="form-label">아이디</label>
	                <input type="number" class="form-control" id="userId" name="userId" value="${userinfo.userId}" readonly required>
	            </div>
	            <div class="mb-3">
	                <label for="username" class="form-label">이름</label>
	                <input type="text" class="form-control" id="username" name="username" value="${userinfo.username}" required>
	            </div>
	            <div class="mb-3">
	                <label for="useremail" class="form-label">이메일</label>
	                <input type="email" class="form-control" id="useremail" name="useremail" value="${userinfo.useremail}" readonly required>
	            </div>
	            <div class="mb-3">
	                <label for="userpassword" class="form-label">비밀번호</label>
	                <input type="text" class="form-control" id="userpassword" name="userpassword" value="${userinfo.userpassword}" required>
	            </div>
	            <div class="mb-3">
	                <label for="email" class="form-label">프로필 소개</label>
	                <textarea class="form-control" rows="5" id="profiletext" name="profiletext" required>${userinfo.profiletext}</textarea>
	            </div>
	            <button type="submit" class="btn btn-outline-primary w-100 px-3 mb-3">정보 업데이트하기</button>
	        </form>
	        <form action="/dropMember" method="post" autocomplete="off" class="container w-50">
	        	<button type="button" class="btn btn-outline-danger w-100" data-bs-toggle="modal" data-bs-target="#exampleModal">
					회원 탈퇴
				</button>
			
			    <!-- Modal -->
			    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			    	<div class="modal-dialog modal-dialog-centered"> <!-- 이 부분을 추가 -->
			        	<div class="modal-content">
			            	<div class="modal-header">
			                	<h5 class="modal-title" id="exampleModalLabel">회원 탈퇴</h5>
			                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body">정말로 회원 탈퇴를 하시겠습니까?</div>
							<div class="modal-footer">
			                	<button type="button" class="btn btn-outline-primary w-25" data-bs-dismiss="modal">취소</button>
			                	<button type="submit" class="btn btn-outline-danger w-25">탈퇴</button>
							</div>
						</div>
					</div>
				</div>
	        </form>
        </c:if>
        <c:if test="${ empty loginuser }">
        	<div class="container w-50">
	            <div class="mb-3">
	                <label for="username" class="form-label">이름</label>
	                <input type="text" class="form-control" id="username" name="username" value="${userinfo.username}" readonly>
	            </div>
	            <div class="mb-3">
	                <label for="useremail" class="form-label">이메일</label>
	                <input type="email" class="form-control" id="useremail" name="useremail" value="${userinfo.useremail}" readonly>
	            </div>
	            <div class="mb-3">
	                <label for="email" class="form-label">프로필 소개</label>
	                <textarea class="form-control" id="profiletext" name="profiletext" readonly>${userinfo.profiletext}</textarea>
	            </div>
	        </div>
        </c:if>
    </div>

<jsp:include page="/WEB-INF/common/footer.jsp" />