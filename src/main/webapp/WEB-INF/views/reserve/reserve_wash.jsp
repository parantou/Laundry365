<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>product</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/reserve_img/jquery css/jquery.datetimepicker.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/reserve_img/reserve.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nav.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/subFooter.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/subnav.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
</head>
<body>
<jsp:include page="/include/nav.jsp"></jsp:include>
<jsp:include page="/include/subnav.jsp">
      <jsp:param value="reserve" name="thisPage"/>
      <jsp:param value="reserve" name="subPage"/>
</jsp:include>
<div class="container">
    <p class="prod">step02 상품선택</p>
    <main id="order_wrap">
        <div class="left">
            <img src="${pageContext.request.contextPath}/reserve_img/990A4A4A5DB90F5C2F.png" style="border-radius:2%;">
        </div>
        <div class="right">
            <div class="top">
                <h1>상품구매</h1>
                <dl>
                    <dt>상품명</dt>
                    <dd>생활빨래</dd>
                    <dt>옵션</dt>
                    <dd>
                        <select name="product" id="product" class="form-select">
                            <optgroup label="상품선택">
                                <option value="">선택해주세요</option>
                                <c:forEach var="tmp" items="${list }">
                                <!-- data-inum을 사용해서 inum이라는 이름으로 요소에 data 담기, value는  상품의 primary key인 ${tmp.inum }을 담는다.-->
                                <option class="for" id="${tmp.inum }" data-inum="${tmp.inum }" value="${tmp.price }">${tmp.item }</option>
                                </c:forEach>
                            </optgroup>
                        </select>
                    </dd>
                    <dt>예약날짜</dt>
                    <dd>
                        <input type="text" id="one" class="date form-control" autocomplete='off'/>
                    </dd>
                </dl>
                <div class="number">
                    <ul class="order_name">

                    </ul>
                    <div class="order_number" style="text-align:left; width: 100px;">
                        
                    </div>
                </div>
                <div class="total_price">
                    <p>총 상품 금액</p>
                    <p class="result_price" value="0"></p>
                </div>
            </div>
            <div class="bottom">
                <button type="button" onclick="nextViewPage()" id="order_btn">예약하기</button>
            </div>
        </div>
    </main>
    <div class="explain">
        <h1>수거 및 배송 안내</h1>
        <img src="${pageContext.request.contextPath}/reserve_img/umile_vx_1-768x303.png">
        <div class="process">
            <p>
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-1-circle" viewBox="0 0 16 16">
                <path d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8Zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0ZM9.283 4.002V12H7.971V5.338h-.065L6.072 6.656V5.385l1.899-1.383h1.312Z"/>
                </svg> 수거
            </p>
            <p>
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-2-circle" viewBox="0 0 16 16">
                <path d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8Zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0ZM6.646 6.24v.07H5.375v-.064c0-1.213.879-2.402 2.637-2.402 1.582 0 2.613.949 2.613 2.215 0 1.002-.6 1.667-1.287 2.43l-.096.107-1.974 2.22v.077h3.498V12H5.422v-.832l2.97-3.293c.434-.475.903-1.008.903-1.705 0-.744-.557-1.236-1.313-1.236-.843 0-1.336.615-1.336 1.306Z"/>
                </svg> 세탁 및 건조
            </p>
            <p>
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-3-circle" viewBox="0 0 16 16">
                    <path d="M7.918 8.414h-.879V7.342h.838c.78 0 1.348-.522 1.342-1.237 0-.709-.563-1.195-1.348-1.195-.79 0-1.312.498-1.348 1.055H5.275c.036-1.137.95-2.115 2.625-2.121 1.594-.012 2.608.885 2.637 2.062.023 1.137-.885 1.776-1.482 1.875v.07c.703.07 1.71.64 1.734 1.917.024 1.459-1.277 2.396-2.93 2.396-1.705 0-2.707-.967-2.754-2.144H6.33c.059.597.68 1.06 1.541 1.066.973.006 1.6-.563 1.588-1.354-.006-.779-.621-1.318-1.541-1.318Z"/>
                    <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0ZM1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8Z"/>
                    </svg> 배송
                </p>
        </div>
        <div class="procedure">
            <img src="${pageContext.request.contextPath}/reserve_img/다운로드.jpg">
            <img src="${pageContext.request.contextPath}/reserve_img/96167986-평면-현대적인-디자인에-세탁-서비스-벡터-일러스트입니다-청소-개념.webp">
            <img src="${pageContext.request.contextPath}/reserve_img/115710901-세탁-및-깨끗한-아이콘의-고립-된-개체입니다-주식에-대-한-세탁-및-옷-벡터-아이콘의-집합입니다-.webp">
        </div>
        <h2>Laundry365에서<br>깨끗하고 안전하게! 배송해드리겠습니다!</h2>
    </div>
</div>
    <script src="${pageContext.request.contextPath}/reserve_img/jquery js/jquery-3.4.1.js"></script>
    <script src="${pageContext.request.contextPath}/reserve_img/jquery js/jquery.datetimepicker.full.min.js"></script>
<script src="${pageContext.request.contextPath}/reserve_img/jquery js/jquery-3.4.1.js"></script>
    <script src="${pageContext.request.contextPath}/reserve_img/jquery js/jquery.datetimepicker.full.min.js"></script>
    <script>
        $.datetimepicker.setLocale("ko");
		
        $("#one").datetimepicker({minDate: 0});
       
		var idNum = 0;
		
		let inums="";
        $("#product").on("change", function(){
        	idNum += 1;
        	//선택한 상품의 inum을 inums에 이어 담기
        	inums+=$("#product option:selected").data('inum')+"/"; 
        	var msg2=parseInt($("#product option:selected").val());
            var msg=$("#product option:selected").text();
            $("#number").text(msg);
            $("#inputMsg").val("");
            $('.order_number').append('<input type="number" class="product" name="num" id="num'+idNum+'" min="1" max="30" value="1" onchange="history(this.value,'+msg2+',this.id);">');
            $('.order_number').append('<span class="num'+idNum+' in" name="number">'+msg2+'</span>');
            $("<li class=\"productName\"></li>").text(msg).appendTo(".order_name");
            var sum = 0;
        	$('.in').each(function(){

        		sum += parseInt($(this).text());
        	});
           
            $('.result_price').text(sum);
            
        });

    function history(countNum,countPrice,getId){
    	var testtt = countNum * countPrice;
    	
    	
    	$('.'+getId).text(testtt);
    	ttt();
    	
    }
    function ttt(){
    	var sum = 0;
    	$('.in').each(function(){

    		sum += parseInt($(this).text());
    	});
    	$('.result_price').text(sum);
    }
    
    function nextViewPage(){
    	var sum ='이름';
    	var sum2 ='가격';
    	var sum3 ='수량';
    	var sum4 ='예약날짜';
    	$('.productName').each(function(){
    		sum = sum + '/' + $(this).text();
    	});
    	$('.in').each(function(){
    		sum2 = sum2 + '/' + $(this).text();
    	});
    	$('.product').each(function(){
    		sum3 = sum3 + '/' + $(this).val();
    	});
    	$('.date').each(function(){
    		sum4 = sum4 + '/' + $(this).val();
    	});
    	

    	//number라는 key에 inums 담기
    	var text = '${pageContext.request.contextPath}/reserve/reserve_credit.do?name='+sum
    				+'&price='+sum2+'&count='+sum3+'&date='+sum4+'&number='+inums+'&category=${param.category}'; 
    
    	if(sum4=="예약날짜/"){
    		alert('예약 날짜를 선택해주세요');
    	}else if(inums==""){
    		alert('상품을 선택해 주세요');
    	}else{
    		location.href=text;	
    	}
    }
    </script>
   <jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>