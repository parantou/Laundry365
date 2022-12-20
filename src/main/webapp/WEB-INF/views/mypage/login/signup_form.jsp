<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nav.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/subFooter.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/subnav.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<style>
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
	#container_form, #container_terms{
		border:1px solid black;
		border-radius: 10px;
		width: 50%;
		margin-bottom: 250px;
	}
	#container_form{
		padding:48px;
	}
	#btnGroup{
		margin-top:30px;
		text-align: center;
	}
	#btnGroup a.btn{
		border-radius:0px;
		width: 130px;
		height:45px;
	}
	#btnGroup a.btn-dark:hover{
		background-color:white;
		color:black;
	}
	.form-control{
		border: 1px solid #dddddd !important;
		border-radius:0 !important;
	}
	input.is-invalid{
		background-color:white;
	}
	#signupBtn{
		border-radius:0px; 
		width:120px; 
		heigth:40px; 
		margin-top:30px;
		background-color:white;
		color:black;
	}
	
	#signupBtn:hover{
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
		<jsp:param value="signup" name="thisPage"/>
		<jsp:param value="signup" name="subPage"/>
	</jsp:include>
	<main>
		<jsp:include page="include/join_terms.jsp"></jsp:include>
		<jsp:include page="include/join_form.jsp"></jsp:include>
	</main>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>










