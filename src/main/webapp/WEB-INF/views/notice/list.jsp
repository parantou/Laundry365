<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/notice/list.jsp</title>
<style>
	.btn{border-radius: 0px !important;}
	* { font-family: 'Noto Sans KR', sans-serif !important;}
	th, td{text-align:center !important;}
	table a{text-decoration:none !important; color :black !important;}
	a:hover{color : rgba(0, 0, 0, 0.6) !important;}
	.tr_hover:hover{color : rgba(0, 0, 0, 0.6) !important;}
	tr{border-bottom:1px solid #ebebeb !important;}
	
	.margin_auto{margin:0 auto;}
	
	.page-ui{margin: 30px auto;}
	.page-ui a{
		text-decoration: none;
		color :black;
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
		list-style-type: none;
		padding: 0;
	}
	
	.page-ui ul > li{
		float: left;
	}
	.container{display:flex; justify-content:center;}
	.notice_btn{display:flex; margin-bottom:100px;}
	.write_btn{height:33px; text-align:center !important;  line-height:23px !important; margin-left:5px;}
</style>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nav.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/subFooter.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/subnav.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</head>
<body>
<jsp:include page="/include/nav.jsp"></jsp:include>
   <jsp:include page="/include/subnav.jsp">
      <jsp:param value="support" name="thisPage"/>
      <jsp:param value="notice" name="subPage"/>
   </jsp:include>

<div class="container">
	<div class="notice_inner" style="width:100%;">
		<table class="margin_auto table" style="width:100%;">
			<thead>
				<tr>
					<th style="width:20%;">글번호</th>
					<th style="width:60%;">제목</th>
					<th style="width:20%;">등록일</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="tmp" items="${list }">
				<tr onclick="location.href='detail.do?num=${tmp.num }&keyword=${encodedK }&condition=${condition}'" style="cursor:pointer;" class="tr_hover">
					<td>${tmp.num }</td>
					<td>${tmp.title }</td>
					<td>${tmp.regdate }</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
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
								<a class="page-link" class="active" href="list.do?pageNum=${i }&condition=${condition }&keyword=${encodedK }">${i }</a>
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
		
		<div style="clear:both;"></div>
		
		<div class="notice_btn" style="display:flex; justify-content:center;">
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
			<c:if test="${ not empty manager and manager == 'Y'}">
				<a class="btn btn-outline-dark btn-sm write_btn write_btn"  href="insertform.do">작성</a>
			</c:if>
		</div>
		<!-- 
		<c:if test="${ not empty condition }">
			<p>
				<strong>${totalRow }</strong> 개의 글이 검색 되었습니다.
			</p>
		</c:if>
		 -->
	</div>
</div>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>












