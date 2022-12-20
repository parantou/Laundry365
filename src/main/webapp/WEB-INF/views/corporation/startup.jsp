<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>창업안내</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nav.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/subFooter.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/subnav.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-2.1.3.min.js"></script>
<style>
	* { font-family: 'Noto Sans KR', sans-serif !important;}
	.container > img {

	  width: 100%;

	  }
	  </style>	
</head>
<body>
<jsp:include page="/include/nav.jsp"></jsp:include>
   <!-- sub nav바 -->
   <!-- 
      thisPage는 대메뉴를 구별하는데 사용
      subPage는 소메뉴를 구별하는데 사용
    -->
 <jsp:include page="/include/subnav.jsp">
 	<jsp:param value="brand" name="thisPage"/>
    <jsp:param value="startup" name="subPage"/>
 </jsp:include>
<div class="container mb-3" >
<h2 >지역별 담당자 안내</h2>
</div>
<div class="container mb-2"  >	
 	<img src="${pageContext.request.contextPath}/resources/img/startup2.jpg"  />
 </div>
<div class="container" style="margin-bottom:150px"  >
 	<img src="${pageContext.request.contextPath}/resources/img/startup.png"  />
 
 </div>

<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>