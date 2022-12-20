<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기게시판</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nav.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/subFooter.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/subnav.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<script src="http://code.jquery.com/jquery-2.1.3.min.js"></script>
<style>
	.btn{border-radius: 0px !important;}
	* { font-family: 'Noto Sans KR', sans-serif !important;}
	/* hover 수정 세진*/
	a:hover{color : rgba(0, 0, 0, 0.6) !important;}
	.tr_hover:hover{color : rgba(0, 0, 0, 0.6) !important;}
	* { font-family: 'Noto Sans KR', sans-serif !important;}
	.page-ui a{
		text-decoration: none;
		color: #000;
	}
	
	.page-ui a:hover{
		text-decoration: underline;
	}
	
	.page-ui a.active{
		color: black;
		font-weight: bold;
		text-decoration: underline;
	}
	.page-ui ul{
		text-align: center;

	}
	.page-ui ul > li{
		display:inline-block;
		
	}
	.container > img {
	  margin-top: 40px;
	  width: 100%;
	  height: 300px;	  
	  }
	  

	table > th {
		color:000000;
		font-size:17px;
		font-weight:400;
	}
	table > td {
		color:999999;
		font-size:17px;
	}
	
	td > a {
  text-align: center;
  text-decoration: none; /* 링크의 밑줄 제거 */
  color: inherit; /* 링크의 색상 제거 */
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

<div class="container" style= "width:1320px; margin-bottom:150px">

	<table class="table" >
		<colgroup>
			<col style="width:70px">
			<col style="width:30px">
			<col style="width:150px">
			<col style="width:70px">
			<col style="width:50px">
			<col style="width:20px">
		</colgroup>
		<thead>
			<tr>
				<th>글번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>조회수</th>
				<th>등록일</th>
				<th>평점</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="tmp" items="${list }">
			<tr onclick="location.href='detail.do?num=${tmp.num }&keyword=${encodedK }&condition=${condition}'" style="cursor:pointer;" class="tr_hover">
				<td>${tmp.num }</td>
				<td>${tmp.writer }</td>
				<td>${tmp.title }</td>
				<td>${tmp.viewCount }</td>
				<td>${tmp.regdate }</td>
				<td>
					<c:choose>
						<c:when test="${tmp.star eq 1 }">
							★☆☆☆☆
						</c:when>
						<c:when test="${tmp.star eq 2 }">
							★★☆☆☆
						</c:when>
						<c:when test="${tmp.star eq 3 }">
							★★★☆☆
						</c:when>
						<c:when test="${tmp.star eq 4 }">
							★★★★☆
						</c:when>
						<c:when test="${tmp.star eq 5 }">
							★★★★★
						</c:when>																								
					</c:choose>	
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="page-ui clearfix" style="display:flex; justify-content:center; margin: 30px auto;">	
		<ul class="pagination">
			<c:if test="${startPageNum ne 1 }">
				<li class="page-item">
					<a class="page-link" href="list.do?pageNum=${startPageNum-1 }&condition=${condition }&keyword=${encodedK }">&lt;</a>
				</li>
			</c:if>
			<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
				<li class="page-item">
					<c:choose>
						<c:when test="${pageNum eq i }">
							<a class="page-link"  class="active" href="list.do?pageNum=${i }&condition=${condition }&keyword=${encodedK }">${i }</a>
						</c:when>
						<c:otherwise>
							<a class="page-link" href="list.do?pageNum=${i }&condition=${condition }&keyword=${encodedK }">${i }</a>
						</c:otherwise>
					</c:choose>
				</li>
			</c:forEach>
			<c:if test="${endPageNum lt totalPageCount }">
				<li class="page-item">
					<a class="page-link" href="list.do?pageNum=${endPageNum+1 }&condition=${condition }&keyword=${encodedK }">&gt;</a>
				</li>
			</c:if>
		</ul>
	</div>
	
	<div style="clear:both;"></div>
	
	<div class="notice_btn mr-2" style="display:flex; justify-content:center;">
		<form action="list.do" method="get" style="height:33px;"> 
			<label for="condition"></label>
				<select name="condition" id="condition" style="height:100%;">
					<option value="title_content" ${condition eq 'title_content' ? 'selected' : '' }>제목+내용</option>
					<option value="title" ${condition eq 'title' ? 'selected' : '' }>제목</option>
					<option value="writer" ${condition eq 'writer' ? 'selected' : '' }>작성자</option>
				</select>
				<input style="height:100%;" type="text" id="keyword" name="keyword" placeholder="검색어..." value="${keyword }"/>
				<button style="height:100%; margin-top:-5px;" class="btn btn-outline-dark btn-sm"  type="submit">검색</button>
			</form>	
	</div>
	
	<!--  
	<c:if test="${ not empty condition }">
		<p>
			<strong>${totalRow }</strong> 개의 글이 검색 되었습니다.
		</p>
	</c:if>
	-->
</div>
<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>
