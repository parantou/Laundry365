<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주묻는질문</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
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
	#content{
		height: 400px;
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
	<div class="container">
		<h5>자주 묻는 질문 수정</h5>
		<form action="update.do" method="post">
			<input type="hidden" name="num" value="${dto.num }" />
			<input type="hidden" name="writer" value="${dto.writer }" />
			<div>
				<label class="form-label" for="category">카테고리</label>
				<select class="form-select" name="category" id="category">
					<option value="">카테고리 선택</option>
					<option value="service" ${dto.category eq 'service' ? 'selected' : '' }>서비스이용</option>
					<option value="order" ${dto.category eq 'order' ? 'selected' : '' }>주문·결제·배송</option>
					<option value="member" ${dto.category eq 'member' ? 'selected' : '' }>회원정보</option>
					<option value="etc" ${dto.category eq 'etc' ? 'selected' : '' }>기타</option>
				</select>
			</div>
			<div>
				<label class="form-label" for="title">질문</label>
				<input class="form-control" type="text" name="title" id="title" value="${dto.title }"/>
			</div>
			<div>
				<label class="form-label" for="content">답변 내용</label>
				<textarea class="form-control" name="content" id="content">${dto.content }</textarea>
			</div>
			<button class="btn btn-dark" type="submit" onclick="submitContents(this);" >수정 확인</button>
			<button class="btn btn-dark" type="reset" onclick="goBack()" style="float:right">취소</button>
		</form>
	</div>
	<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath }/SmartEditor/js/HuskyEZCreator.js"></script>
	<script>
	var oEditors = [];
	
	//추가 글꼴 목록
	//var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];
	
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "content",
		sSkinURI: "${pageContext.request.contextPath}/SmartEditor/SmartEditor2Skin.html",	
		htParams : {
			bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
			//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
			fOnBeforeUnload : function(){
				//alert("완료!");
			}
		}, //boolean
		fOnAppLoad : function(){
			//예제 코드
			//oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
		},
		fCreator: "createSEditor2"
	});
	
	function pasteHTML() {
		var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
		oEditors.getById["content"].exec("PASTE_HTML", [sHTML]);
	}
	
	function showHTML() {
		var sHTML = oEditors.getById["content"].getIR();
		alert(sHTML);
	}
		
	function submitContents(elClickedObj) {
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
		
		// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("content").value를 이용해서 처리하면 됩니다.
		
		try {
			elClickedObj.form.submit();
		} catch(e) {}
	}
	
	function setDefaultFont() {
		var sDefaultFont = '궁서';
		var nFontSize = 24;
		oEditors.getById["content"].setDefaultFont(sDefaultFont, nFontSize);
	}
	
	//취소 누르면 뒤로가기
	function goBack(){
		window.history.back();
	}
	</script>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>