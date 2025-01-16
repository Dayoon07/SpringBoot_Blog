<%@ page import="java.time.LocalDateTime" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<c:set var="cl" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>회원가입</title>
</head>
<body>
	<jsp:include page="/WEB-INF/common/header.jsp" />
	
	<div style="width: 450px;" class="p-5 m-5 mx-auto">
		<form action="${ cl }/signupForm" method="post" autocomplete="off">
			<div class="space-y-6">
				<div class="mx-auto flex justify-center items-center">
					<a href="${ cl }/" class="text-3xl">Vlog</a>
				</div>
				<div>
              		<label class="text-gray-800 text-md mb-2 block">사용자 이름</label>
              		<input type="text" name="username" id="username" placeholder="사용할 이름을 입력하세요"
              			class="text-gray-800 bg-white border border-gray-300 w-full text-md px-4 py-3 rounded-md outline-blue-500"
              			required/>
            	</div>
            	<div>
              		<label class="text-gray-800 text-md mb-2 block">이메일</label>
              		<input type="email" name="useremail" id="useremail" placeholder="이메일을 입력하세요"
              			class="text-gray-800 bg-white border border-gray-300 w-full text-md px-4 py-3 rounded-md outline-blue-500" 
              			required/>
            	</div>
	            <div>
	            	<label class="text-gray-800 text-md mb-2 block">비밀번호</label>
	              	<input type="password" name="userpassword" id="userpassword" placeholder="비밀번호를 입력하세요"
	              		class="text-gray-800 bg-white border border-gray-300 w-full text-md px-4 py-3 rounded-md outline-blue-500" 
	              		required/>
	            </div>
	            <div>
	            	<label class="text-gray-800 text-md mb-2 block">프로필 소개</label>
	            	<textarea class="text-gray-800 bg-white border border-gray-300 w-full text-md px-4 py-3 rounded-md outline-blue-500 resize-none"
	            		rows="3" name="profilebio" id="profilebio"></textarea>
	            </div>
          	</div>
          	
          	<div class="!mt-12">
            	<button type="submit" class="w-full px-4 py-2 text-md rounded-sm font-bold border-2 text-[#007bff] border-[#007bff] bg-[#007bff] 
          			transition-all ease-in-out duration-300 bg-transparent hover:bg-[#007bff] hover:text-white">
              		회원가입
            	</button>
          	</div>
          	<p class="text-gray-800 text-md mt-6 text-center">
          		이미 계정이 있으신가요? <a href="${ cl }/signin" class="text-md text-blue-600 font-semibold hover:underline ml-1">로그인</a>
          	</p>
        </form>
	</div>
	
	<jsp:include page="/WEB-INF/common/footer.jsp" />
</body>
</html>