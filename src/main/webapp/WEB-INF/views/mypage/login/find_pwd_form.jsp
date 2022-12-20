<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호찾기</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-2.1.3.min.js"></script>
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
	#findpwdform_wr{
		width: 100%;
		height: 600px;
		text-align: center;
	}
	#body_content{
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
	.input-group{
		border-color:#dddddd; 
		border-radius:0px;
	}
	#idFindBtn{
		border-color:#dddddd;
		border-radius:0px;
	}
	#idFindBtn:hover{
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
		<jsp:param value="findpwd" name="thisPage"/>
		<jsp:param value="findpwd" name="subPage"/>
	</jsp:include>
	<div id="findpwdform_wr">
		<div id="body_content">
			<form action="#" id="findPwdForm" method="post" autocomplete="off">
				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon1" style="border-color:#dddddd; border-radius:0px; width:80px;">아이디
					 </span>
					 <input class="form-control" type="text" id="id" name="id">
				</div>
				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon1" style="border-color:#dddddd; border-radius:0px;width:80px;">이름
					 </span>
					 <input class="form-control" type="text" id="name" name="name">
				</div>
				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon1" style="border-color:#dddddd; border-radius:0px;width:80px;">E-mail
					 </span>
					 <input class="form-control" type="text" id="email" name="email">
				</div>
				<div class="row row-cols-1">
					<div class="col d-grid gap-1 mx-auto mb-3">
						<button class="btn btn-dark" type="submit" style="border-radius:0px;">계속</button>
					</div>
					<div class="col">
						<a href="find_id_form.do" class="btn" id="idFindBtn">Forgot ID?</a>
					</div>
				</div>
			</form>
			<div id="addPwdForm"></div>
		</div>
	</div>
	<jsp:include page="/include/footer.jsp"></jsp:include>
	<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
	<script>
		const form=document.querySelector("#findPwdForm"); //폼의 참조값
		
		form.addEventListener("submit", function(event){
			event.preventDefault();
			let id=document.querySelector('#id');
			let name=document.querySelector('#name');
			let email=document.querySelector('#email');
			
			if(id.value=="" || name.value=="" || email.value==""){
				if(id.value==""){
					id.focus();	
				}else if(name.value==""){
					name.focus();
				}else{
					email.focus();
				}
			}else{
				// URLSearchParams 객체에 폼 객체를 넣어서 toString()메소드를 사용해 쿼리 문자열로 변경
				const qs=new URLSearchParams(new FormData(form)).toString(); //query string

	            fetch('check_user.do',{
					method:"POST",
					headers:{"Content-Type":"application/x-www-form-urlencoded; charset=utf-8"},
					body:qs      	
	            }).then(function(res){
					return res.json();
				}).then(function(data){
					if(data.user==null){
						alert('입력하신 정보와 일치하는 회원정보가 없습니다.');
					}else{
						form.innerHTML="";
						
						ajaxPromise("update_pwd_form.do","get","id="+data.user.id)
			            .then(function(res){
							return res.text();
						}).then(function(data){
							console.log(data);
							$('#addPwdForm').html(data);
							//document.querySelector('#addPwdForm').innerHTML+=data;
						});
					}
				});
			}
		});
	</script>
</body>
</html>