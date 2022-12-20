<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/mypage/users/info.jsp</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/lsh.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nav.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/subFooter.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/subnav.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<style>
/* 프로필 이미지를 작은 원형으로 만든다 */
img {
   width: 100px;
   height: 100px;
}
#profileImage {
   width: 100px;
   height: 100px;
   border-radius: 50%;
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
		<jsp:param value="info" name="subPage"/>
	</jsp:include>
<div class="container" style="margin-bottom:250px">	
	<!-- <h1>가입 정보 입니다.</h1> -->
	<table class="n-table">
	<colgroup>
		<col style="width:25%">
		<col style="width:*">
	</colgroup>
		<tr style="border-top:1px solid #000;">
			<th>프로필 이미지</th>
			<td>
				<c:choose>
					<c:when test="${empty dto.profile }">
						<svg id="profileImage" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#ddd" class="bi bi-person-circle" viewBox="0 0 16 16">
							  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
							  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
						</svg>
					</c:when>
					<c:otherwise>
						<img id="profileImage" 
							src="${pageContext.request.contextPath}${dto.profile}" />
					</c:otherwise>
				</c:choose>
				<p class="imgtxt" >회원님을 알릴 수 있는 사진을 등록해 주세요.<br>등록된 사진은 회원님의 게시물이나 댓글들에 사용됩니다.</p>
			</td>
		</tr>
		<tr>
			<th>아이디</th>
			<td>${dto.id }</td>
		</tr>
		
		<tr>
			<th>주소</th>
			<td>${dto.addr }</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>${dto.email }</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td>${dto.phone }</td>
		</tr>
		<tr>
			<th>가입일</th>
			<td>${dto.regdate }</td>
		</tr>
	</table>
	<div class="lshbtnbox">
		<a class="lshbtn" href="${pageContext.request.contextPath}/mypage/users/updateform.do">개인정보 수정</a>
		<a class="lshbtn lshbtncenter" href="${pageContext.request.contextPath}/mypage/users/pwd_updateform.do">비밀번호 수정</a>
		<a class="lshbtn" href="javascript:deleteConfirm()">탈퇴</a>
	</div>
</div>
	<jsp:include page="/include/footer.jsp"></jsp:include>
<script>
	function deleteConfirm(){
		const isDelete=confirm("${id} 님 탈퇴 하시겠습니까?");
		if(isDelete){
			location.href="${pageContext.request.contextPath}/mypage/users/delete.do";
		}
	}
</script>
</body>
</html>