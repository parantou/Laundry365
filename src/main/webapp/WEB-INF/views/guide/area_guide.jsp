<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지역안내</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nav.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/subFooter.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/subnav.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<style>
	#area-wr, #subMenuText{
		animation: fadeIn;
		animation-duration: 1s; 
	}
	#area-wr{
		 margin-bottom: 250px;
	}
	#areaImgDiv{
		width:80%;
		margin:auto;
	}
	#areaImgDiv img{
		width: 100%;
		height: 100%;
		object-fit: cover;
		border-radius: 10px;
	}
	#areaTextDiv{
		width:80%;
		margin:70px auto;
		font-size:17px;
	}
	#areaTextDiv ul{
		list-style: none;
	}
	.textBold{
		font-weight: 600;
	}
	.areaTextTitle{
		font-size: 25px;
		font-weight: 600;
		margin-bottom:30px;
	}
	#areaContent1{
		margin-bottom: 10px;
		padding:10px;
	}
	#areaContent1 > p{
		line-height: 30px;
		margin-bottom: 2px;
	}
	#areaContent1 li{
		font-size: 14px;
	}
	#areaContent2{
		/* border:1px solid #A1A1AB; */
		padding:10px;
		/* border-radius: 10px; */
		/* width: 98%;
		margin:auto; */
	}
	#areaContent2 p:nth-child(1){
		color:#D73737;
		margin-bottom: 2px;
	}
	#areaContent2 p:nth-child(2){
		font-size: 14px;
		margin-bottom:30px;
	}
	#areaContent2 ul{
		line-height: 30px;
		font-size: 16px;
	}  
	#area-wr hr{
		margin: 50px auto;
	}
	#areaContent3{
		margin-bottom: 10px;
		padding:10px;
		line-height: 20px;
	}
	#areaContent3 p{
		margin-bottom: 7px;
	}
	#areaContent3 p:nth-child(2){
		margin-bottom:40px;
	} 
	#areaContent3 p:nth-child(n+3){
		color:#A1A1AB;
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
		<jsp:param value="guide" name="thisPage"/>
		<jsp:param value="area" name="subPage"/>
	</jsp:include>
	<div id="area-wr" class="container">
		<div id="areaImgDiv">
			<img src="${pageContext.request.contextPath}/resources/img/areaImg.png" alt="" />
		</div>
		<div id="areaTextDiv">
			<p class="areaTextTitle">서비스 지역 안내</p>
			<div id="areaContent1">
				<p class="textBold">서울 · 성남 · 하남 · 과천 · 안양 · 의왕 · 수원 · 인천 · 용인 · 고양 · 파주 운정신도시 · 부천 · 군포 ·  남양주 · 의정부 · 양주 옥정신도시 · 구리 · 김포 · 안산 · 화성 · 시흥</p>
				<ul>
					<li>양주시(6개동) - 회천 1동, 회천 2동, 회천 3동, 회천 4동, 양주 1동, 양주 2동</li>
					<li>김포시(7개동) - 고촌읍, 사우동, 풍무동, 김포본동, 운양동, 장기동, 장기본동</li>
					<li>화성시(5개동) - 기배동, 화산동, 진앙동, 반월동, 동탄동</li>
				</ul>
			</div>
			<div id="areaContent2">
				<p class="textBold">서비스 불가 지역 안내</p>
				<p>서비스 지역 내이나 아직 배송 밀도가 낮아 진출하지 못한 일부 지역이 있습니다. 빠른 시일내에 세특권이 될 수 있도록 노력하겠습니다.</p>
				<ul>
					<li><span class="textBold">강서구</span>과해동·공항동·오곡동·오쇠동 </li>
					<li><span class="textBold">성남시</span>수정구 고등동·시흥동·신촌동</li>
					<li><span class="textBold">하남시</span>미사동·천현동·감북동·춘군동·초이동</li>
					<li><span class="textBold">고양시</span>구산동·법곳동·산황동·사리현동·문봉동·지영동·성석동·설문동·고양동·관산동·효자동</li>
					<li><span class="textBold">부천시</span>오정동·대장동</li>
					<li><span class="textBold">군포시</span>대야동·속달동</li>
					<li><span class="textBold">남양주시</span>수동면·조안면</li>
					<li><span class="textBold">용인시</span>처인구</li>
				</ul>
			</div>
			<hr />
			<p class="areaTextTitle">운영시간</p>
			<div id="areaContent3">
				<p class="textBold">새벽배송 매일 23:00 - 07:00</p>
				<p>오늘 밤 11시까지 세탁신청하면 당일 새벽에 수거하고 모레 문 앞까지 새벽배송</p>
				<p>하루 빨리 대한민국 전역으로 뻗어 나가도록 숨 가쁘게 달리겠습니다.<p>
				<p>기다려주시는 고객님들께 진심으로 감사드립니다.</p>
			</div>
		</div>
	</div>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>