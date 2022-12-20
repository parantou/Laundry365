<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nav.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/subFooter.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/subnav.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<style>
	body{
		margin: 0;
		padding: 0;
		height: 100%;
	}
	#detail_wr{
		height:700px;
		display:flex;
		justify-content: left;
		font-size:16px;
		margin-bottom:100px;
	}
	#body-content{
		width:100%;
	}
	footer{
		width:100%;
		bottom: 0px;
	}
	#orderInfo{
		display:flex;
		justify-content: left;
		justify-content: space-between;
	}
	h3{
		margin-left:5px;
		margin-bottom:15px;
		border-bottom:0.5px solid black;
		border-radius:5px;
		padding:5px;
		padding-bottom:8px;
		width:200px;
	}
	h3 span{
		margin-left:3px;
		vertical-align:bottom ;
	}
	.sizesm{
		width:200px;
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
	<div id="detail_wr" class="container">
		<div id="body-content">
			<h3>
				<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-1-square-fill" viewBox="0 0 16 16">
				  <path d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2Zm7.283 4.002V12H7.971V5.338h-.065L6.072 6.656V5.385l1.899-1.383h1.312Z"/>
				</svg><span>고객정보</span>
			</h3>
			<div style="margin-bottom:70px;">
				<table class="table">
					<tbody>
						<tr>
							<th scope="row">아이디</th>
							<td>${order.orderer}</td>
						</tr>
						<tr>
							<th scope="row">이름</th>
							<td>${order.name}</td>
						</tr>
						<tr>
							<th scope="row">전화번호</th>
							<td>
								<f:formatNumber var="num" value="${order.phone }" pattern="###,####,####" />
								0<c:out value="${fn:replace(num, ',', '-')}" />
							</td>
						</tr>
						<tr>
							<th scope="row">주소</th>
							<td>${order.addr}</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="orderInfo">	
				<div>
					<h3>
						<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-2-square-fill" viewBox="0 0 16 16">
						  <path d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2Zm4.646 6.24v.07H5.375v-.064c0-1.213.879-2.402 2.637-2.402 1.582 0 2.613.949 2.613 2.215 0 1.002-.6 1.667-1.287 2.43l-.096.107-1.974 2.22v.077h3.498V12H5.422v-.832l2.97-3.293c.434-.475.903-1.008.903-1.705 0-.744-.557-1.236-1.313-1.236-.843 0-1.336.615-1.336 1.306Z"/>
						</svg><span>주문정보</span>
					</h3>
					<table class="table" style="width:600px;">
						<tbody>
							<tr>
								<th scope="row" class="sizesm">주문번호</th>
								<td>${order.code}</td>
							</tr>
							<tr>
								<th scope="row" class="sizesm">주문상태</th>
								<td>${order.state}</td>
							</tr>
							<tr>
								<th scope="row" class="sizesm">주문일</th>
								<td>${order.regdate}</td>
							</tr>
							<tr>
								<th scope="row" class="sizesm">수거 요청일</th>
								<td>${order.reservation_date}</td>
							</tr>
							<tr>
								<th scope="row" class="sizesm">배송지</th>
								<td>${order.order_addr}</td>
							</tr>
							<tr>
								<th scope="row" class="sizesm">요청내용</th>
								<td>${order.request}</td>
							</tr>
							<tr>
								<th scope="row" class="sizesm">수거용 송장번호</th>
								<td>${order.get_invoice_num}
									<c:if test="${not empty order.get_courier}">
										 &nbsp;<button type="type" onclick="showPopup2('https://tracker.delivery/#/${order.get_courier}/${order.get_invoice_num}')"
										 class="btn btn-dark" style="border-radius:0px;">배송조회</button>
									</c:if>
								</td>
							</tr>
							<tr>
								<th scope="row" class="sizesm">반환용 송장번호</th>
								<td>${order.send_invoice_num}
									<c:if test="${not empty order.send_courier}">
										 &nbsp;<button type="type" onclick="showPopup2('https://tracker.delivery/#/${order.send_courier}/${order.send_invoice_num}')"
										 class="btn btn-dark" style="border-radius:0px;">배송조회</button>
									</c:if>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div>
					<h3>
						<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-3-square-fill" viewBox="0 0 16 16">
						  <path d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2Zm5.918 8.414h-.879V7.342h.838c.78 0 1.348-.522 1.342-1.237 0-.709-.563-1.195-1.348-1.195-.79 0-1.312.498-1.348 1.055H5.275c.036-1.137.95-2.115 2.625-2.121 1.594-.012 2.608.885 2.637 2.062.023 1.137-.885 1.776-1.482 1.875v.07c.703.07 1.71.64 1.734 1.917.024 1.459-1.277 2.396-2.93 2.396-1.705 0-2.707-.967-2.754-2.144H6.33c.059.597.68 1.06 1.541 1.066.973.006 1.6-.563 1.588-1.354-.006-.779-.621-1.318-1.541-1.318Z"/>
						</svg><span>주문품목</span>
					</h3>
					<table class="table" style="width:600px;text-align:center;">
						 <thead>
						 	<tr>
						 		<th>NO</th>
						 		<th>품목명</th>
						 		<th>가격</th>
						 		<th>주문수량</th>
						 	</tr>
						 </thead>
						 <tbody>
							<c:forEach var="tmp" items="${orderItems }">
							 	<tr>	
									<td>${tmp.inum }</td>
									<td>${tmp.item }</td>
									<td><f:formatNumber value="${tmp.price }" pattern="#,###" /></td>
									<td>${tmp.count }</td>
							 	</tr>
							</c:forEach>	
						 </tbody>
					</table>
					<h4 style="float: right;">총 금액 : <f:formatNumber value="${order.order_price }" pattern="#,###" />원</h4>
				</div>
			</div>
			<div style="text-align:center; margin-top:30px;">
				<a href="javascript:window.history.back();" class="btn btn-lg btn-dark" style="border-radius:0px;">목록</a>
			</div>
		</div>
	</div>
	<jsp:include page="/include/footer.jsp"></jsp:include>
	<script>
		//팝업을 중앙에 띄우는 함수 
		function showPopup2(url){
			PopupCenter(url,"배송조회", 800, 500);
		}
		
		//팝업을 중앙에 원하는 페이지를 원하는  크기로 띄우는 함수 
		function PopupCenter(url, title, w, h) {
			// Fixes dual-screen position                         Most browsers      Firefox
			var dualScreenLeft = window.screenLeft != undefined ? window.screenLeft : screen.left;
			var dualScreenTop = window.screenTop != undefined ? window.screenTop : screen.top;
			
			width = window.innerWidth ? window.innerWidth : document.documentElement.clientWidth ? document.documentElement.clientWidth : screen.width;
			height = window.innerHeight ? window.innerHeight : document.documentElement.clientHeight ? document.documentElement.clientHeight : screen.height;
			
			var left = ((width / 2) - (w / 2)) + dualScreenLeft;
			var top = ((height / 2) - (h / 2)) + dualScreenTop;
			var newWindow = window.open(url, title, 'scrollbars=yes, width=' + w + ', height=' + h + ', top=' + top + ', left=' + left);
			
			// Puts focus on the newWindow
			if (window.focus) {
			    newWindow.focus();
			}
		}	
	</script>
</body>
</html>