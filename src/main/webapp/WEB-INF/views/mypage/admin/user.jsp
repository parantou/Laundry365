<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객관리</title>
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
	#subMenuText{
		height: 80px;
		position:relative;
	}
	#user_wr{
		height:700px;
		display:flex;
		justify-content: center;
		font-size:16px;
	}
	#body_content{
		width: 1000px;
		display:flex;
		flex-direction: column;
		align-items: center;
	}
	#user_table{
		height:500px;
		text-align:center;
		margin-bottom:30px;
	}
	#user_table table{
		width: 1000px;
	}
	#body_content thead th{
		padding-bottom: 15px;
		border-bottom: 3px solid black;
	}
	#body_content tbody tr:hover{
		color : rgba(0, 0, 0, 0.6) !important;
	}
	footer{
		width:100%;
		bottom: 0px;
	}
	#condition{
		width:120px;
		display:inline-block;
	}
	#keyword{
		width:700px;
		display:inline-block;
	}
	#searchForm{
		display:inline-block
	}
	.btn{
		border-radius:0px;
	}
	/*page css*/
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
		text-decoration: underline;
	}
	.page-ui ul{
		list-style-type: none;
		padding: 0;
	}
	
	.page-ui ul > li{
		float: left;
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
		<jsp:param value="manager" name="thisPage"/>
		<jsp:param value="user" name="subPage"/>
	</jsp:include>
	<div id="user_wr" class="container">
		<div id="body_content">
			<div style="width:100%;" class="mb-3">
				<form action="user.do" method="get" id="searchForm"> 
					<select name="condition" id="condition" class="form-select form-select-lg">
						<option value="usdrId" ${condition eq 'usdrId' ? 'selected' : '' }>아이디</option>
						<option value="usdrName" ${condition eq 'usdrName' ? 'selected' : '' }>이름</option>
					</select>
					<input type="text" class="form-control form-control-lg" id="keyword" name="keyword" placeholder="검색어를 입력해주세요" value="${keyword }"/>
					<button type="submit" class="btn btn-dark btn-lg">검색</button>
				</form>
				<button id="deleteBtn" class="btn btn-dark btn-lg">삭제</button>
			</div>
			<div id="user_table">
				<form action="admin_user_delete.do" id="userForm" method="post">
				<table class="table">
					<thead>
						<tr>
							<th><input type="checkbox" id="allCheck" class="form-check-input"/></th>
							<th>아이디</th>
							<th>이름</th>
							<th>이메일</th>
							<th>전화번호</th>
							<th>가입일</th>
							<th>
								<select id="manager"  class="form-select " style="width: 100px;text-align:center;" >
									<option ${manager eq 'all' ? 'selected' : '' }>전체</option>
									<option ${manager eq 'N' ? 'selected' : '' } value="N">고객</option>
									<option ${manager eq 'Y' ? 'selected' : '' } value="Y">관리자</option>
								</select>
							</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="tmp" items="${userList }" varStatus="status">
						<tr class="selectRow">
							<td><input type="checkbox" name="users" value="${tmp.id }" class="form-check-input"/></td>
							<td>${tmp.id }</td>
							<td>${tmp.name }</td>
							<td>${tmp.email }</td>
							<td>${tmp.phone }</td>
							<td>${tmp.regdate }</td>
							<td>
								<c:choose>
									<c:when test="${tmp.manager eq 'Y'}">
										관리자
									</c:when>
									<c:otherwise>
										고객
									</c:otherwise>
								</c:choose>
							</td>
							<td><button type="button" class="btn btn-dark" onclick="javascript:updateManger('${tmp.id}','${tmp.manager}');">변경</button></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>		
				</form>	
			</div>
		</div>
	</div>
			<!-- 페이징처리 -->
			<div class="page-ui clearfix" style="display:flex; justify-content:center; margin-top :40px; margin-bottom:120px;">
				<ul class="pagination">
					<c:if test="${startPageNum ne 1 }">
					<li class="page-item">
						<a class="page-link" href="user.do?pageNum=${startPageNum-1 }&condition=${condition }&keyword=${encodedK }">Prev</a>
					</li>
					</c:if>
					<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
						<li class="page-item">
							<c:choose>
								<c:when test="${pageNum eq i }">
									<a  class="page-link" class="active" href="user.do?pageNum=${i }&condition=${condition }&keyword=${encodedK }">${i }</a>
								</c:when>
								<c:otherwise>
									<a class="page-link" href="user.do?pageNum=${i }&condition=${condition }&keyword=${encodedK }">${i }</a>
								</c:otherwise>
							</c:choose>
						</li>
					</c:forEach>
					<c:if test="${endPageNum lt totalPageCount }">
					<li class="page-item">
					  	<a class="page-link" href="user.do?pageNum=${endPageNum+1 }&condition=${condition }&keyword=${encodedK }">Next</a>
					</li>
					</c:if>
				</ul>
			</div>
			<div style="clear:both;"></div>
	<jsp:include page="/include/footer.jsp"></jsp:include>
	<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
	<script>
		/* document.querySelector("#check_${tmp.id }").addEventListener("change",function(evnet){
			alert('test');
		}) */
		
		//행 선택시 체크박스가 체크/해지되도록 설정
		let selectRows=document.querySelectorAll(".selectRow");
		let checks=document.querySelectorAll('.selectRow input[type=checkbox]');
		for(let i=0;i<selectRows.length;i++){
			selectRows[i].addEventListener("click", function(){
				if(checks[i].checked==false){
					checks[i].checked =true;	
				}else{
					checks[i].checked =false;
				}
				
			});
		}
		for(let i=0;i<checks.length;i++){
			checks[i].addEventListener("click", function(event){
				event.stopPropagation(); //부모객체에 전파되는걸 막는 함수
			});
		}
		
		document.querySelector("#allCheck").addEventListener("click",function(){
			for(let i=0;i<selectRows.length;i++){
				if(this.checked==true){
					checks[i].checked =true;	
				}else{
					checks[i].checked =false;
				}
			}
		});
		
		//삭제버튼을 누르면 체크된 행들의 id를 모아 삭제하기
		document.querySelector("#deleteBtn").addEventListener("click", function(){
			let deleteUsers=document.querySelectorAll('.selectRow input[type=checkbox]:checked');
			
			if(deleteUsers.length==0){
				alert("삭제할 회원을 선택해주세요.");
				return;
			}else{
			    if (!confirm("회원을 삭제하시겠습니까?")) {
			        return;
			    } else {
			    	let form=document.querySelector("#userForm");
					//form.setAttribute('action','admin_user_delete.do');
					ajaxFormPromise(form)
					.then(function(res){
						return res.json();
					})
					.then(function(data){
						if(data.isSuccess == true){
							alert(data.count+'명의 회원을 삭제했습니다');
							location.href="${pageContext.request.contextPath}/mypage/user.do";
						}else{
							alert('회원 삭제에 실패했습니다.');
						}
					});
			    }
			}
		}); 
		
		function updateManger(id,manager){
			let msg="";
			if(manager=='Y'){
				msg="고객으로 변경하겠습니까?";
			}else{
				msg="관리자로 변경하겠습니까?";
			}
			
			if (!confirm(msg)) {
		        return;
		    } else{
		    	ajaxPromise('admin_user_update.do', 'get', "id="+id+"&manager="+ manager)
				.then(function(res){
					return res.json();
				})
				.then(function(data){
					if(data.isSuccess == true){
						alert('수정을 완료했습니다');
						location.href="${pageContext.request.contextPath}/mypage/user.do";
					}else{
						alert('수정에 실패했습니다.');
					}
				});
		    }
		}
		
		document.querySelector("#manager").addEventListener("change",function(){
			let val=this.value;
			location.href="user.do?manager="+val+"&condition=${condition }&keyword=${encodedK }";
		});
	</script>
</body>
</html>