<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/mypage/updateform.jsp</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/lsh.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nav.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/subFooter.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/subnav.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<style>
/* 프로필 이미지를 작은 원형으로 만든다 */
img {
   width: 100px;
   height: 100px;
}
#profileImage {
   width: 100px;
   height: 100px;
   border-radius: 50%;
   margin:0 auto;
   text-align:center;
   display:block;
   
}
.container{width:40% !important;}
.subMenuText{display:none !important;}
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
	<!-- 
		<h1  style="font-size:30px !important; text-align:center; margin-top:30px !important;">가입 정보 수정</h1>
	 -->
	
	<a id="profileLink" href="javascript:">
		<c:choose>
			<c:when test="${empty dto.profile }">
				<svg id="profileImage" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#ddd" class="bi bi-person-circle" viewBox="0 0 16 16">
					  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
					  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
				<a class="lshimgbtn" style="margin:0 auto !important; text-align:center !important; text-decoration:none !important; margin-top:10px !important;">사진변경</a>
				</svg>
			</c:when>
			<c:otherwise>
				<img id="profileImage" 
					src="${pageContext.request.contextPath}${dto.profile}" />
			</c:otherwise>
		</c:choose>
	</a>
	<p class="upimgtxt">회원님을 알릴 수 있는 사진을 등록해 주세요.<br>등록된 사진은 회원님의 게시물이나 댓글들에 사용됩니다.</p>
	<form action="${pageContext.request.contextPath}/mypage/users/update.do" method="post" id="updateForm">
		<input type="hidden" name="profile" 
			value="${ empty dto.profile ? '' : dto.profile}"/>
		<div class="mb_15 mt_15">
			<label class="form-label" for="id">아이디</label>
			<input class="form-control" type="text" id="id" value="${id }" disabled/>
		</div>
		<div class="mb_15">
			<label class="form-label" for="email">이메일</label>
			<input class="form-control" type="text" name="email" id="email" value="${dto.email }"/>
			<div class="invalid-feedback">이메일 형식에 맞게 입력하세요.</div>
		</div>
		<div class="mb-3">
			<select class="form-select form-select-sm" name="countryCode">
				<option data-countryCode="DZ" value="213">Algeria (+213)</option>
				<option data-countryCode="AD" value="376">Andorra (+376)</option>
				<option data-countryCode="AO" value="244">Angola (+244)</option>
				<option data-countryCode="AI" value="1264">Anguilla (+1264)</option>
				<option data-countryCode="AG" value="1268">Antigua &amp; Barbuda (+1268)</option>
				<option data-countryCode="AR" value="54">Argentina (+54)</option>
				<option data-countryCode="AM" value="374">Armenia (+374)</option>
				<option data-countryCode="AW" value="297">Aruba (+297)</option>
				<option data-countryCode="AU" value="61">Australia (+61)</option>
				<option data-countryCode="AT" value="43">Austria (+43)</option>
				<option data-countryCode="AZ" value="994">Azerbaijan (+994)</option>
				<option data-countryCode="BS" value="1242">Bahamas (+1242)</option>
				<option data-countryCode="BH" value="973">Bahrain (+973)</option>
				<option data-countryCode="BD" value="880">Bangladesh (+880)</option>
				<option data-countryCode="BB" value="1246">Barbados (+1246)</option>
				<option data-countryCode="BY" value="375">Belarus (+375)</option>
				<option data-countryCode="BE" value="32">Belgium (+32)</option>
				<option data-countryCode="BZ" value="501">Belize (+501)</option>
				<option data-countryCode="BJ" value="229">Benin (+229)</option>
				<option data-countryCode="BM" value="1441">Bermuda (+1441)</option>
				<option data-countryCode="BT" value="975">Bhutan (+975)</option>
				<option data-countryCode="BO" value="591">Bolivia (+591)</option>
				<option data-countryCode="BA" value="387">Bosnia Herzegovina (+387)</option>
				<option data-countryCode="BW" value="267">Botswana (+267)</option>
				<option data-countryCode="BR" value="55">Brazil (+55)</option>
				<option data-countryCode="BN" value="673">Brunei (+673)</option>
				<option data-countryCode="BG" value="359">Bulgaria (+359)</option>
				<option data-countryCode="BF" value="226">Burkina Faso (+226)</option>
				<option data-countryCode="BI" value="257">Burundi (+257)</option>
				<option data-countryCode="KH" value="855">Cambodia (+855)</option>
				<option data-countryCode="CM" value="237">Cameroon (+237)</option>
				<option data-countryCode="CA" value="1">Canada (+1)</option>
				<option data-countryCode="CV" value="238">Cape Verde Islands (+238)</option>
				<option data-countryCode="KY" value="1345">Cayman Islands (+1345)</option>
				<option data-countryCode="CF" value="236">Central African Republic (+236)</option>
				<option data-countryCode="CL" value="56">Chile (+56)</option>
				<option data-countryCode="CN" value="86">China (+86)</option>
				<option data-countryCode="CO" value="57">Colombia (+57)</option>
				<option data-countryCode="KM" value="269">Comoros (+269)</option>
				<option data-countryCode="CG" value="242">Congo (+242)</option>
				<option data-countryCode="CK" value="682">Cook Islands (+682)</option>
				<option data-countryCode="CR" value="506">Costa Rica (+506)</option>
				<option data-countryCode="HR" value="385">Croatia (+385)</option>
				<option data-countryCode="CU" value="53">Cuba (+53)</option>
				<option data-countryCode="CY" value="90392">Cyprus North (+90392)</option>
				<option data-countryCode="CY" value="357">Cyprus South (+357)</option>
				<option data-countryCode="CZ" value="42">Czech Republic (+42)</option>
				<option data-countryCode="DK" value="45">Denmark (+45)</option>
				<option data-countryCode="DJ" value="253">Djibouti (+253)</option>
				<option data-countryCode="DM" value="1809">Dominica (+1809)</option>
				<option data-countryCode="DO" value="1809">Dominican Republic (+1809)</option>
				<option data-countryCode="EC" value="593">Ecuador (+593)</option>
				<option data-countryCode="EG" value="20">Egypt (+20)</option>
				<option data-countryCode="SV" value="503">El Salvador (+503)</option>
				<option data-countryCode="GQ" value="240">Equatorial Guinea (+240)</option>
				<option data-countryCode="ER" value="291">Eritrea (+291)</option>
				<option data-countryCode="EE" value="372">Estonia (+372)</option>
				<option data-countryCode="ET" value="251">Ethiopia (+251)</option>
				<option data-countryCode="FK" value="500">Falkland Islands (+500)</option>
				<option data-countryCode="FO" value="298">Faroe Islands (+298)</option>
				<option data-countryCode="FJ" value="679">Fiji (+679)</option>
				<option data-countryCode="FI" value="358">Finland (+358)</option>
				<option data-countryCode="FR" value="33">France (+33)</option>
				<option data-countryCode="GF" value="594">French Guiana (+594)</option>
				<option data-countryCode="PF" value="689">French Polynesia (+689)</option>
				<option data-countryCode="GA" value="241">Gabon (+241)</option>
				<option data-countryCode="GM" value="220">Gambia (+220)</option>
				<option data-countryCode="GE" value="7880">Georgia (+7880)</option>
				<option data-countryCode="DE" value="49">Germany (+49)</option>
				<option data-countryCode="GH" value="233">Ghana (+233)</option>
				<option data-countryCode="GI" value="350">Gibraltar (+350)</option>
				<option data-countryCode="GR" value="30">Greece (+30)</option>
				<option data-countryCode="GL" value="299">Greenland (+299)</option>
				<option data-countryCode="GD" value="1473">Grenada (+1473)</option>
				<option data-countryCode="GP" value="590">Guadeloupe (+590)</option>
				<option data-countryCode="GU" value="671">Guam (+671)</option>
				<option data-countryCode="GT" value="502">Guatemala (+502)</option>
				<option data-countryCode="GN" value="224">Guinea (+224)</option>
				<option data-countryCode="GW" value="245">Guinea - Bissau (+245)</option>
				<option data-countryCode="GY" value="592">Guyana (+592)</option>
				<option data-countryCode="HT" value="509">Haiti (+509)</option>
				<option data-countryCode="HN" value="504">Honduras (+504)</option>
				<option data-countryCode="HK" value="852">Hong Kong (+852)</option>
				<option data-countryCode="HU" value="36">Hungary (+36)</option>
				<option data-countryCode="IS" value="354">Iceland (+354)</option>
				<option data-countryCode="IN" value="91">India (+91)</option>
				<option data-countryCode="ID" value="62">Indonesia (+62)</option>
				<option data-countryCode="IR" value="98">Iran (+98)</option>
				<option data-countryCode="IQ" value="964">Iraq (+964)</option>
				<option data-countryCode="IE" value="353">Ireland (+353)</option>
				<option data-countryCode="IL" value="972">Israel (+972)</option>
				<option data-countryCode="IT" value="39">Italy (+39)</option>
				<option data-countryCode="JM" value="1876">Jamaica (+1876)</option>
				<option data-countryCode="JP" value="81">Japan (+81)</option>
				<option data-countryCode="JO" value="962">Jordan (+962)</option>
				<option data-countryCode="KZ" value="7">Kazakhstan (+7)</option>
				<option data-countryCode="KE" value="254">Kenya (+254)</option>
				<option data-countryCode="KI" value="686">Kiribati (+686)</option>
				<option data-countryCode="KP" value="850">Korea North (+850)</option>
				<option data-countryCode="KR" value="82" Selected>Korea South (+82)</option>
				<option data-countryCode="KW" value="965">Kuwait (+965)</option>
				<option data-countryCode="KG" value="996">Kyrgyzstan (+996)</option>
				<option data-countryCode="LA" value="856">Laos (+856)</option>
				<option data-countryCode="LV" value="371">Latvia (+371)</option>
				<option data-countryCode="LB" value="961">Lebanon (+961)</option>
				<option data-countryCode="LS" value="266">Lesotho (+266)</option>
				<option data-countryCode="LR" value="231">Liberia (+231)</option>
				<option data-countryCode="LY" value="218">Libya (+218)</option>
				<option data-countryCode="LI" value="417">Liechtenstein (+417)</option>
				<option data-countryCode="LT" value="370">Lithuania (+370)</option>
				<option data-countryCode="LU" value="352">Luxembourg (+352)</option>
				<option data-countryCode="MO" value="853">Macao (+853)</option>
				<option data-countryCode="MK" value="389">Macedonia (+389)</option>
				<option data-countryCode="MG" value="261">Madagascar (+261)</option>
				<option data-countryCode="MW" value="265">Malawi (+265)</option>
				<option data-countryCode="MY" value="60">Malaysia (+60)</option>
				<option data-countryCode="MV" value="960">Maldives (+960)</option>
				<option data-countryCode="ML" value="223">Mali (+223)</option>
				<option data-countryCode="MT" value="356">Malta (+356)</option>
				<option data-countryCode="MH" value="692">Marshall Islands (+692)</option>
				<option data-countryCode="MQ" value="596">Martinique (+596)</option>
				<option data-countryCode="MR" value="222">Mauritania (+222)</option>
				<option data-countryCode="YT" value="269">Mayotte (+269)</option>
				<option data-countryCode="MX" value="52">Mexico (+52)</option>
				<option data-countryCode="FM" value="691">Micronesia (+691)</option>
				<option data-countryCode="MD" value="373">Moldova (+373)</option>
				<option data-countryCode="MC" value="377">Monaco (+377)</option>
				<option data-countryCode="MN" value="976">Mongolia (+976)</option>
				<option data-countryCode="MS" value="1664">Montserrat (+1664)</option>
				<option data-countryCode="MA" value="212">Morocco (+212)</option>
				<option data-countryCode="MZ" value="258">Mozambique (+258)</option>
				<option data-countryCode="MN" value="95">Myanmar (+95)</option>
				<option data-countryCode="NA" value="264">Namibia (+264)</option>
				<option data-countryCode="NR" value="674">Nauru (+674)</option>
				<option data-countryCode="NP" value="977">Nepal (+977)</option>
				<option data-countryCode="NL" value="31">Netherlands (+31)</option>
				<option data-countryCode="NC" value="687">New Caledonia (+687)</option>
				<option data-countryCode="NZ" value="64">New Zealand (+64)</option>
				<option data-countryCode="NI" value="505">Nicaragua (+505)</option>
				<option data-countryCode="NE" value="227">Niger (+227)</option>
				<option data-countryCode="NG" value="234">Nigeria (+234)</option>
				<option data-countryCode="NU" value="683">Niue (+683)</option>
				<option data-countryCode="NF" value="672">Norfolk Islands (+672)</option>
				<option data-countryCode="NP" value="670">Northern Marianas (+670)</option>
				<option data-countryCode="NO" value="47">Norway (+47)</option>
				<option data-countryCode="OM" value="968">Oman (+968)</option>
				<option data-countryCode="PW" value="680">Palau (+680)</option>
				<option data-countryCode="PA" value="507">Panama (+507)</option>
				<option data-countryCode="PG" value="675">Papua New Guinea (+675)</option>
				<option data-countryCode="PY" value="595">Paraguay (+595)</option>
				<option data-countryCode="PE" value="51">Peru (+51)</option>
				<option data-countryCode="PH" value="63">Philippines (+63)</option>
				<option data-countryCode="PL" value="48">Poland (+48)</option>
				<option data-countryCode="PT" value="351">Portugal (+351)</option>
				<option data-countryCode="PR" value="1787">Puerto Rico (+1787)</option>
				<option data-countryCode="QA" value="974">Qatar (+974)</option>
				<option data-countryCode="RE" value="262">Reunion (+262)</option>
				<option data-countryCode="RO" value="40">Romania (+40)</option>
				<option data-countryCode="RU" value="7">Russia (+7)</option>
				<option data-countryCode="RW" value="250">Rwanda (+250)</option>
				<option data-countryCode="SM" value="378">San Marino (+378)</option>
				<option data-countryCode="ST" value="239">Sao Tome &amp; Principe (+239)</option>
				<option data-countryCode="SA" value="966">Saudi Arabia (+966)</option>
				<option data-countryCode="SN" value="221">Senegal (+221)</option>
				<option data-countryCode="CS" value="381">Serbia (+381)</option>
				<option data-countryCode="SC" value="248">Seychelles (+248)</option>
				<option data-countryCode="SL" value="232">Sierra Leone (+232)</option>
				<option data-countryCode="SG" value="65">Singapore (+65)</option>
				<option data-countryCode="SK" value="421">Slovak Republic (+421)</option>
				<option data-countryCode="SI" value="386">Slovenia (+386)</option>
				<option data-countryCode="SB" value="677">Solomon Islands (+677)</option>
				<option data-countryCode="SO" value="252">Somalia (+252)</option>
				<option data-countryCode="ZA" value="27">South Africa (+27)</option>
				<option data-countryCode="ES" value="34">Spain (+34)</option>
				<option data-countryCode="LK" value="94">Sri Lanka (+94)</option>
				<option data-countryCode="SH" value="290">St. Helena (+290)</option>
				<option data-countryCode="KN" value="1869">St. Kitts (+1869)</option>
				<option data-countryCode="SC" value="1758">St. Lucia (+1758)</option>
				<option data-countryCode="SD" value="249">Sudan (+249)</option>
				<option data-countryCode="SR" value="597">Suriname (+597)</option>
				<option data-countryCode="SZ" value="268">Swaziland (+268)</option>
				<option data-countryCode="SE" value="46">Sweden (+46)</option>
				<option data-countryCode="CH" value="41">Switzerland (+41)</option>
				<option data-countryCode="SI" value="963">Syria (+963)</option>
				<option data-countryCode="TW" value="886">Taiwan (+886)</option>
				<option data-countryCode="TJ" value="7">Tajikstan (+7)</option>
				<option data-countryCode="TH" value="66">Thailand (+66)</option>
				<option data-countryCode="TG" value="228">Togo (+228)</option>
				<option data-countryCode="TO" value="676">Tonga (+676)</option>
				<option data-countryCode="TT" value="1868">Trinidad &amp; Tobago (+1868)</option>
				<option data-countryCode="TN" value="216">Tunisia (+216)</option>
				<option data-countryCode="TR" value="90">Turkey (+90)</option>
				<option data-countryCode="TM" value="7">Turkmenistan (+7)</option>
				<option data-countryCode="TM" value="993">Turkmenistan (+993)</option>
				<option data-countryCode="TC" value="1649">Turks &amp; Caicos Islands (+1649)</option>
				<option data-countryCode="TV" value="688">Tuvalu (+688)</option>
				<option data-countryCode="UG" value="256">Uganda (+256)</option>
				<option data-countryCode="GB" value="44">UK (+44)</option>
				<option data-countryCode="UA" value="380">Ukraine (+380)</option>
				<option data-countryCode="AE" value="971">United Arab Emirates (+971)</option>
				<option data-countryCode="UY" value="598">Uruguay (+598)</option>
				<option data-countryCode="US" value="1">USA (+1)</option>
				<option data-countryCode="UZ" value="7">Uzbekistan (+7)</option>
				<option data-countryCode="VU" value="678">Vanuatu (+678)</option>
				<option data-countryCode="VA" value="379">Vatican City (+379)</option>
				<option data-countryCode="VE" value="58">Venezuela (+58)</option>
				<option data-countryCode="VN" value="84">Vietnam (+84)</option>
				<option data-countryCode="VG" value="84">Virgin Islands - British (+1284)</option>
				<option data-countryCode="VI" value="84">Virgin Islands - US (+1340)</option>
				<option data-countryCode="WF" value="681">Wallis &amp; Futuna (+681)</option>
				<option data-countryCode="YE" value="969">Yemen (North)(+969)</option>
				<option data-countryCode="YE" value="967">Yemen (South)(+967)</option>
				<option data-countryCode="ZM" value="260">Zambia (+260)</option>
				<option data-countryCode="ZW" value="263">Zimbabwe (+263)</option>
			</select>
		</div>
		<div class="mb_15">
			<label class="form-label" for="phone">전화번호</label>
			<input class="form-control" type="text" name="phone" id="phone" value="${dto.phone }" maxlength="11" placeholder="전화번호"/>
			<div class="invalid-feedback">01(0|1|6|7|8|9)로 시작하고 숫자만 입력해주세요</div>
		</div>
		<div>
			<!-- 
			<label class="form-label" for="addr">주소</label>
			<input class="form-control" type="text" name="addr" id="addr" value="${dto.addr }"/>
			 -->
			
			<div class="mb-4 mt-4">
			<div class="row g-2 mb-2">
				<div class="col-auto">
					<input class="form-control" type="text" id="postcode" placeholder="우편번호" readonly>
				</div>
				<div class="col-auto">
					<button class="btn btn-dark" type="button" onclick="execDaumPostcode()" style="border-radius:0px;">우편번호 찾기</button>
				</div>
			</div>
			<div class="mb-2">
				<input class="form-control" type="text" id="addr" placeholder="주소" readonly>
			</div>
			<div class="row g-2 mb-2">
				<div class="col-auto">	
					<input class="form-control" type="text" id="detailAddr" placeholder="상세주소" maxlength="25">
					<div class="invalid-feedback" >상세주소를 입력해주세요</div>
				</div>
				<div class="col-auto">
					<input class="form-control" type="text" id="extraAddr" placeholder="참고항목" readonly>
				</div>
			</div>
			<input type="hidden" name="addr" id="totalAddr">
		</div>
		</div>		
		<button class="lshbtn" type="submit">저장</button>
	</form>
	
	
	<form style="display:none;" action="${pageContext.request.contextPath}/mypage/users/ajax_profile_upload.do" method="post" 
				id="imageForm" enctype="multipart/form-data">
		<input class="form-control" type="file" name="image" id="image" 
			accept=".jpg, .jpeg, .png, .JPG, .JPEG, .gif"/>
	</form>
	
</div>
<jsp:include page="/include/footer.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
<script>
	//유효성 여부를 저장할 변수를 만들고 초기값 대입 
	let isPhoneValid=false;
	let isAddrValid01=false;
	let isAddrValid02=false;
	let isEmailValid=false;
	
	document.querySelector("#email").addEventListener("input", function(){
		
		this.classList.remove("is-valid");
		this.classList.remove("is-invalid");
		//입력한 이메일
		const inputEmail=this.value;
		//이메일을 검증할 정규 표현식
		const reg=/@/;
		if(!reg.test(inputEmail)){
			this.classList.add("is-invalid");
			isEmailValid=false;
		}else{
			this.classList.add("is-valid");
			isEmailValid=true;
		}
	});

	document.querySelector("#phone").addEventListener("input", function(){
		
		this.classList.remove("is-valid");
		this.classList.remove("is-invalid");
		//입력한 전화번호
		this.value=this.value.replace(/[^0-9]/g, '');
		const inputPhone = this.value;
		//전화번호 검증할 정규 표현식
		const reg=/^01([0|1|6|7|8|9])([0-9]{3,4})([0-9]{4})/;
		if (!reg.test(inputPhone)) {
			this.classList.add("is-invalid");
			isPhoneValid=false;
		}else{
			this.classList.add("is-valid");
			isPhoneValid=true;
		}
	});
	
	let arr="${dto.addr}".split("_");
	console.log(arr);
	let a1=document.querySelector("#postcode");
	let a2=document.querySelector("#addr");
	let a3=document.querySelector("#detailAddr");
	let a4=document.querySelector("#extraAddr");
	a1.value=arr[0];
	a2.value=arr[1];
	a3.value=arr[2];
	a4.value=arr[3];
	
	//Daum 우편번호 서비스
	function execDaumPostcode() {
		//아래 코드처럼 테마 객체를 생성합니다.(color값은 #F00, #FF0000 형식으로 입력하세요.)
		//변경되지 않는 색상의 경우 주석 또는 제거하시거나 값을 공백으로 하시면 됩니다.
		var themeObj = {
		   bgColor: "#FAFAFA", //바탕 배경색
		   searchBgColor: "#E3F2FD", //검색창 배경색
		   contentBgColor: "#E3F2FD" //본문 배경색(검색결과,결과없음,첫화면,검색서제스트)
		   //pageBgColor: "", //페이지 배경색
		   //textColor: "", //기본 글자색
		   //queryTextColor: "", //검색창 글자색
		   //postcodeTextColor: "", //우편번호 글자색
		   //emphTextColor: "", //강조 글자색
		   //outlineColor: "", //테두리
		};
		
        new daum.Postcode({theme: themeObj,
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = '(' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddr").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddr").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("addr").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddr").focus();
                isAddrValid01=true;
            }
        }).open();
    }
	
	document.querySelector("#detailAddr").addEventListener("input", function(){
		
		this.classList.remove("is-valid");
		this.classList.remove("is-invalid");
		//입력한 상세주소
		const inputDtailAddr = this.value;
		//상세주소를 입력했는지 검증
		const reg=/.{1,}/;
		if (!reg.test(inputDtailAddr)) {
			this.classList.add("is-invalid");
			isAddrValid02=false;
		}else{
			this.classList.add("is-valid");
			isAddrValid02=true;
		}
	});
	
	
	//폼에 submit 이벤트가 일어 났을때 실행할 함수 등록
	document.querySelector("#updateForm").addEventListener("submit", function(event){
		
		if(document.querySelector("#phone").value != ""){
			isPhoneValid=true;
		}
		if(document.querySelector("#email").value != ""){
			isEmailValid=true;
		}
		if(document.querySelector("#postcode").value != ""){
			isAddrValid01=true;
		}
		if(document.querySelector("#detailAddr").value != ""){
			isAddrValid02=true;
		}
		
		//폼 전체의 유효성 여부
		//and 연상자 이용
		let isFormValid=isEmailValid && isPhoneValid && isAddrValid01 && isAddrValid02;
		if(!isFormValid){
			//폼 제출 막기 
			//기본 동작을 막는 함수
			event.preventDefault();
		}
		let postcode=document.querySelector("#postcode").value;
		let addr=document.querySelector("#addr").value;
		let detailAddr=document.querySelector("#detailAddr").value;
		let extraAddr=document.querySelector("#extraAddr").value;
		let totalAddr=document.querySelector("#totalAddr");
		totalAddr.value=postcode+"_"+addr+"_"+detailAddr+"_"+extraAddr;
	});
	
	//프로필 이미지 링크를 클릭하면 
	document.querySelector("#profileLink").addEventListener("click", function(){
		// input type="file" 을 강제 클릭 시킨다. 
		document.querySelector("#image").click();
	});
	//이미지를 선택했을때 실행할 함수 등록 
	document.querySelector("#image").addEventListener("change", function(){
		
		let form=document.querySelector("#imageForm");
		
		// gura_util.js 에 정의된 함수를 호출하면서 ajax 전송할 폼의 참조값을 전달하면 된다. 
		ajaxFormPromise(form)
		.then(function(response){
			return response.json();
		})
		.then(function(data){
			// data 는 {imagePath:"/upload/xxx.jpg"} 형식의 object 이다.
			console.log(data);
			// let img='<img id="profileImage" src="${pageContext.request.contextPath}'+data.imagePath+'"/>`
			let img=`<img id="profileImage" src="${pageContext.request.contextPath}\${data.imagePath}"/>`;
			// img 변수에 들어있는 문자열을 HTML 로 해석하면서 링크 안에 넣어주세요
			document.querySelector("#profileLink").innerHTML=img;
			// input name="profile" 요소의 value 값으로 이미지 경로 넣어주기
			
			/*
				document.querySelector(" css 선택자 ") - 오브젝트 1개 리턴(오브젝트)
				document.querySelectorAll(" css 선택자 ") - 오브젝트 여러개 리턴(배열)
			
				# => 아이디 선택자
				. => 클래스 선택자
				[ ] => 속성 선택자
				
				ex) [속성명=속성값]
		
				[id=one] : id 속성의 값이 one 인 요소 선택 : < xxx id = "one" >
				[class=my-class] : class 속성의 값이 my-class 인 요소 선택 : < xxx class = "my-class" >
				[name=profile] : < xxx name = "profile" >
				
				input[name=profile] : input 요소이면서 name 속성의 값이 profile 인 요소 선택
				
				<input name="profile">
			*/
			document.querySelector("input[name=profile]").value=data.imagePath;
		});
	});
</script>
</body>
</html>