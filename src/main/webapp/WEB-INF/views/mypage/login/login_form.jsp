<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
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
	#image-box{
		width: 100%;
		height: 300px;
		overflow: hidden;
		margin-bottom: 30px;
	}
	#subMenuText{
		height: 150px;
		position:relative;
	}
	#loginform_wr {
		width: 100%;
		height: 600px;
		text-align: center;
	} 
	#body-content{
		width: 25%;
		display: inline-block;
	}
	footer{
		width:100%;
		bottom: 0px;
	}
	.input-group span{
		background-color:white;
	}
	#sign_findBtn a{
		border-color:#dddddd;
		border-radius:0px;
	}
	#sign_findBtn a:hover{
		background-color:black;
		color:white;
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
		<jsp:param value="login" name="thisPage"/>
		<jsp:param value="login" name="subPage"/>
	</jsp:include>
	<div class="container" id="loginform_wr">
		<div id="body-content">
			<form id="loginForm" action="login.do" method="post" autocomplete="off">
				<!-- 로그인 성공후 어디로 갈지에 대한 정보를 url 이라는 파라미터 명으로 같이 전송되도록 한다. -->
				<c:choose>
					<c:when test="${ empty param.url }">
						<input type="hidden" name="url" value="${pageContext.request.contextPath}/"/>
					</c:when>
					<c:otherwise>
						<input type="hidden" name="url" value="${param.url }"/>
					</c:otherwise>
				</c:choose>
				<div class="input-group mb-3">
				  <span class="input-group-text" id="basic-addon1" style="border-color:#dddddd; border-radius:0px;">
				  	<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
					  <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
					</svg>
				  </span>
				  <input class="form-control" type="text" name="id" id="id" style="border-color:#dddddd; border-radius:0px;">
				</div>
				
				<div class="input-group">
				  <span class="input-group-text" id="basic-addon2" style="border-color:#dddddd; border-radius:0px;">
					<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-lock" viewBox="0 0 16 16">
					  <path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2zM5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1z"/>
					</svg>
				  </span>
				  <input class="form-control" type="password"  name="pwd" id="pwd" style="border-color:#dddddd; border-radius:0px;"  onkeyup="checkCapsLock(event)">
				</div>
				<p id="message" class="mt-1 mb-3"></p>
				<div class="row row-cols-1">
					<div class="col d-grid gap-1 mx-auto mb-3">
						<button class="btn btn-dark" type="submit" style="border-radius:0px;">Sign in</button>
					</div>
					<div class="col d-flex justify-content-between mb-2" id="sign_findBtn">
						<a href="signup_form.do" class="btn" style="width:150px;">Sign up</a>
						<a href="find_pwd_form.do" class="btn" style="width:150px;" >Password?</a>		
					</div>			
					<div class="col">
						<input type="checkbox" name="saveId" id="saveIdCB" class="form-check-input me-1"/>
    					<label class="form-check-label" for="saveIdCB">Remember me?</label>
					</div>
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="/include/footer.jsp"></jsp:include>
	<script>
		window.onload=function(){
			const key='${cookie.saveId.value}';
			const idEl=document.querySelector('#id');
			const checkEl=document.querySelector('#saveIdCB');
			idEl.value=key;
			
			if(idEl.value != ""){
				checkEl.checked=true;
			}
		}
	
		document.querySelector('#loginForm').addEventListener("submit", function(event){
			let id=document.querySelector('#id').value;
			let pwd=document.querySelector('#pwd').value;
			
			if(id=="" || pwd==""){
				event.preventDefault();
				alert("아이디와 비밀번호를 입력해주세요.");
			}
		});
		
/* 		function checkCapsLock(event)  {
		  if (event.getModifierState("CapsLock")) {
		    document.getElementById("message").innerText 
		      = "Caps Lock이 켜져 있습니다."
		  }else {
		    document.getElementById("message").innerText 
		      = ""
		  }
		} */
		
		function checkCapsLock(event)  {
		  if (event.getModifierState("CapsLock")) {
		    document.getElementById("message").innerText 
		      = "Caps Lock이 켜져 있습니다."
		  }else {
		    document.getElementById("message").innerText 
		      = ""
		  }
		}
	</script>
</body>
</html>