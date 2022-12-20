<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
		<c:when test="${not empty isExist}">
			<script>
				alert("존재하지 않는 아이디입니다.");
				location.href="login_form.do?url=${requestScope.encodedUrl }";
			</script>
		</c:when>
		<c:when test="${not empty sessionScope.id }">
			<script>
				location.href="${requestScope.url }";
			</script>
		</c:when>
		<c:otherwise>
			<script>
				alert("아이디 또는 비밀번호가 틀립니다.");
				location.href="login_form.do?url=${requestScope.encodedUrl }";
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>