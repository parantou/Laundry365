<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	#content{
		height: 200px;
		width: 765px;
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
<div class="container mb-3" style= "width:800px;">
	<img src="${pageContext.request.contextPath}/images/laundry3.PNG"  />
	<form action="update.do" method="post" style="margin-bottom:100px">
		<input type="hidden" name="num" value="${dto.num }" />
		<div class="mt-3 mb-3">
			<label for="writer">작성자</label>
			<input type="text" id="writer" value="${dto.writer }" disabled/>
		</div>
		<div class="mb-3">
			<label class="form-label" for="star">평점</label>
			<select name="star" id="star" value="${dto.star }" >
    			<option value=1>★☆☆☆☆</option>
    			<option value=2>★★☆☆☆</option>
   				<option value=3 >★★★☆☆</option>
    			<option value=4>★★★★☆</option>
    			<option value=5 selected >★★★★★</option>
			</select>
		</div>		
		<div class="mb-3">
			<label for="title">제목</label>
			<input type="text" name="title" id="title" value="${dto.title }"/>
		</div>
		<div class="mb-5">
			<label for="content">내용</label>
			<textarea name="content" id="content">${dto.content }</textarea>
		</div>
		<button class="btn btn-outline-secondary" type="submit" onclick="submitContents(this);">수정</button>
		<button class="btn btn-outline-secondary" type="button" onclick="goBack()">취소</button>
	</form>
</div>
<!-- SmartEditor 에서 필요한 javascript 로딩  -->
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