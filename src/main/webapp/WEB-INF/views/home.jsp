<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
 <head>
    <meta charset="UTF-8">
    <title>Document</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<!--font-->
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

    <!-- Font awesome -->
	<script src="http://code.jquery.com/jquery-2.1.3.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nav.css">
	<!--bootstrap-->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />
	<!-- CSS only -->
	<!-- JavaScript Bundle with Popper -->
	<style>
		.nav{height:80px; display:flex; justify-content:center; align-items:center;}
        .nav ul{text-align:center; font-size:0}
        .nav ul li{display:inline-block; margin:0 10px;}
        .nav ul li a{display:block; font-size:18px; font-weight:600; color:#000}
		* { font-family: 'Noto Sans KR', sans-serif !important;}
	    .section{background-size:cover !important;}
	    .section h1{font-size:3em; font-weight:600}

		/*영상*/
		#section0{
		position:relative;
		width:100%;
		height:100%;
		}



		.myvideo{
			position: absolute;
			top:0;
			left:0;
			width:100%;
			height:100%;
			background-size:100% 100%;
			background-color:#000;
			background-position: center center;
			background-size:contain;
			object-fit:cover;
			z-index: index 20;;
		}

		#section1 .flex {
			display: flex;
			width:100%;
			flex-wrap: wrap;
		    justify-content: space-between;
		}

		#section4{
			padding:50px 0;
		}
		#section4.fp-section,
		#section4 .fp-tableCell{height:auto !important;}
		#fp-nav ul li:last-child a,
		.fp-slidesNav ul li:last-child a{display:none}
		#section4 footer p{color:#fff;}

		/*반응형*/
		@media screen and(max-width:976px){
			#section0.fp-section,
			#section0 .fp-tableCell{height:auto !important;}

			#section1.fp-section,
			#section1 .fp-tableCell{height:auto !important;}

			#section2.fp-section,
			#section2 .fp-tableCell{height:auto !important;}

			#section3.fp-section,
			#section3 .fp-tableCell{height:auto !important;}
		}
		@media screen and(max-width:976px){
			#section0{padding:100px 0;}
		}
		
		/* section2 */
		.fp-viewing-anchor2{background-image: url("${pageContext.request.contextPath}/resources/img/back3.jpg"); background-size: cover; }
		#section1{
			width: 100%;
			margin: 0 auto;
			text-align: left;
			background-color: rgba(255, 255, 255, 0) !important;
		}
		#section1 .pic{
				float: left;
				width: 32%;
		}
		#section1 .pic img{   
			display: block;
			width:100%;
			margin: 0 auto;
		}
		#section1 .pic .pic_text{
			display: block;
			width:100%;
			margin: 0 auto;
		}
		#section1 .pic .pic_mid{
			font-size: 1.3em;
			line-height: 70px;
			font-weight: 600;
			color: #fff;
		}
		#section1 .pic_top{
			font-size: 2.2em;
			font-weight: bold;
			margin-bottom: 25px;
			color: #fff;
		}
		.pic_text_content_mid{
			padding-top: 25px;
			padding-bottom: 20px;
		}
		/* pic 텍스트 공통 코드 */
		.pic_text_content{
			font-size: 0.9em;
			color: #fff;
		}

		/* section3 */
		.fp-viewing-anchor3{background-image: url("${pageContext.request.contextPath}/resources/img/back7.jpg"); background-size: cover; }
		#section2{
			width: 100%;
			margin: 0 auto;
			text-align: left;
			background-color: rgba(255, 255, 255, 0) !important;
		}
		#section2 .inspection .pic_top_ins{
			font-size: 2.2em;
			font-weight: bold;
			color: #fff;
		}
		#section2 .inspection .pic_top_ins_text{
			text-align: left;
			font-size: 1em;
			padding-top: 25px;
			padding-bottom: 20px;
			color: #fff;
		}
		#section2 .flex{
			display: flex;
			justify-content: space-between;
		}
		#section2 .pic2{
			display: flex;
			align-items: center;
			justify-content: center;
				width: 100%;
			overflow: hidden;
			margin-bottom:10px;
		}
		#section2 .pic2 img {
			width:98%
		}

		/* section4 */

		#section3 {
			height: 100%;
			margin: 0 auto;
			text-align: left;
		}
		#section3 .imgbox{
			height: 100%;
			width: 100%;
			position : relative;
			overflow: hidden;
		}
		#section3 .imgbox > div{
			position: absolute; top:50%; left:20%; transform:translateY(-50%); 
		}

		#section3 .imgbox .imgbox_text{
			font-size: 2em;
			font-weight: bold;
			color: rgb(255, 255, 255);
		}
		.myButton {
			margin-top: 25px;
			width: 130px;
			line-height: 18px;
			background-color:#000;

			transition: all 0.5s ease;
			display:inline-block;
			cursor:pointer;
			color:#ffffff;
			font-family:Arial;
			font-size:16px;

			padding:16px 31px;
			text-decoration:none;
			text-shadow:0px 1px 0px #2f6627;
			text-align: center;
		}

		.myButton:hover {
			opacity: 0.7;
			color: white;
		}

		.container {
		padding-right: 15px;
		padding-left: 15px;
		margin-right: auto;
		margin-left: auto;
		}

		/* 푸터 css */

		.footer1{
			border-bottom: 1px solid rgb(255, 255, 255, 0.25);
			display: flex;
		}
		.footer1 a{
			text-decoration: none;
			color: #ffffff;
			margin-right: 8px;
		}
		.footermain{
			position: relative;
			width: 100%;
			margin-top: 10px;
		}
		.footer2{
			position: absolute;
		}
		.footer3{
			text-align: end;
		}
		.all2{
			font-size: 30px;
		}
		.footer_container{
			width: 90%;
			margin: 0 auto;
		}
	    footer a:hover{color:rgb(255, 255, 255, 0.8);}
		/* 푸터 수정 */
		@media (max-width: 768px) {
			.footer3 {
				display: block;
				text-align: left;
				padding-top: 65px;
			}
		}
			/* 푸터 수정 끝 */
		/* 푸터 css  끝*/

		@media (max-width: 768px) {
			.container {
				width: 750px;
			}
			#section2 .flex{
				display: flex;
				justify-content: space-between;
				flex-direction: column;
				height:150vw;
			}

			#section3 .imgbox .imgbox_text {
				left: 10%;
			}
			.myButton {
				left: 10%;
			}
			.section{padding-top:50px;} 

			#section2 .sec2_none {
				display:none;
			}
			#section2 .flex{
				height: auto !important;
			}
			#section3 {
				padding-top: 0;
			}
		}
		@media (max-width: 992px) {
			.container {
				width: 970px;
			}
			
			#section1 .pic {
				width:100%;
			}
			#section1 .sec1_top {
				margin-top:110px;
			}
		}
		@media (max-width: 1200px) {
			.container {
				width: 1170px;
			}
		}
		.mov_bg{
			position:absolute;
			bottom:5%;
			right:4%;
			z-index:4555;
		}
		.mov_bg > button{border:0; background: transparent;}
				
    </style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
 </head>
 <body>
	<jsp:include page="/include/nav.jsp"></jsp:include>
    <div id="fullpage">
	    <div class="section" id="section0">
			<video class="myvideo" id="video_obj" autoplay muted loop data-autoplay> 
				<source src="${pageContext.request.contextPath}/resources/img/Laundry365_sample4.mp4" type="video/mp4">
			</video>
			<div class="mov_bg">
				<button onclick="video_pause()" id="video-pause-btn" style="margin-right:5px;">
					<div class="video_play_btn" style="display:none;">
						<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="white" class="bi bi-play-fill" viewBox="0 0 16 16">
						  <path d="m11.596 8.697-6.363 3.692c-.54.313-1.233-.066-1.233-.697V4.308c0-.63.692-1.01 1.233-.696l6.363 3.692a.802.802 0 0 1 0 1.393z"/>
						</svg>
					</div>
					<div class="video_pause_btn">
						<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="white" class="bi bi-pause-fill" viewBox="0 0 16 16">
						  <path d="M5.5 3.5A1.5 1.5 0 0 1 7 5v6a1.5 1.5 0 0 1-3 0V5a1.5 1.5 0 0 1 1.5-1.5zm5 0A1.5 1.5 0 0 1 12 5v6a1.5 1.5 0 0 1-3 0V5a1.5 1.5 0 0 1 1.5-1.5z"/>
						</svg>
					</div>
				</button>
				<button onclick="video_mute_on()">
					<div class="volume_mute_btn">
						<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="white" class="bi bi-volume-mute" viewBox="0 0 16 16">
						  <path d="M6.717 3.55A.5.5 0 0 1 7 4v8a.5.5 0 0 1-.812.39L3.825 10.5H1.5A.5.5 0 0 1 1 10V6a.5.5 0 0 1 .5-.5h2.325l2.363-1.89a.5.5 0 0 1 .529-.06zM6 5.04 4.312 6.39A.5.5 0 0 1 4 6.5H2v3h2a.5.5 0 0 1 .312.11L6 10.96V5.04zm7.854.606a.5.5 0 0 1 0 .708L12.207 8l1.647 1.646a.5.5 0 0 1-.708.708L11.5 8.707l-1.646 1.647a.5.5 0 0 1-.708-.708L10.793 8 9.146 6.354a.5.5 0 1 1 .708-.708L11.5 7.293l1.646-1.647a.5.5 0 0 1 .708 0z"/>
						</svg>
					</div>
					<div class="volume_up_btn" style="display:none;">
						<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="white" class="bi bi-volume-up" viewBox="0 0 16 16">
						  <path d="M11.536 14.01A8.473 8.473 0 0 0 14.026 8a8.473 8.473 0 0 0-2.49-6.01l-.708.707A7.476 7.476 0 0 1 13.025 8c0 2.071-.84 3.946-2.197 5.303l.708.707z"/>
						  <path d="M10.121 12.596A6.48 6.48 0 0 0 12.025 8a6.48 6.48 0 0 0-1.904-4.596l-.707.707A5.483 5.483 0 0 1 11.025 8a5.483 5.483 0 0 1-1.61 3.89l.706.706z"/>
						  <path d="M10.025 8a4.486 4.486 0 0 1-1.318 3.182L8 10.475A3.489 3.489 0 0 0 9.025 8c0-.966-.392-1.841-1.025-2.475l.707-.707A4.486 4.486 0 0 1 10.025 8zM7 4a.5.5 0 0 0-.812-.39L3.825 5.5H1.5A.5.5 0 0 0 1 6v4a.5.5 0 0 0 .5.5h2.325l2.363 1.89A.5.5 0 0 0 7 12V4zM4.312 6.39 6 5.04v5.92L4.312 9.61A.5.5 0 0 0 4 9.5H2v-3h2a.5.5 0 0 0 .312-.11z"/>
						</svg>
					</div>
				</button>
			</div>
		</div>			

	

		<!-- section 2 -->

		<div class="section container" id="section1" style="float: none; margin:100 auto;">
		<div class="col sec1_top">
		<span class="pic_top">365일 깨끗하게</span> 
		<p class="pic_text_content pic_text_content_mid" >
			타협없는 세탁물질에 대한 철학으로 모든 세탁물을 철저한 단계별 스마트 클리닝 시스템으로 케어합니다.
		</p>
		</div>
		<div class="flex">
			<div class="pic">
				<img src="${pageContext.request.contextPath}/resources/img/section2_1.jpg"class="mx-auto d-block" alt="프리미엄 클리닝">
				<div class="pic_text">
					<span class="pic_mid">프리미엄 클리닝</span>    
					<p class="pic_text_content">
					한 번에 단 1~2벌만 세탁하는 Electroux의 프로페셔널 라인을 
					사용해 세탁 마찰에 의한 원단 손상을 최소화합니다.
					</p>
				</div>
			</div>
			<div class="pic">
				<img src="${pageContext.request.contextPath}/resources/img/section2_2.png" class="mx-auto d-block" alt="편백나무 자연 건조실">
				<div class="pic_text">
					<span class="pic_mid">편백나무 자연 건조실</span>
					<p class="pic_text_content">
					장시간 기계 건조 시 원단에 무리를 줄 수 있는
					세탁물은 편백나무 자연 건조실에서 케어합니다.
					</p>
				</div>
			</div>
			<div class="pic">
				<img src="${pageContext.request.contextPath}/resources/img/section2_3.jpg" class="mx-auto d-block" alt="수선">
				<div class="pic_text">
					<span class="pic_mid">수선</span>
					<p class="pic_text_content">
					수십년 경력의 전문 수선사들이 어려운 난이도의 의류
					수선까지 모두 고객 요청의 디테일을 반영해 수선합니다.
					</p>
				</div>
			</div>
		</div>
		</div>

		<!-- section3 -->

		<div class="section container" id="section2" style="float: none; margin:100 auto;">
		<div class="inspection grid">
			<span class="pic_top_ins">검품</span>
			<p class="pic_top_ins_text" >
				고객의 요청사항이 모두 반영되었는지 최선의 케어를 진행했는지 
				세탁물의 완성도를 체크합니다.<br/>
				기준을 통과하지 못한 세탁물은 다시 클리닝단계로 이동해
				재케어를 실시하고 출고 전 의류 별 안전포장을 진행합니다.
			</p>
		</div>
		<div class="flex">
			<div class="pic2 g-col-6" >
				<img src="${pageContext.request.contextPath}/resources/img/section3_1.jpg" class="d-block" 
				alt="수선사진" width="48%" >
			</div>
			<div class="pic2 g-col-6 sec2_none" id="pic3_none">
				<img src="${pageContext.request.contextPath}/resources/img/section3_2.jpg" class="d-block" 
				alt="세탁기" width="48%" >
			</div>
		</div>
		</div>

		<!-- section4 -->

		<div class="section" id="section3">
			<div class="imgbox ">
				<img src="${pageContext.request.contextPath}/resources/img/section4_4.jpg" alt="예약하기 배경화면" width=auto; height=auto;>
				<div>
					<div>
						<span class="imgbox_text">오늘밤, <br/>귀찮은 세탁은 <br/>Laundry365에게 맡기세요.</span>
					</div>
					<div>
						
						<a href="${pageContext.request.contextPath}/reserve/reserve_select.do" class="myButton">예약하기</a>
					</div>
				</div>
			</div>
		</div>
		
		<div class="section" id="section4">
			<jsp:include page="/include/footer.jsp"></jsp:include>
		</div>
	</div>
    
	<!--fullpage_js-->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fullpage.css" type="text/css">
	<script src="${pageContext.request.contextPath}/resources/js/fullpage.js" type="text/JavaScript"></script>
	<script>
	    $(document).ready(function(){
		    $("#fullpage").fullpage({
				anchors : ['anchor1','anchor2','anchor3','anchor4','anchor5'],
			    sectionsColor : ['#ffcc00','#ffffff','#ffffff','#ffffff','#212121'],//섹션의 색상
				autoScrolling : true,//휠유무
				scrollBar : false,//스크롤여부
				showActiveTooltip : true, //블릿툴팁의 현재표시
				navigation : true,//블릭네비
				navigationPosition : 'right',//블릿위치
				navigationTooltips : ['Laundry365','서비스소개','검품안내','예약하기'],
				showActiveTooltip : true, //블릿툴팁의 현재표시
				loopBottom : false,
				continuousVertical : false, //연속수직
				responsiveWidth : 976,
			});
		});
	    function video_mute_on() {
	        var video_obj = document.getElementById("video_obj");
	        if(video_obj.muted == true){
	        	video_obj.muted = false;
	        	document.querySelector(".volume_mute_btn").style.display="none";
	        	document.querySelector(".volume_up_btn").style.display="block";
	        }else if(video_obj.muted == false){
	        	video_obj.muted = true;
	        	document.querySelector(".volume_up_btn").style.display="none";
	        	document.querySelector(".volume_mute_btn").style.display="block";
	        }
	    }
	    function video_pause() {
            var video_obj = document.getElementById("video_obj");
            if(video_obj.paused){
            	video_obj.autoplay = false;
                video_obj.play();
	        	document.querySelector(".video_play_btn").style.display="none";
	        	document.querySelector(".video_pause_btn").style.display="block";
            }else{
            	video_obj.autoplay = false;
                video_obj.pause();
	        	document.querySelector(".video_pause_btn").style.display="none";
	        	document.querySelector(".video_play_btn").style.display="block";

            }
        }
	</script>
 </body>
</html>
