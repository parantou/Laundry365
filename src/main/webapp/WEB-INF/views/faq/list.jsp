<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주묻는질문</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nav.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/subFooter.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/subnav.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>

<style>
	.btn{border-radius: 0px !important;}
	* { font-family: 'Noto Sans KR', sans-serif !important;}
	th,td{text-align:center;}
	a:hover{color : rgba(0, 0, 0, 0.6) !important;}
	.page-ui a{
		text-decoration: none;
		color: #000;
	}
	
	.page-ui{margin: 30px auto;}
	.page-ui a{
		text-decoration: none;
		color :black;
	}
	
	.page-ui a:hover{
		text-decoration: underline;
		color : rgba(0, 0, 0, 0.7);
	}
	.page-ui ul{
		list-style-type: none;
		padding: 0;
	}
	
	.page-ui ul > li{
		float: left;
	}
	.question:hover{
		cursor: pointer;
		color : rgba(0, 0, 0, 0.6) !important;
	}
	.answer{
		display: none;
		background-color:white !important;
	}
	#btnGroup{		
		display: inline-block;
		margin-bottom: 20px;
	}
	.btn1{
	   border: 1px solid rgb(0, 0, 0);
	   text-transform: uppercase;
	   padding: 0.6rem 1rem;
	   cursor: pointer;
	   background: rgb(0, 0, 0);
	   color: #ffffff;
	   transition: all 0.5s ease;
	   border-radius: 0px;
	   text-decoration-line: none;
	}
	.btn1:hover{
	    background: transparent;
	    color: #000000;
	}
	#btnGroup a{
		margin: 0px 30px;
		width: 100px;
	}
	.blind{
	  position: absolute;
	  width: 1px;
	  height: 1px;
	  clip: rect(0 0 0 0);
	  overflow: hidden;
	}
	.container{
		margin-bottom: 200px;
	}
	#btnGroup .btn1:focus{
	background: transparent;
   	color: #000000;
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
		<h1 style="font-size:30px; text-align:center">FAQ</h1>
		<div class="mb-3" style="display:flex; justify-content:center;">
			<span class="css-1y7lkh5">고객님들께서 가장 자주하시는 질문을 모두 모았습니다.</span>		
		</div>
		<div id="btnGroup" style="display:flex; justify-content:center;">
			<button type="button" class="btn1" value="service">서비스 이용</button>
			<button type="button" class="btn1" value="order">주문·결제·배송</button>
			<button type="button" class="btn1" value="member">회원정보</button>
			<button type="button" class="btn1" value="etc">기타</button>
		</div>
		<button class="btn btn-outline-dark mb-3" id="qna" style="float:right" onclick="location.href='${pageContext.request.contextPath}/qna/list.do' ">1:1문의하러 가기</button>
		<div id="faqTableDiv">
			<table class="table" id="table">
				<thead>
					<tr>
						<th style="width:20%;">NO</th>
						<th style="width:15%;">카테고리</th>
						<th style="width:65%;">제목</th>
						<c:if test="${not empty id and manager == 'Y'}">
						<th scope="col">수정</th>
						<th scope="col">삭제</th>
						</c:if>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="tmp" items="${list }">
					<c:set var="i" value="${i+1 }"/>
					<tr class="question" data-num="${tmp.num }">
						<td>${i }</td>						
						<c:choose>
							<c:when test="${tmp.category eq 'service' }">
							<td>[서비스 이용]</td>
							</c:when>
							<c:when test="${tmp.category eq 'order' }">
							<td>[주문·결제·배송]</td>
							</c:when>
							<c:when test="${tmp.category eq 'member' }">
							<td>[회원정보]</td>
							</c:when>
							<c:when test="${tmp.category eq 'etc' }">
							<td>[기타]</td>
							</c:when>
						</c:choose>							
						<td>						
							${tmp.title }<i class="bi bi-chevron-down" style="float:right"></i>
						</td>
						<c:if test="${ not empty id and manager == 'Y'}">
						<td><a class="btn btn-outline-white" href="updateform.do?num=${tmp.num }"><i class="bi bi-pencil-fill"></i><span class="blind">수정</span></a></td>
						<td><a class="btn btn-outline-white" href="delete.do?num=${tmp.num }"><i class="bi bi-x-circle-fill"></i><span class="blind">삭제</span></a></td>
						</c:if>
					</tr>
		
					<tr class="answer" id="answer${tmp.num }" style="background-color:white !important;">
						<td colspan="100%">
						<div style="text-align: left;  margin-left: 10%; ">
							${tmp.content}
						</div>
						</td> 
					</tr>
				</c:forEach>
				</tbody>
			</table>		
		</div>

		<c:if test="${not empty manager and manager == 'Y'}">
			<button class="btn btn-outline-dark" style="float:right" onclick="location.href='insertform.do' ">글쓰기</button>
		</c:if>	
		<div class="page-ui clearfix" style="display:flex; justify-content:center;">
			<ul class="pagination">
				<c:if test="${startPageNum ne 1 }">
					<li class="page-item">
						<a class="page-link" href="list.do?pageNum=${startPageNum-1 }&condition=${condition }&keyword=${encodedK }">Prev</a>
					</li>
				</c:if>
				<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
					<li class="page-item">
						<c:choose>
							<c:when test="${pageNum eq i }">
								<a  class="page-link" class="active" href="list.do?pageNum=${i }&condition=${condition }&keyword=${encodedK }">${i }</a>
							</c:when>
							<c:otherwise>
								<a class="page-link" href="list.do?pageNum=${i }&condition=${condition }&keyword=${encodedK }">${i }</a>
							</c:otherwise>
						</c:choose>
					</li>
				</c:forEach>
				<c:if test="${endPageNum lt totalPageCount }">
					<li class="page-item">
						<a class="page-link" href="list.do?pageNum=${endPageNum+1 }&condition=${condition }&keyword=${encodedK }">Next</a>
					</li>
				</c:if>
			</ul>
	</div>
	<div class="mr-2" style="display:flex; justify-content:center;">
		<form action="list.do" method="get" style="height:33px;"> 
		<label for="condition"></label>
		<select name="condition" id="condition" style="height:100%;">
			<option value="title_content" ${requestScope.condition eq 'title_content' ? 'selected' : '' }>제목+내용</option>
			<option value="title" ${condition eq 'title' ? 'selected' : '' }>제목</option>
			
		</select>
		<input style="height:100%;" type="text" id="keyword" name="keyword" placeholder="검색어..." value="${keyword }"/>
		<button style="height:100%; margin-top:-5px;" class="btn btn-outline-dark btn-sm" type="submit">검색</button>
	</form>	
	</div>
	</div>
	<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
    	$(".btn1").click(function(){
    			var category = $(this).val(); 	
    			ajaxPromise('${pageContext.request.contextPath }/faq/ajax_faq_list.do', 'get', "category="+category)
    			.then(function(res){
    				return res.text();
    			}).then(function(data){
    				console.log(data);
    				$('#faqTableDiv').html("");
    				$('#faqTableDiv').html(data);
    			});
    		});
		
		$(".question").click(function(){
			//data-num 속성으로 저장된 번호를 읽어와서 
			let num=$(this).attr("data-num");
			//선택자로 활용한다.
			$("#answer"+num).fadeToggle(400);
		});
		
		//클라이언트가 로그인 했는지 여부
		let isLogin=${ not empty id };
		
		//1:1문의하러가기 버튼에 click이벤트가 일어났을때 실행할 함수 등록
		document.querySelector("#qna")
			.addEventListener("click", function(e){
				//만일 로그인 하지 않았으면 
				if(!isLogin){
					//폼 전송을 막고 
					e.preventDefault();
					//로그인 폼으로 이동 시킨다.
					//로그인 성공후 다시 해당글 자세히 보기 페이지로 돌아올 수 있도록 url 정보를  같이 전달한다.
					location.href=
						"${pageContext.request.contextPath}/users/login_form.do?url=${pageContext.request.contextPath}/qna/list.do";
				}
			});
	</script>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>







