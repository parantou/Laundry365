<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기게시판</title>
</head>
<body>
	<script>
		alert("회원님의 글이 수정 되었습니다.");
		location.href="${pageContext.request.contextPath}/review/detail.do?num=${param.num}";
	</script>
</body>
</html> 