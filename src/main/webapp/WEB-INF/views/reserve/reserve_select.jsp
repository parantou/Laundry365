<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>reserve_service.html</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nav.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/subFooter.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/subnav.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <style>
    	body{
        	background: #f5f5f5;
    	}
        .at{
            text-decoration: none;
            color: black;
        }
        .at:hover{
            color: #6b6b6b;
        }
        .imga{
            width: 50px;
            height: 50px;
        }
        .main_back{
            background-color: #f5f5f5;
            padding-bottom: 100px;
        }
        .container{
            color: #6b6b6b;
            background-color: #ffffff;
            width: 1000px;
            padding: 0px !important;
        }
        .row-cols-2{
            width: 100% !important;
            margin: 0 auto;
            margin-top: 0px;
        }
        .text_loc{
            margin-top: 5px;
        }
        .sm_text{
            font-size: 0.8em;
        }
        .col{
            height: 350px;
            text-align: center;
            padding : 100px 0;
            border: 15px solid #f5f5f5;            
        }
        .select_box:hover{
			animation: pulse;
			animation-duration: 1s; 
        }
    </style>
</head>
<body>
<jsp:include page="/include/nav.jsp"></jsp:include>
<jsp:include page="/include/subnav.jsp">
   <jsp:param value="reserve" name="thisPage"/>
   <jsp:param value="reserve" name="subPage"/>
</jsp:include>

    <div class="main_back">
        <div class="container text-center">
            <div class="row row-cols-2">
            <div class="col select_box">
                <a href="${pageContext.request.contextPath}/reserve/select.do?category=clothes" class="at">
                    <img src="${pageContext.request.contextPath}/reserve_img/service1.png" class="imga" alt="생활빨래">
                    <p>생활빨래</p>
                    <p class="sm_text">좋은 세제와 향기를 <br>고객분들에게 다가갑니다.</p>
                </a>  
            </div>
            <div class="col select_box">
                <a href="${pageContext.request.contextPath}/reserve/select.do?category=bedding" class="at">
                    <img src="${pageContext.request.contextPath}/reserve_img/service2.png" class="imga" alt="침구류">
                    <p>침구류</p>
                    <p class="sm_text">다양한 이불들을 <br>저렴한 세탁으로 만나보세요.</p>
                </a>
            </div>
            <div class="col select_box">
                <a href="${pageContext.request.contextPath}/reserve/select.do?category=shoes" class="at">
                    <img src="${pageContext.request.contextPath}/reserve_img/service3.png" class="imga" alt="운동화">
                    <p>운동화,구두</p>
                    <p class="sm_text">세탁하기 번거로운 <br>운동화를 꺠끗하게!</p>
                </a>
            </div>
            <div class="col select_box">
                <a href="${pageContext.request.contextPath}/reserve/select.do?category=living" class="at">
                    <img src="${pageContext.request.contextPath}/reserve_img/service4.png" class="imga" alt="리빙">
                    <p class="text_loc">리빙</p>
                    <p class="sm_text">미세먼지 없는<br> 집안생활은 리빙세탁으로!</p>
                </a>
            </div>
            </div>
        </div>
    </div>
    <script src="./jquery js/jquery-3.4.1.js"></script>
    <script>
    </script>
<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>