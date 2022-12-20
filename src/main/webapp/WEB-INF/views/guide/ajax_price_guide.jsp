<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<table class="table">
	<thead>
		<tr>
			<th style="width:20%;">NO</th>
			<th style="width:50%;">품목</th>
			<th style="width:30%;">가격</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="tmp" items="${list}" varStatus="status" >
		<c:if test="${ tmp.category eq param.category}">
			<tr>
				<td>${status.index+1}</td>
				<td>${tmp.item }</td>
				<td><f:formatNumber value="${tmp.price }" pattern="#,###" /></td>
			</tr>
		</c:if>
	</c:forEach>
	</tbody>
</table>