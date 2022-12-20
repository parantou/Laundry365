<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 대메뉴별 서브 이미지와 문구 -->
<div id="subnav">
    <c:choose>
        <c:when test="${param.thisPage eq 'brand'}">
    		<!-- 브랜드 서브 이미지와 문구 -->
    		<div id="image-box">
    			<img id="image-thumbnail" 
    				src="${pageContext.request.contextPath }/resources/img/brandSubImg2.jpg" alt="" />
    		</div>
    		<div id="sub-text">
    			<p id="subTitle">브랜드소개</p>
				<p id="subContent">Laundry365를 소개합니다.</p>	
    		</div>
    	</c:when>
    	
    	<c:when test="${param.thisPage eq 'guide'}">
    		<!-- 이용안내 서브 이미지와 문구 -->
    		<div id="image-box">
    			<img id="image-thumbnail" 
    				src="${pageContext.request.contextPath }/resources/img/sub/guideimg.jpg" alt="" />
    		</div>
    		<div id="sub-text">
    			<p id="subTitle">이용안내</p>
				<p id="subContent">편한한 이용을 위해 Laundry365가 함께하겠습니다.</p>	
    		</div>
    	</c:when>
    	
    	<c:when test="${param.thisPage eq 'reserve'}">
    		<!-- 예약안내 서브 이미지와 문구 -->
    		<div id="image-box">
    			<img id="image-thumbnail" 
    				src="${pageContext.request.contextPath }/resources/img/sub/reserveimg.jpg" alt="" />
    		</div>
    		<div id="sub-text">
    			<p id="subTitle">예약안내</p>
				<p id="subContent">365일 언제나!Laundry365와 함께해요~!</p>	
    		</div>
    	</c:when>
    	
    	<c:when test="${param.thisPage eq 'support'}">
    		<!-- 고객지원 서브 이미지와 문구 -->
    		<div id="image-box">
    			<img id="image-thumbnail" 
    				src="${pageContext.request.contextPath }/resources/img/sub/support.png" alt="" />
    		</div>
    		<div id="sub-text">
    			<p id="subTitle">고객지원</p>
				<p id="subContent">365일 신속, 정확한 고객케어 서비스를 운영합니다.</p>	
    		</div>
    	</c:when>
    	
 	    <c:when test="${param.thisPage eq 'mypage'}">
			<!-- 마이페이지 서브 이미지와 문구 -->
    		<div id="image-box">
    			<img id="image-thumbnail" 
    				src="${pageContext.request.contextPath }/resources/img/sub/mypageimg.jpg" alt="" />
    		</div>
    		<div id="sub-text">
    			<p id="subTitle">마이페이지</p>
				<p id="subContent">여러분의 배송정보를 여기서 확인해 보세요.</p>	
    		</div>
    	</c:when>
    	
    	<c:when test="${param.thisPage eq 'login' or param.thisPage eq 'signup' 
	    		or param.thisPage eq 'findpwd' or param.thisPage eq 'findid'}">
			<!-- 로그인 및 회원가입 서브 이미지와 문구 -->
    		<div id="image-box">
    			<img id="image-thumbnail" 
    				src="${pageContext.request.contextPath }/resources/img/sub/loginimg.jpg" alt="" />
    		</div>
    		<div id="sub-text">
    			<p id="subTitle"></p>
				<p id="subContent"></p>	
    		</div>
    	</c:when>
    	
    	<c:when test="${param.thisPage eq 'manager'}">
			<!-- 관리자 서브 이미지와 문구 -->
    		<div id="image-box">
    			<img id="image-thumbnail" 
    				src="${pageContext.request.contextPath }/resources/img/sub/mypageimg.jpg" alt="" />
    		</div>
    		<div id="sub-text">
    			<p id="subTitle">관리자페이지</p>
				<p id="subContent">고객 및 주문 관리</p>	
    		</div>
    	</c:when>
    </c:choose>
</div>
<!-- 대메뉴별 중메뉴 문구 -->
<c:choose>
	<c:when test="${param.thisPage eq 'login'}">
		<div id="subMenuText">
			<p>User Login</p>
		</div>
	</c:when>
	<c:when test="${param.thisPage eq 'signup'}">
		<div id="subMenuText">
			<p>회원가입</p>
		</div>
	</c:when>
	<c:when test="${param.thisPage eq 'findpwd'}">
		<div id="subMenuText">
			<p>비밀번호 찾기</p>
		</div>
	</c:when>
	<c:when test="${param.thisPage eq 'findid'}">
		<div id="subMenuText">
			<p>아이디 찾기</p>
		</div>
	</c:when>
	<c:otherwise>
		<nav class="bg-light">
		  <div id="subNavbar">
		    <div id="subNavbarNav">
		    <c:choose>
		  	   	<c:when test="${param.thisPage eq 'brand'}">
		    		<!-- 브랜드  서브 네비바 -->
					<ul id="subNavUl">
						<li class="subNavItem ${param.subPage eq 'corpor' ? 'deco' : ''}">
						  	<a class="${param.subPage eq 'corpor' ? 'active' : ''}" aria-current="page" href="${pageContext.request.contextPath}/corporation/brand.do">회사소개</a>
						</li>
						<li class="subNavItem ${param.subPage eq 'history' ? 'deco' : ''}">
						  	<a class="${param.subPage eq 'history' ? 'active' : ''}" href="${pageContext.request.contextPath}/corporation/history.do">연혁</a>
						</li>					
						<li class="subNavItem ${param.subPage eq 'startup' ? 'deco' : ''}">
						  	<a class="${param.subPage eq 'startup' ? 'active' : ''}" href="${pageContext.request.contextPath}/corporation/startup.do">창업안내</a>
						</li>
						<li class="subNavItem ${param.subPage eq 'members' ? 'deco' : ''}">
						  	<a class="${param.subPage eq 'members' ? 'active' : ''}" href="${pageContext.request.contextPath}/corporation/members.do">팀원소개</a>
						</li>				
					</ul>
		    	</c:when>
		    	<c:when test="${param.thisPage eq 'guide'}">
		    		<!-- 이용안내  서브 네비바 -->
					<ul id="subNavUl">
						<li class="subNavItem ${param.subPage eq 'price' ? 'deco' : ''}">
						  	<a class="${param.subPage eq 'price' ? 'active' : ''}" href="price_guide.do">가격안내</a>
						</li>
						<li class="subNavItem ${param.subPage eq 'area' ? 'deco' : ''}">
						  	<a class="${param.subPage eq 'area' ? 'active' : ''}" aria-current="page" href="area_guide.do">지역안내</a>
						</li>
					</ul>
		    	</c:when>
		    	<c:when test="${param.thisPage eq 'reserve'}">
		    		<!-- 예약안내  서브 네비바 -->
					<ul id="subNavUl">
						<li class="subNavItem ${param.subPage eq 'reserve' ? 'deco' : ''}">
						  	<a class="active" href="reserve_select.do">예약안내</a>
						</li>
					</ul>
		    	</c:when>
				<c:when test="${param.thisPage eq 'support'}">
		    		<!-- 고객지원  서브 네비바 -->
					<ul id="subNavUl">
						<li class="subNavItem ${param.subPage eq 'review' ? 'deco' : ''}">
						  	<a class="${param.subPage eq 'review' ? 'active' : ''}" href="${pageContext.request.contextPath}/review/list.do">후기게시판</a>
						</li>
						<li class="subNavItem ${param.subPage eq 'faq' ? 'deco' : ''}">
						  	<a class="${param.subPage eq 'faq' ? 'active' : ''}" aria-current="page" href="${pageContext.request.contextPath}/faq/list.do">질문게시판</a>
						</li>
						<li class="subNavItem ${param.subPage eq 'notice' ? 'deco' : ''}">
						  	<a class="${param.subPage eq 'notice' ? 'active' : ''}" aria-current="page" href="${pageContext.request.contextPath}/notice/list.do">공지사항</a>
						</li>
					</ul>
		    	</c:when>
		    	<c:when test="${param.thisPage eq 'mypage'}">
		    		<!-- 마이페이지  서브 네비바 -->
					<ul id="subNavUl">
						<li class="subNavItem ${param.subPage eq 'info' ? 'deco' : ''}">
							<a class="${param.subPage eq 'info' ? 'active' : ''}" href="${pageContext.request.contextPath }/mypage/users/info.do">회원정보</a>
						</li>
						<li class="subNavItem ${param.subPage eq 'orderlist' ? 'deco' : ''}">
							<a class="${param.subPage eq 'orderlist' ? 'active' : ''}" aria-current="page" href="${pageContext.request.contextPath}/mypage/order.do">신청내역확인</a>
						</li>
					</ul>
				</c:when>
				<c:when test="${param.thisPage eq 'manager'}">
		    		<!-- 마이페이지  서브 네비바 -->
					<ul id="subNavUl">
						<li class="subNavItem ${param.subPage eq 'user' ? 'deco' : ''}">
							<a class="${param.subPage eq 'user' ? 'active' : ''}" href="${pageContext.request.contextPath }/mypage/user.do">고객관리</a>
						</li>
						<li class="subNavItem ${param.subPage eq 'order' ? 'deco' : ''}">
							<a class="${param.subPage eq 'order' ? 'active' : ''}" aria-current="page" href="${pageContext.request.contextPath}/mypage/order.do">주문관리</a>
						</li>
					</ul>
				</c:when>
		    </c:choose>
		    </div>
		  </div>
		</nav>
		<div id="subMenuText">
			<c:choose>
				<c:when test="${param.thisPage eq 'brand' and param.subPage eq 'corpor'}">
		    		<p>회사소개</p>
		    	</c:when>
		  	    <c:when test="${param.thisPage eq 'brand' and param.subPage eq 'history'}">
		    		<p>연혁</p>
		    	</c:when>
		    	<c:when test="${param.thisPage eq 'brand' and param.subPage eq 'startup'}">
		    		<p>창업안내</p>
		    	</c:when>
		    	<c:when test="${param.thisPage eq 'brand' and param.subPage eq 'members'}">
		    		<p>팀원소개</p>
		    	</c:when>  
		    	
		  	    <c:when test="${param.thisPage eq 'guide' and param.subPage eq 'price'}">
		    		<p>가격안내</p>
		    	</c:when>
		    	<c:when test="${param.thisPage eq 'guide' and param.subPage eq 'area'}">
		    		<p>지역안내</p>
		    	</c:when>
		    	
		    	<c:when test="${param.thisPage eq 'reserve' and param.subPage eq 'reserve'}">
		    		<p>예약안내</p>
		    	</c:when>
		    	
		    	<c:when test="${param.thisPage eq 'support' and param.subPage eq 'review'}">
		    		<p>후기게시판</p>
		    	</c:when>
		    	<c:when test="${param.thisPage eq 'support' and param.subPage eq 'faq'}">
		    		<p>질문게시판</p>
		    	</c:when>
		    	<c:when test="${param.thisPage eq 'support' and param.subPage eq 'notice'}">
		    		<p>공지사항</p>
		    	</c:when>
		    	
		    	<c:when test="${param.thisPage eq 'mypage' and param.subPage eq 'info'}">
		    		<p>회원정보</p>
		    	</c:when>
		  	    <c:when test="${param.thisPage eq 'mypage' and param.subPage eq 'orderlist'}">
		    		<p>신청내역</p>
		    	</c:when> 
			</c:choose>
		</div>
	</c:otherwise>
</c:choose>
