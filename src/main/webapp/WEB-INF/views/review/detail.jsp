<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기게시판</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-2.1.3.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nav.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/subFooter.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/subnav.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<style>
	.btn{border-radius: 0px !important;}
	* { font-family: 'Noto Sans KR', sans-serif !important;}
	.content{
		border: 1px dotted gray;
	}
	
	.a1 {
	  text-decoration: none; /* 링크의 밑줄 제거 */
	  color: inherit; /* 링크의 색상 제거 */	  
	}
	
	.a2 a{
		text-decoration: none;
		color: #000;
		font-size : 17px
	}
	
	.a2 a:hover{
		text-decoration: underline;
	}
	
	.a2 a.active{
		color: gray;
		font-weight: bold;
		text-decoration: underline;
	}
	.a2 ul{
		text-align: center;

	}
	.a2 ul > li{
		display:inline-block;
		
	}
	.container > img {

	  width: 100%;
	  height: 200px;	  
	  }	
</style>
</head>
<body>
<jsp:include page="/include/nav.jsp"></jsp:include>
   <!-- sub nav바 -->
   <!-- 
      thisPage는 대메뉴를 구별하는데 사용
      subPage는 소메뉴를 구별하는데 사용
    -->
 <jsp:include page="/include/subnav.jsp">
 	<jsp:param value="support" name="thisPage"/>
    <jsp:param value="review" name="subPage"/>
 </jsp:include>
 <div class="container mb-5" style= "width:800px; border-top:1px solid #000;">
 
 </div>
<div class="container" style= "width:800px">
	<img src="${pageContext.request.contextPath}/images/laundry.jpg"  />
	<table class="table table-bordered table-striped-columns ">
		<tr>
			<th>글번호</th>
			<td>${dto.num }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${dto.writer }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${dto.title }</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${dto.viewCount }</td>
		</tr>
		<tr>
			<th>등록일</th>
			<td>${dto.regdate }</td>
		</tr>
		<tr>
			<th>평점</th>
			<td>
				<c:choose>
					<c:when test="${dto.star eq 1 }">
						★☆☆☆☆
					</c:when>
					<c:when test="${dto.star eq 2 }">
						★★☆☆☆
					</c:when>
					<c:when test="${dto.star eq 3 }">
						★★★☆☆
					</c:when>
					<c:when test="${dto.star eq 4 }">
						★★★★☆
					</c:when>
					<c:when test="${dto.star eq 5 }">
						★★★★★
					</c:when>																								
				</c:choose>				
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<div class="content">${dto.content }</div>
			</td>
		</tr>
	</table>
</div>		
	<div class="a2">
	<ul>
	<c:if test="${dto.prevNum ne 0 }">
			<li><a class="a1" href="detail.do?num=${dto.prevNum }&keyword=${encodedK }&condition=${condition }">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-double-left" viewBox="0 0 16 16">
					  <path fill-rule="evenodd" d="M8.354 1.646a.5.5 0 0 1 0 .708L2.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
					  <path fill-rule="evenodd" d="M12.354 1.646a.5.5 0 0 1 0 .708L6.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
					</svg>
				</a>
			</li>
		</c:if>
		<c:if test="${dto.nextNum ne 0 }">
			<li><a class="a1" href="detail.do?num=${dto.nextNum }&keyword=${encodedK }&condition=${condition }">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-double-right" viewBox="0 0 16 16">
	  					<path fill-rule="evenodd" d="M3.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L9.293 8 3.646 2.354a.5.5 0 0 1 0-.708z"/>
	  					<path fill-rule="evenodd" d="M7.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L13.293 8 7.646 2.354a.5.5 0 0 1 0-.708z"/>
					</svg>
				</a>
			</li>
	</c:if>
	</ul>
	</div>
	<div class="container" style= "width:800px ;margin-bottom:100px">
		<form action="${pageContext.request.contextPath}/review/list.do" >
		<button class="float-right btn btn-outline-secondary" style="float: right" type="submit">목록보기 </button>	
		</form>
		<c:if test="${dto.writer eq id }">
			<a class="a1" href="updateform.do?num=${dto.num }" "float: left" >수정</a>
			<a class="a1" href="delete.do?num=${dto.num }" "float: left" >삭제</a>
		</c:if>
	</div>		
<jsp:include page="/include/footer.jsp"></jsp:include>	
</body>
</html>