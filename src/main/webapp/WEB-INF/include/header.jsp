<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<base href="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/"/>


<header class="header-area">
		<!-- Navbar Area -->
		<div class="oneMusic-main-menu">
			<div class="classy-nav-container breakpoint-off">
				<div class="container">
					<!-- Menu -->
					<nav class="classy-navbar justify-content-between" id="oneMusicNav">

						<!-- Nav brand -->
						<a href="index.htm" class="brand">22MUSIC</a>

						<!-- Navbar Toggler -->
						<div class="classy-navbar-toggler">
							<span class="navbarToggler"><span></span><span></span><span></span></span>
						</div>

						<!-- Menu -->
						<div class="classy-menu">

							<!-- Close Button -->
							<div class="classycloseIcon">
								<div class="cross-wrap">
									<span class="top"></span><span class="bottom"></span>
								</div>
							</div>

							<!-- Nav Start -->
							<div class="classynav">
								<ul>
									<li><a href="index.htm">Trang Chủ</a></li>
									<li><a href="#">Thể Loại<i></i></a>
										<ul class="dropdown">
											<li><a href="tag/Pop.htm">Nhạc Pop</a></li>
											<li><a href="tag/Bolero.htm">Nhạc Bolero</a></li>
											<li><a href="tag/Rap.htm">Nhạc Rap</a></li>
											<li><a href="tag/US-UK.htm">Nhạc US-UK</a></li>
											<li><a href="tag/EDM.htm">Nhạc EDM</a></li>
											<li><a href="tag/Korean.htm">Nhạc Hàn</a></li>
											
										</ul></li>

									<li><a href="tag/recommend.htm">Đề xuất</a>
										</li>
									<c:if test="${isLogin == true}">
										<li><a id="favor" href="favor.htm">Yêu thích</a>
										</li>
									</c:if>
									<c:if test="${isLogin == false}">
										<li><a id="favor" href="login.htm">Yêu thích</a>
										</li>
									</c:if>
									<li class = "search-nav">
										<form action="search.htm">
											 <input type="search" id="gsearch" name="timkiem" value = "" > 
											 <button><i class="fa fa-search"></i></button>
										</form>
									</li>
								</ul>

								<!-- Login/Register & Cart Button -->
								<div
									class="login-register-cart-button d-flex align-items-center">


									<c:if test="${isLogin == true}">
										<!-- Login/Register -->
										<div class="login-register-btn mr-20">
											<span class="username-text">${accountName}</span>
											<span style="color: white; font-size: 18px; margin: 0 8px;"> | </span>
											 <a name="btnRegister" href="logout.htm" id="registerBtn">Đăng
												Xuất</a>
										</div>
									</c:if>
									<c:if test="${isLogin == false}">
										<!-- Login/Register -->
										<div class="login-register-btn mr-20">
											<a name="btnLogin" href="login.htm" id="loginBtn">Đăng
												Nhập</a> <span style="color: white; font-size: 18px"> / </span>
											<a name="btnRegister" href="register.htm" id="registerBtn">Đăng
												Kí</a>
										</div>
									</c:if>

								</div>
							</div>
							<!-- Nav End -->

						</div>
					</nav>
				</div>
			</div>
		</div>
	</header>