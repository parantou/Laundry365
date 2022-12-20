<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/mypage/users/delete.jsp</title>
</head>
<body>
	<script>
		alert('${requestScope.id }님 탈퇴 처리 되었습니다.');
		location.href="${pageContext.request.contextPath}/home.do";
	</script>
</body>
</html>