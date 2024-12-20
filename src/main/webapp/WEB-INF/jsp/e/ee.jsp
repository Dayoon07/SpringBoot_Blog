<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<c:set var="cl" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>title</title>
</head>
<body>

	<table border="1" style="border-collapse: collapse; text-align: center;">
		<tr style="font-weight: bold;">
			<td style="padding: 10px 20px;">고유 ID</td>
			<td style="padding: 10px 20px;">사용자 이름</td>
			<td style="padding: 10px 20px;">사용자 이메일</td>
			<td style="padding: 10px 20px;">사용자 비밀번호</td>
			<td style="padding: 10px 20px;">가입일</td>
			<td style="padding: 10px 20px;">자기소개말</td>
		</tr>
		<c:forEach var="member" items="${ a }">
			<tr>
				<td style="padding: 10px 20px;">${ member.memberid }</td>
				<td style="padding: 10px 20px;">${ member.username }</td>
				<td style="padding: 10px 20px;">${ member.useremail }</td>
				<td style="padding: 10px 20px;">${ member.userpassword }</td>
				<td style="padding: 10px 20px;">${ member.joindate }</td>
				<td style="padding: 10px 20px;">${ member.profilebio }</td>
			</tr>
		</c:forEach>
	</table>
	
</body>
</html>