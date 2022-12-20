<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/mypage/ orderList/list_customer.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nav.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/subFooter.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/subnav.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>

    <!-- Font awesome -->
    <script src="http://code.jquery.com/jquery-2.1.3.min.js"></script> 
<style>

table > th {
      color:000000;
      font-size:17px;
      font-weight:400;
   }
   table > td {
      color:999999;
      font-size:17px;
   }
   
td > a {
  text-align: center;
  text-decoration: none; /* 링크의 밑줄 제거 */
  color: inherit; /* 링크의 색상 제거 */
   }
</style>
</head>
<body>
	<!-- main nav바  -->
	<jsp:include page="/include/nav.jsp"></jsp:include>
	<!-- sub nav바 -->
	<!-- 
	      thisPage는 대메뉴를 구별하는데 사용
	      subPage는 소메뉴를 구별하는데 사용
	-->
	<jsp:include page="/include/subnav.jsp"> 
		<jsp:param value="mypage" name="thisPage"/>
		<jsp:param value="orderlist" name="subPage"/>
	</jsp:include>
	<div class="container"  style= "width:1320px; margin-bottom:150px"> 
	<table class="table table-hover">
		<thead>
			<tr>
				<th>주문번호</th>
				<th>주문상세정보</th>
				<th>주문가격</th>
				<th>배송지</th>
				<th>예약일</th>
				<th>수거일</th>
				<th>처리상태</th>
				<th>후기작성</th>		
			</tr>
		</thead>
		<tbody>
			<c:forEach var="tmp" items="${list }">
				<tr>
					<td>${tmp.code }</td>
					<td><a href="${pageContext.request.contextPath }/mypage/detail.do?code=${tmp.code }">상세정보보기</a></td>
					<td><f:formatNumber value="${tmp.order_price }" pattern="#,###" />원</td>
					<td>${tmp.order_addr }</td>
					<td>${tmp.regdate}</td>
					<td>${tmp.reservation_date }</td>
					<td>${tmp.state }</td>
				<c:choose>
					<c:when test="${tmp.orderer eq id and tmp.state eq '반환완료' }">
					<td><a href="${pageContext.request.contextPath }/review/insertform.do?code=${tmp.code }">
                        <svg xmlns="http://www.w3.org/2000/svg" width="17" height="17" fill="currentColor" class="bi bi-clipboard2-plus" viewBox="0 0 16 16">
                             <path d="M9.5 0a.5.5 0 0 1 .5.5.5.5 0 0 0 .5.5.5.5 0 0 1 .5.5V2a.5.5 0 0 1-.5.5h-5A.5.5 0 0 1 5 2v-.5a.5.5 0 0 1 .5-.5.5.5 0 0 0 .5-.5.5.5 0 0 1 .5-.5h3Z"/>
                             <path d="M3 2.5a.5.5 0 0 1 .5-.5H4a.5.5 0 0 0 0-1h-.5A1.5 1.5 0 0 0 2 2.5v12A1.5 1.5 0 0 0 3.5 16h9a1.5 1.5 0 0 0 1.5-1.5v-12A1.5 1.5 0 0 0 12.5 1H12a.5.5 0 0 0 0 1h.5a.5.5 0 0 1 .5.5v12a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5v-12Z"/>
                             <path d="M8.5 6.5a.5.5 0 0 0-1 0V8H6a.5.5 0 0 0 0 1h1.5v1.5a.5.5 0 0 0 1 0V9H10a.5.5 0 0 0 0-1H8.5V6.5Z"/>
                        </svg>
                        	작성하기         
					</a></td>
				</c:when>
                <c:otherwise>
                    <td></td>
                </c:otherwise>
               </c:choose> 
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>