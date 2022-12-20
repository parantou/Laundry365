<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
	 <!-- 네비바 시작 -->
	 <div class = "main-wrapper1" id="menu">
	
		<nav class = "navbar1">
			<div class = "brand-and-icon1">
				<a href = "${pageContext.request.contextPath }/" class = "navbar-brand1 logo">Laundry365</a>
				<button type = "button" class = "navbar-toggler1">
					<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-list" viewBox="0 0 16 16">
					<path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z"/>
					</svg>
				</button>
			</div>
	
			<div class = "navbar-collapse1">
				<ul class = "navbar-nav1">
				<li class="home1"><a href = "${pageContext.request.contextPath }/">home</a></li>
	
				<li>
					<a href = "#" class = "menu-link1">
						브랜드소개
					</a>
					<div class = "sub-menu1">
						<!-- item -->
						<div class = "sub-menu-item1">
						</div>
						<!-- end of item -->
						<!-- item -->
						<div class = "sub-menu-item1">
							<h3>브랜드소개</h3>
							<ul>
								<li><a href = "${pageContext.request.contextPath}/corporation/brand.do">회사소개</a></li>
								<li><a href = "${pageContext.request.contextPath}/corporation/history.do">연혁</a></li>
								<li><a href = "${pageContext.request.contextPath }/corporation/startup.do">창업안내</a></li>
								<li><a href = "${pageContext.request.contextPath }/corporation/members.do">팀원소개</a></li>
							</ul>
						</div>
						<!-- end of item -->
						<!-- item -->
						<div class = "sub-menu-item1" id="lili2">
							<h2>
								명품을 명품답게<br>명품 케어 서비스
							</h2>
							<button type = "button" class = "btn1" onclick="location.href='${pageContext.request.contextPath}/corporation/brand.do'">회사소개</button>
						</div>
						<!-- end of item -->
						<!-- item -->
						<div class = "sub-menu-item1">
						</div>
						<!-- end of item -->
					</div>
				</li>
	
				<li>
					<a href = "#" class = "menu-link1">
						이용안내
					</a>
					<div class = "sub-menu1">
						<!-- item -->
						<div class = "sub-menu-item1">
						</div>
						<!-- end of item -->
						<!-- item -->
						<div class = "sub-menu-item1">
							<h3>이용안내</h3>
							<ul>
								<li><a href = "${pageContext.request.contextPath}/guide/price_guide.do">가격안내</a></li>
								<li><a href = "${pageContext.request.contextPath}/guide/area_guide.do">지역안내</a></li>
							</ul>
						</div>
						<div class = "sub-menu-item1" id="lili2">
							<h2>편안한 이용을 위해 Laundry365가 함께하겠습니다.</h2>
							<button type = "button" class = "btn1" onclick="location.href='${pageContext.request.contextPath}/guide/price_guide.do'">가격안내</button>
						</div>
						<!-- end of item -->
						<!-- item -->
						<div class = "sub-menu-item1">
						</div>
						<!-- end of item -->
					</div>
				</li>
	
				<li>
					<a href = "#" class = "menu-link1">
						예약안내
					</a>
					<div class = "sub-menu1">
						<!-- item -->
						<div class = "sub-menu-item1">
						</div>
						<!-- end of item -->
						<!-- item -->
						<div class = "sub-menu-item1">
							<h3>예약안내</h3>
							<ul>
								<li><a href = "${pageContext.request.contextPath}/reserve/reserve_select.do">예약안내</a></li>
							</ul>
						</div>
						<!-- end of item -->
						<!-- item -->
						<div class = "sub-menu-item1" id="lili2">
							<h2>365일 언제나!<br>Laundry365와 함께해요~!</h2>
							<button type = "button" class = "btn1" onclick="location.href='${pageContext.request.contextPath}/reserve/reserve_select.do'">예약안내</button>
						</div>
						<!-- end of item -->
						<!-- item -->
						<div class = "sub-menu-item1">
							<!-- end of item -->
						</div>
					</div>
				</li>
	
				<li>
					<a href = "#" class = "menu-link1">
						고객지원
					</a>
					<div class = "sub-menu1">
						<!-- item -->
						<div class = "sub-menu-item1">
						</div>
						<!-- end of item -->
						<!-- item -->
						<div class = "sub-menu-item1">
							<h3>고객지원</h3>
							<ul>
								<li><a href = "${pageContext.request.contextPath}/review/list.do">후기게시판</a></li>
								<li><a href = "${pageContext.request.contextPath }/faq/list.do">질문게시판</a></li>
								<li><a href = "${pageContext.request.contextPath}/notice/list.do">공지사항</a></li>
							</ul>
						</div>
						<!-- end of item -->
						<!-- item -->
						<div class = "sub-menu-item1" id="lili2">
							<h2>Laundry에서<br> 여러분의 고민을 상담해 드립니다.</h2>
							<button type = "button" class = "btn1" onclick="location.href='${pageContext.request.contextPath}/faq/list.do'">질문게시판</button>
						</div>
						<!-- end of item -->
						<!-- item -->
						<div class = "sub-menu-item1">
						</div>
						
					</div>
				</li>
	
				<li>
					<a href = "#" class = "menu-link1">
						마이페이지
					</a>
					<div class = "sub-menu1">
						<!-- item -->
						<div class = "sub-menu-item1">
						</div>
						<!-- end of item -->
						<!-- item -->
						<div class = "sub-menu-item1">
							<h3>마이페이지</h3>
							<ul>
								<li><a href = "${pageContext.request.contextPath }/mypage/users/info.do">회원정보</a></li>
								<li><a href = "${pageContext.request.contextPath}/mypage/order.do">신청내역확인</a></li>
								<%-- 로그인 여부에 따라 --%>
								<c:choose>
									<c:when test="${ empty sessionScope.id}">
										<li class="lili1"><a href="${pageContext.request.contextPath}/users/login_form.do">로그인</a></li>
										<li class="lili1"><a href="${pageContext.request.contextPath}/users/signup_form.do">회원가입</a></li>
									</c:when>
									<c:otherwise>
										<li class="lili1"><a href="${pageContext.request.contextPath}/users/logout.do">로그아웃</a></li>
									</c:otherwise>
								</c:choose>
							</ul>
						</div>
						<!-- end of item -->
						<!-- item -->
						<div class = "sub-menu-item1" id="lili2">
							<h2>여러분의 배송정보를 여기서 확인해 보세요.</h2>
							<button type = "button" class = "btn1" onclick="location.href='${pageContext.request.contextPath}/mypage/order.do'">신청내역확인</button>
						</div>
						<!-- end of item -->
						<!-- item -->
						<div class = "sub-menu-item1">
						</div>
						
					</div>
				</li>
				</ul>
			</div>
			<div class="header-top1">
			<c:choose>
				<%-- 로그인 여부에 따라 --%>
				<c:when test="${ empty sessionScope.id}">
						<ul class="menu1">
							<li><a href="${pageContext.request.contextPath}/users/login_form.do"><strong>로그인</strong></a></li>
							<li><a href="${pageContext.request.contextPath}/users/signup_form.do"><strong>회원가입</strong></a></li>			
						</ul>
				</c:when>
				<c:otherwise>
						<ul class="menu1">
							<li><a href="${pageContext.request.contextPath}/users/logout.do"><strong>로그아웃</strong></a></li>			
						</ul>
				</c:otherwise>
			</c:choose>
			</div><!-- /header-top -->

		</nav>
	</div>
	<!-- 네비바 끝 -->
	<!--jQuery-->
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/nav.js"></script>
