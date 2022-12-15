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

    
	
    <!-- ##### Featured Artist Area Start ##### -->
	<section
		class="featured-artist-area section-padding-100 bg-img bg-overlay bg-fixed"
		style="background-image: url(img/bg-img/bg-4.jpg);">
		<div class="container">
			<div class="row align-items-end">
				<div class="col-12 col-md-5 col-lg-4">
					<div class="featured-artist-thumb">
						<img src="${baihat[0].imagecore}" alt="">
					</div>
				</div>
				<div class="col-12 col-md-7 col-lg-8">
					<div class="featured-artist-content">
						<!-- Section Heading -->
						<div class="section-heading white text-left mb-30">
							
						</div>
						<p>One Music sẽ mang đến cho bạn những bài hát mới nhất trên
							khắp thế giới trong từng giây.</p>
							<c:forEach var="bh" items="${baihat}">
								<div class="song-play-area">
								<div class="song-name">
									<p>
										<span>${bh.ten}</span>
										<span><a href = "deletemusic.htm?id=${bh.id}">Xóa</a></span>
									</p>
								</div>
								<audio preload="auto" controls>
									<source src="${bh.audio}">
								</audio>
						</div>
						</c:forEach>
						
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- ##### Featured Artist Area End ##### -->

    

    <!-- ##### Contact Area Start ##### -->
    <section class="contact-area section-padding-100 bg-img bg-overlay bg-fixed has-bg-img" style="background-image: url(img/bg-img/bg-2.jpg);">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-heading white wow fadeInUp" data-wow-delay="100ms">
                        <p>See what’s new</p>
                        <h2>Get In Touch</h2>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    <!-- Contact Form Area -->
                    <div class="contact-form-area">
                        <form action="sendmail.htm" method="post">
                            <div class="row">
                                <div class="col-md-6 col-lg-4">
                                    <div class="form-group wow fadeInUp" data-wow-delay="100ms">
                                        <input type="text" class="form-control" id="name" placeholder="Name">
                                    </div>
                                </div>
                                <div class="col-md-6 col-lg-4">
                                    <div class="form-group wow fadeInUp" data-wow-delay="200ms">
                                        <input type="email" class="form-control" id="email" placeholder="E-mail">
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="form-group wow fadeInUp" data-wow-delay="300ms">
                                        <input type="text" class="form-control" id="subject" placeholder="Subject">
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group wow fadeInUp" data-wow-delay="400ms">
                                        <textarea name="message" class="form-control" id="message" cols="30" rows="10" placeholder="Message"></textarea>
                                    </div>
                                </div>
                                <div class="col-12 text-center wow fadeInUp" data-wow-delay="500ms">
                                    <button class="btn oneMusic-btn mt-30" type="submit">Send <i class="fa fa-angle-double-right"></i></button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Contact Area End ##### -->

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

</html>