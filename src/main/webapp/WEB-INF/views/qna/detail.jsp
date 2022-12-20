<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<script async src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nav.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/subFooter.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/subnav.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<style>
	.btn{border-radius: 0px !important;}
	* { font-family: 'Noto Sans KR', sans-serif !important;}
	.container{
		margin-bottom: 200px;
	}
	.container2{
		margin-bottom: 10px;
	}
   .content{
      border: 1px dotted gray;
      height: 300px;
   }
      .rcontent{
      border: 1px solid;
      
   }
   	.reply dt{
		margin-top: 5px;
	}
	.reply dd{
		margin-left: 50px;
	}
	.reply-form textarea, .reply-form button{
		float: left;
	}
	.reply-form textarea{
		width: 84%;
		height: 100px;
	}
	.reply-form button{
		width: 14%;
		height: 100px;
	}
	.blind{
	  position: absolute;
	  width: 1px;
	  height: 1px;
	  clip: rect(0 0 0 0);
	  overflow: hidden;
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
	<div class="container" style= "width:800px">
	<h1 style="font-size:20px">1:1문의</h1>
		<div>
			<table class="table table-bordered table-striped-columns">
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
					<th>등록일</th>
					<td>${dto.regdate }</td>
				</tr>
				<tr>
					<td colspan="2">
						<div class="content">${dto.content }</div>
					</td>
				</tr>
			</table>		
			<div class="reply" >
				<c:if test="${not empty dtoReply.content }">
					<div class="rcontent">
						<c:if test="${manager eq 'Y' and dtoReply.writer eq sessionScope.id}">
						<div id="btnGroup">
							<a id="deleteBtn" class="btn btn-outline-white" style="float:right;" href="javascript:"><i class="bi bi-x-circle-fill"></i><span class="blind">삭제</span></a>
							<a id="updateBtn" class="btn btn-outline-white" style="float:right;" href="javascript:"><i class="bi bi-pencil-fill"></i><span class="blind">수정</span></a>
						</div>
						</c:if>
						<dl>
							<dt>&nbsp;<i class="bi bi-chat-square-quote"></i> 답변 드립니다.</dt>
							<dd><pre>${dtoReply.content }</pre></dd>
						</dl>
					</div>
				</c:if>
	
				<c:if test="${manager eq 'Y' and empty dtoReply.content }">
					<!-- 답글 작성하는 폼 -->
					<form class="reply-form insert-form mt-3" action="reply_insert.do" method="post" id="insertForm" style="display:block">
						<!-- 원글의 글번호가 답글의 ref_num 번호가 된다. -->
						<input type="hidden" name="ref_num" value="${dto.num }"/>
						<textarea name="content"></textarea>
						<button class="btn btn-dark" type="submit">답변 등록</button>
					</form>
				</c:if>
				
				<!-- 답글 수정하는 폼 -->
				<c:if test="${manager eq 'Y' and dtoReply.writer eq sessionScope.id}">
					<!-- 원글의 답글 작성 폼 -->
					<form class="reply-form insert-form mt-3" action="reply_update.do" method="post" id="updateForm" style="display:none">
						<input type="hidden" name="ref_num" value="${dto.num }"/>
						<input type="hidden" name="writer" value="${sessionScope.id }"/>
						<textarea name="content">${dtoReply.content }</textarea>
						<button class="btn btn-dark" type="submit">수정</button>
					</form>
				</c:if>	
			</div>
		</div>
		<div class="btnContainer mt-4">
			<button class="btn btn-outline-dark mt-3" style="float:right" onclick="location.href='delete.do?num=${dto.num }' ">삭제</button>
			<button class="btn btn-outline-dark mt-3" style="float:left" onclick="location.href='${pageContext.request.contextPath}/qna/list.do' ">목록보기</button>
		</div>
	</div>
<script defer src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
<script>
window.onload= function(){
	document.querySelector("#updateForm").addEventListener("submit",function(event){
		let form=document.querySelector('#updateForm');
		let content=document.querySelector('#updateForm textarea').value;
		ajaxFormPromise(form)
		.then(function(res){
			return res.json();
		})
		.then(function(data){
			console.log(data);
			if(data){
				alert('수정되었습니다.');
	   			form.style.display="none";
			}else{
				alert('수정이 실패했습니다');
			}
	location.href="detail.do?num=${dto.num }"
			});
		});
	document.querySelector('#updateBtn').addEventListener("click",function(){
		let form=document.querySelector("#updateForm");
		form.style.display="block";
	});
	 		
	document.querySelector('#deleteBtn').addEventListener("click",function(){
		let form=document.querySelector("#insertForm");
		let rdiv=document.querySelector(".rcontent");
		const isDelete=confirm("답글을 삭제 하시겠습니까?");
		if(isDelete){
			ajaxPromise("reply_delete.do", "get", "num=${dtoReply.rnum}")
			.then(function(res){
				return res.json();
			})
			.then(function(data){
				console.log(data);
				if(data){
					rdiv.style.display="none";
					}
				location.href="detail.do?num=${dto.num }"
			});
		}
	});
}	
</script>
<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>