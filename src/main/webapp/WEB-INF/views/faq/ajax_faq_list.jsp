<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<table class="table table-hover" id="table">
	<thead>
		<tr>
			<th scope="col" style="width:20%;">NO</th>
			<th scope="col" style="width:15%;">카테고리</th>
			<th scope="col" style="width:65%;">제목</th>
			<c:if test="${not empty id and manager == 'Y'}">
			<th scope="col">수정</th>
			<th scope="col">삭제</th>
			</c:if>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="tmp" items="${list }">
		<c:set var="i" value="${i+1 }"/>
		<c:if test="${tmp.category eq param.category }">
			<tr class="question" data-num="${tmp.num }">
				<td scope="row">${i }</td>
				<c:choose>
					<c:when test="${tmp.category eq 'service' }">
					<th scope="row">[서비스 이용]</th>
					</c:when>
					<c:when test="${tmp.category eq 'order' }">
					<th scope="row">[주문·결제·배송]</th>
					</c:when>
					<c:when test="${tmp.category eq 'member' }">
					<th scope="row">[회원정보]</th>
					</c:when>
					<c:when test="${tmp.category eq 'etc' }">
					<th scope="row">[기타]</th>
					</c:when>
				</c:choose>
				<td scope="row">
				
					${tmp.title }<i class="bi bi-chevron-down" style="float:right"></i>
		
				</td>
				<c:if test="${ not empty id and manager == 'Y'}">
					<td><a class="btn btn-outline-white" href="updateform.do?num=${tmp.num }"><i class="bi bi-pencil-fill"></i><span class="blind">수정</span></a></td>
					<td><a class="btn btn-outline-white" href="delete.do?num=${tmp.num }"><i class="bi bi-x-circle-fill"></i><span class="blind">삭제</span></a></td>
				</c:if>
			</tr>
			<tr class="answer" id="answer${tmp.num }">
				<td colspan="100%">
				<div style="text-align: left;  margin-left: 10%; ">
					<p>${tmp.content}</p>
				</div>
				</td> 
			</tr>
		</c:if>
		
	</c:forEach>
	</tbody>
</table>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(".question").click(function(){
		//data-num 속성으로 저장된 번호를 읽어와서 
		let num=$(this).attr("data-num");
		//선택자로 활용한다.
		$("#answer"+num).fadeToggle(400);
	});
</script>	
