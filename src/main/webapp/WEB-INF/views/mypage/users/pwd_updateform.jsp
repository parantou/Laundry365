<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/mypage/pwd_updateform.jsp</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/lsh.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nav.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/subFooter.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/subnav.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<style>
.container{width:40% !important;}
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
      <jsp:param value="mypage" name="thisPage"/>
      <jsp:param value="info" name="subPage"/>
   </jsp:include>
   <div class="container mb_250">
   <!-- <h1 style="font-size:30px !important; text-align:center; margin-top:120px !important;">비밀 번호 수정</h1> -->
   <form action="${pageContext.request.contextPath}/mypage/users/pwd_update.do" method="post" id="myForm">
      <div>
         <label class="form-label" for="pwd">기존 비밀 번호</label>
         <input class="form-control" type="password" name="pwd" id="pwd"/>
      </div>
      <div style="margin:20px 0!important;">
         <label class="form-label" for="newPwd">새 비밀번호</label>
         <input class="form-control" type="password" name="newPwd" id="newPwd"/>
      </div>
      <div>
         <label class="form-label" for="newPwd2">새 비밀번호 확인</label>
         <input class="form-control" type="password" id="newPwd2"/>
      </div>
      <div class="pwdbtnbox" style="text-align:center !important;">
         <button class="pwdlshbtn" type="submit">저장</button>
         <button class="pwdlshbtn" type="reset">초기화</button>
      </div>
   </form>
</div>
<jsp:include page="/include/footer.jsp"></jsp:include>
<script>
   //폼에 submit 이벤트가 일어났을때 실행할 함수를 등록하고 
   //document.querySelector("#myForm").addEventListener("submit", function(e){
   //   let pwd1=document.querySelector("#newPwd").value;
   //   let pwd2=document.querySelector("#newPwd2").value;
   //   //새 비밀번호와 비밀번호 확인이 일치하지 않으면 폼 전송을 막는다.
   //   if(pwd1 != pwd2){
   //      alert("비밀번호를 확인 하세요!");
   //      e.preventDefault();//폼 전송 막기 
   //   }
   //});
   
   const updateForm=document.querySelector("#myForm"); //폼의 참조값
   let isPwdValid=false;
   
   //비밀번호를 확인 하는 함수 
   function checkPwd(){
      document.querySelector("#newPwd").classList.remove("is-valid");
      document.querySelector("#newPwd").classList.remove("is-invalid");
      document.querySelector("#newPwd2").classList.remove("is-valid");
      document.querySelector("#newPwd2").classList.remove("is-invalid");
      
      const pwd=document.querySelector("#newPwd").value;
      const pwd2=document.querySelector("#newPwd2").value;
      //비밀번호를 검증할 정규 표현식
      //let reg=/[\W]/; 특수문자 하나는 꼭 들어가야 한다
      //최소 하나의 문자,숫자,특수문자가 들어가고 8글자~13글자 이내로 입력
      const reg=/^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&^])[A-Za-z\d@$!%*#?&^]{8,13}$/;
      //만일 비밀번호가 정규 표현식을 통과 하지 못한다면 
      if(!reg.test(pwd)){      
    	  document.querySelector("#newPwd").classList.add("is-invalid");
         isPwdValid=false;
         return; //함수를 여기서 끝내라 
      }else{
    	  document.querySelector("#newPwd").classList.add("is-valid");
      }
      
      if(pwd != pwd2){//만일 비밀번호 입력란과 확인란이 다르다면
    	  document.querySelector("#newPwd2").classList.add("is-invalid");
         isPwdValid=false;
      }else{
    	  document.querySelector("#newPwd2").classList.add("is-valid");
         isPwdValid=true;
      }
   }
      
   document.querySelector("#newPwd").addEventListener("input", function(){
      //비밀번호를 검증하는 함수 호출
      checkPwd();
   });
   document.querySelector("#newPwd2").addEventListener("input", function(){
      checkPwd();
   });
   
   updateForm.addEventListener("submit", function(event){
      if(!isPwdValid){
         alert("비밀번호를 확인 하세요!");
         event.preventDefault();//폼 전송 막기
      }
   });
</script>
</body>
</html>