<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>One Music - Modern Music HTML5 Template</title>

    <!-- Favicon -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Stylesheet -->
    <link rel="stylesheet" href="style.css">

</head>

<body>
    <!-- Preloader -->
    <div class="preloader d-flex align-items-center justify-content-center">
        <div class="lds-ellipsis">
            <div></div>
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>

    <!-- ##### Header Area Start ##### -->
	<header class="header-area">
		<!-- Navbar Area -->
		<div class="oneMusic-main-menu">
			<div class="classy-nav-container breakpoint-off">
				<div class="container">
					<!-- Menu -->
					<nav class="classy-navbar justify-content-between" id="oneMusicNav">

						<!-- Nav brand -->
						<a href="index.htm" class="nav-brand"><img
							src="img/core-img/logo.png" alt=""></a>

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
									<li><a href="albums.htm">Albums</a></li>
									<li><a href="#">Thể Loại<i></i></a>
										<ul class="dropdown">
											<li><a href="theloai.htm?Loai=NhacTre">Nhạc Trẻ</a></li>
											<li><a href="theloai.htm?Loai=Bolero">Bolero</a></li>
											<li><a href="theloai.htm?Loai=Rap">Rap</a></li>
											<li><a href="theloai.htm?Loai=US-UK">Nhạc US-UK</a></li>
											<li><a href="theloai.htm?Loai=NhacHoa">Nhạc Hoa</a></li>
											<li><a href="theloai.htm?Loai=Latin">Nhạc Latin</a></li>
											<li><a href="theloai.htm?Loai=Korean">Nhạc Hàn</a></li>
											<li><a href="theloai.htm?Loai=Khac">Các Thể Loại Khác</a></li>
											
											
										</ul></li>
									
									<li><a href="#">Top 100</a>
										<ul class="dropdown">
											<li><a href="quocgia.htm?QuocGia=VN">Việt Nam</a></li>
											<li><a href="quocgia.htm?QuocGia=ChauA">Châu Á</a></li>
											<li><a href="quocgia.htm?QuocGia=MyLatin">Mỹ Latin</a></li>
											<li><a href="quocgia.htm?QuocGia=US-UK">US-UK</a></li>
											<li><a href="quocgia.htm?QuocGia=NhacHoa">Nhạc Hoa</a></li>
											<li><a href="quocgia.htm?QuocGia=Korean">Nhạc Hàn</a></li>
											<li><a href="quocgia.htm?QuocGia=Khac">Quốc Gia Khác</a></li>
										</ul></li>
									<li>
										<form action="timkiem.htm">
											 <input type="search" id="gsearch" name="name" value = "" > 
											 <button>Tìm</button>
										</form>
									</li>
								</ul>

								<!-- Login/Register & Cart Button -->
								<div
									class="login-register-cart-button d-flex align-items-center">


									<c:if test="${login == true}">
										<!-- Login/Register -->
										<div class="login-register-btn mr-20">
											<a name="btnLogin" href="playlist.htm" id="loginBtn">Playlist</a> <span style="color: white; font-size: 18px"> /
											</span> <a name="btnRegister" href="logout.htm" id="registerBtn">Đăng
												Xuất</a>
										</div>
									</c:if>
									<c:if test="${login == false}">
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
	<!-- ##### Header Area End ##### -->

    <!-- ##### Breadcumb Area Start ##### -->
    <section class="breadcumb-area bg-img bg-overlay" style="background-image: url(img/bg-img/breadcumb3.jpg);">
        <div class="bradcumbContent">
            <p>See what’s new</p>
            <h2>Login</h2>
        </div>
    </section>
    <!-- ##### Breadcumb Area End ##### -->

    <!-- ##### Login Area Start ##### -->
    <section class="login-area section-padding-100">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-lg-8">
                    <div class="login-content">
                        <h3>Welcome Back</h3>
                        <!-- Login Form -->
                        <div class="login-form">
                            <form action="confirm.htm" method="post">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Nhập Số</label>
                                    <input name= "number" type="number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Number" value="" >
                                    <small id="emailHelp" class="form-text text-muted"><i class="fa fa-lock mr-2"></i>We'll never share your email with anyone else.</small>
                                </div>
                                
                                <button type="submit" class="btn oneMusic-btn mt-30">Xác Nhận</button>
								<a name="btnReset" href="resend.htm" class="btn oneMusic-btn mt-30">Gửi Lại</a>
                            </form>
                            <div>${message}</div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Login Area End ##### -->

    <!-- ##### Footer Area Start ##### -->
    <footer class="footer-area">
        <div class="container">
            <div class="row d-flex flex-wrap align-items-center">
                <div class="col-12 col-md-6">
                    <a href="#"><img src="img/core-img/logo.png" alt=""></a>
                    <p class="copywrite-text"><a href="#"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://www.facebook.com/liemlemlinh.nguyen" target="_blank">Thanh Liêm</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                </div>

                <div class="col-12 col-md-6">
                    <div class="footer-nav">
                        <ul>
                            <li><a href="#">Trang Chủ</a></li>
                            <li><a href="#">Điều Khoảng</a></li>
                            <li><a href="#">Liên Lạc</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- ##### Footer Area Start ##### -->

    <!-- ##### All Javascript Script ##### -->
    <!-- jQuery-2.2.4 js -->
    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="js/bootstrap/bootstrap.min.js"></script>
    <!-- All Plugins js -->
    <script src="js/plugins/plugins.js"></script>
    <!-- Active js -->
    <script src="js/active.js"></script>
</body>

</html>l>