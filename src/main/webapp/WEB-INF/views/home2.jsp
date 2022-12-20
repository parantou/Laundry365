<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nav.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/subFooter.css">
	<style>
		body{background-color:#666;}
	</style>
</head>
<body>
<jsp:include page="/include/nav.jsp"></jsp:include>
	<br><br><br><br><br>
	<h1>Index Page</h1>
	<a href="${pageContext.request.contextPath}/corporation/brand.do">브랜드 소개</a><br>
	<a href="${pageContext.request.contextPath }/users/login.do">로그인하기</a><br>
	<a href="${pageContext.request.contextPath }/qna/list.do">문의게시판</a><br>
	<a href="${pageContext.request.contextPath}/users/logout.do">로그아웃 하기(정연)</a><br>
	<a href="${pageContext.request.contextPath }/notice/list.do">공지사항</a><br>
	<a href="${pageContext.request.contextPath}/users/reserve.do">예약하기</a><br>
	<a href="${pageContext.request.contextPath}/users/reservationList.do">예약 리스트</a><br>
	<a href="${pageContext.request.contextPath }/review/list.do">후기게시판</a><br>
		<%-- 이승경--%>
	<a href="${pageContext.request.contextPath }/users/login_form.do">로그인하기</a><br>
	<a href="${pageContext.request.contextPath }/users/signup_form.do">회원가입</a><br>
	<br><br><br><br><br>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>