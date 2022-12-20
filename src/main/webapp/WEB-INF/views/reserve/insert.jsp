<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
		<c:when test="${isSuccess}">
			<script>
				alert("서비스 신청이 완료되었습니다.");
				location.href="${pageContext.request.contextPath}/mypage/order.do";
			</script>
		</c:when>
		<c:otherwise>
			<script>
				alert("주문이 실패했습니다.");
				window.history.back();
			</script>
		</c:otherwise>
	</c:choose>

</body>
</html>