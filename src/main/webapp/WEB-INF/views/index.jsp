<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!-- Title -->
<title>22Music - Modern Music</title>
<!-- Favicon -->
<link rel="icon" href="img/core-img/favicon.ico">
<base href="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/"/>
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
	<%@include file="/WEB-INF/include/header.jsp"%>
	<!-- ##### Header Area End ##### -->

	<!-- ##### Hero Area Start ##### -->
	<section class="hero-area">
		<div class="hero-slides owl-carousel">
			<!-- Single Hero Slide -->
			<div
				class="single-hero-slide d-flex align-items-center justify-content-center">
				<!-- Slide Img -->
				<div class="slide-img bg-img"
					style="background-image: url(img/bg-img/christmas.jpg);"></div>
				<!-- Slide Content -->
				<div class="container">
					<div class="row">
						<div class="col-12">
							<div class="hero-slides-content text-center">
								<h6 data-animation="fadeInUp" data-delay="100ms">Bài hát thịnh hành hiện nay</h6>
								<h2 data-animation="fadeInUp" data-delay="300ms">
									All i want for christmas is you <span>All i want for christmas is you</span>
								</h2>
								<a data-animation="fadeInUp" data-delay="500ms" href="#"
									class="btn oneMusic-btn mt-50">Khám phá<i
									class="fa fa-angle-double-right"></i></a>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Single Hero Slide -->
			<div
				class="single-hero-slide d-flex align-items-center justify-content-center">
				<!-- Slide Img -->
				<div class="slide-img bg-img"
					style="background-image: url(img/bg-img/bg-2.jpg);"></div>
				<!-- Slide Content -->
				<div class="container">
					<div class="row">
						<div class="col-12">
							<div class="hero-slides-content text-center">
								<h6 data-animation="fadeInUp" data-delay="100ms">Bài hát mới nhất hiện nay</h6>
								<h2 data-animation="fadeInUp" data-delay="300ms">
									Left and Right<span>Left and Right</span>
								</h2>
								<a data-animation="fadeInUp" data-delay="500ms" href="#"
									class="btn oneMusic-btn mt-50">Khám phá<i
									class="fa fa-angle-double-right"></i></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- ##### Hero Area End ##### -->


	<!-- ##### Buy Now Area Start ##### -->
	<section
		class="home__newSong-section ">
		<div class="container-fluid">
			<div class="row">
				<div class="col-12">
					<div class="section-heading style-2">
						<p>See what’s new</p>
						<h2>Các bài hát mới nhất</h2>
					</div>
				</div>
			</div>

			<div class="row">


				<c:forEach var="newSongs" items="${newsongs}">
					<!-- Single Album Area -->

					<div class="col-12 col-sm-6 col-md-4 col-lg-2 wow fadeInUp" data-wow-delay="100ms">
					
						<a href="Nhac/${newSongs.id}/0.htm" class="single-album-area " >
							<div class="album-thumb" style="background: url(${newSongs.image}) center /cover no-repeat"></div>
							<div class="opacity"></div>
							<div class="playbutton">
								<i class="fa fa-play-circle"></i>
							</div>
							</a>
						<div class="album-info">
							<a href="Nhac/${newSongs.id}/0.htm">
								<h5>${newSongs.songName}</h5>
							</a>
							<p>${newSongs.performer}</p>

						</div>
						
					</div>
				</c:forEach>


			</div>


		</div>



	</section>
	<!-- ##### Buy Now Area End ##### -->

	<!-- ##### Footer Area Start ##### -->
	<%@include file="/WEB-INF/include/footer.jsp"%>
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