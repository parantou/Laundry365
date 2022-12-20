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
		width: 750px;
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
<div class="container mb-5" style= "width:800px; border-top:1px solid #000; ">
 
 	</div> 
	<div class="container mb-3" style= "width:800px ;">
	<img src="${pageContext.request.contextPath}/images/laundry3.PNG"  />
	<form action="insert.do" method="post" id="insertForm">
		<input type="hidden" name="code" value="${param.code}"/>
		<div class="mt-3 mb-3">
			<label class="form-label" for="title">제목</label>
			<input class="form-control" type="text" name="title" id="title"/>			
		</div>
		<div class="mb-3">
         <label for="code">주문번호</label>
         <input type="text" id="code" value="${param.code}" disabled />
      	</div>
		<div class="mb-3">
			<label class="form-label" for="star">평점</label>
			<select name="star" id="star">
    			<option value=1>★☆☆☆☆</option>
    			<option value=2>★★☆☆☆</option>
   				<option value=3 selected>★★★☆☆</option>
    			<option value=4>★★★★☆</option>
    			<option value=5>★★★★★</option>
			</select>
		</div>
		<div class="container" >
			<label class="form-label" for="content">내용</label>
			<textarea class="form-control"  name="content" id="content"></textarea>
		</div>
		<button style="margin-bottom:100px;" class="btn btn-outline-secondary mt-3" type="submit" >저장</button>
	</form>
</div>
<%--
	[ SmartEditor 를 사용하기 위한 설정 ]
	
	1. Webapp 에 SmartEditor  폴더를 복사해서 붙여 넣기
	2. Webapp 에 upload 폴더 만들어 두기
	3. pom.xml 에 commons io 와 commons fileupload의 dependency 가 있어야 한다. 
	   commons-io.jar 파일과 commons-fileupload.jar 파일 붙여 넣기
	4. <textarea id="content" name="content"> 
	   content 가 아래의 javascript 에서 사용 되기때문에 다른 이름으로 바꾸고 
	      싶으면 javascript 에서  content 를 찾아서 모두 다른 이름으로 바꿔주면 된다. 
	5. textarea 의 크기가 SmartEditor  의 크기가 된다.
 --%>
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

	
	function setDefaultFont() {
		var sDefaultFont = '궁서';
		var nFontSize = 24;
		oEditors.getById["content"].setDefaultFont(sDefaultFont, nFontSize);
	}
	
	//폼에 submit 이벤트가 일어났을때 실행할 함수 등록
	document.querySelector("#insertForm")
		.addEventListener("submit", function(e){
			//에디터에 입력한 내용이 textarea 의 value 값이 될수 있도록 변환한다. 
			oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
			//textarea 이외에 입력한 내용을 여기서 검증하고 
			const title=document.querySelector("#title").value;
			
			//만일 폼 제출을 막고 싶으면  
			//e.preventDefault();
			//을 수행하게 해서 폼 제출을 막아준다.
			if(title.length < 2){
				alert("제목을 2글자 이상 입력하세요!");
				e.preventDefault();
			}
			
		});
</script>
<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>



