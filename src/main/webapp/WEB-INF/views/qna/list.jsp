<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nav.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/subFooter.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/subnav.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<style>
	.btn{border-radius: 0px !important;}
	* { font-family: 'Noto Sans KR', sans-serif !important;}
	a:hover{color : rgba(0, 0, 0, 0.6) !important;}
	.page-ui a{
		text-decoration: none;
		color: #000;
	}
	
	.page-ui a:hover{
		text-decoration: underline;
	}
	
	.page-ui a.active{
		color: red;
		font-weight: bold;
		text-decoration: underline;
	}
	.page-ui ul{
		list-style-type: none;
		padding: 0;
	}
	
	.page-ui ul > li{
		float: left;
		padding: 5px;
	}
	.question:hover{
		cursor: pointer;
		color : rgba(0, 0, 0, 0.6) !important;
	}
	.container{
		margin-bottom: 200px;
	}
</style>
</head>
<body>
	<!-- main nav바  -->
	<jsp:include page="/include/nav.jsp"></jsp:include>
	<!-- sub nav바 -->
	<jsp:include page="/include/subnav.jsp">
			<jsp:param value="support" name="thisPage"/>
			<jsp:param value="faq" name="subPage"/>
	</jsp:include>
	<div class="container">
		<h1 style="font-size:25px;"><strong>1:1문의</strong></h1>
		<span style="color:#696969; font-size:15px;">궁금하신 점이나 의견을 남겨주시면 성실히 답변해 드리겠습니다.</span>
		<button class="btn btn-outline-dark" style="float:right" onclick="location.href='${pageContext.request.contextPath}/qna/insertform.do' "><i class="bi bi-plus"></i>문의하기</button>
		<table class="table mt-5">
			<thead>
				<tr>
					<th scope="col">제목</th>
					<th scope="col">작성일</th>
					<th scope="col">답변여부</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="tmp" items="${list }" varStatus="status">
					<c:choose>
						<c:when test="${ tmp.writer ne sessionScope.id and manager == 'N' }">
							<c:if test="${ status.first }">
								<tr>
									<td colspan="3" class="text-center">작성한 1:1 문의가 없습니다.</td>
								</tr>							
							</c:if>
							<c:if test="${ !status.first }">
								<tr style="display:none;"></tr>
							</c:if>
						</c:when>
						<c:when test="${ tmp.writer eq sessionScope.id or manager == 'Y' }">
							<tr class="question" onclick="location.href='detail.do?num=${tmp.num }'">
								<td scope="row">${tmp.title }</td>
								<td scope="row">${tmp.regdate }</td>
								<c:if test="${tmp.check_reply eq '0'}">
									<td scope="row">답변대기</td>
								</c:if>
								<c:if test="${tmp.check_reply eq '1'}">
									<td scope="row">답변완료</td>
								</c:if>					
							</tr>
						</c:when>
					</c:choose>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>