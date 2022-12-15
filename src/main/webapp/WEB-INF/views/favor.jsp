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
    <!-- ##### Featured Artist Area Start ##### -->
	<section
		class="featured-artist-area section-padding-100 bg-img bg-overlay bg-fixed"
		style="background-image: url(img/bg-img/bg-4.jpg);">
		<div class="tag-container container ">
			<!-- <div class="row align-items-end">
				<div class="col-12 col-md-12 col-lg-12">
				</div>
			</div> -->
		
			<div class="row gradiant-bg align-items-end">
				<div class="col-12 col-md-12 col-lg-12">
					<div class="featured-artist-content">
						<!-- Section Heading -->
						<div class="section-heading white ">
							<h2>Bài hát bạn yêu thích</h2>
							<p>22Music sẽ mang đến cho bạn những bài hát mới nhất trên
							khắp thế giới trong từng giây.</p>
						</div>
					</div>
						
			<div class="list-song row">

			<c:if test="${blank == false}">
				<c:forEach var="userFavor" items="${userFavor}">
					<!-- Single Album Area -->
					<div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-30 wow fadeInUp" data-wow-delay="100ms">
					
						<a href="Nhac/${userFavor.id}/0.htm" class="single-album-area " >
							<div class="album-thumb" style="background: url(${userFavor.image}) center /cover no-repeat"></div>
							<div class="opacity"></div>
							<div class="playbutton">
								<i class="fa fa-play-circle"></i>
							</div>
							</a>
						<div class="album-info white">

							<h5>${userFavor.songName}</h5>
							<p>${userFavor.performer}</p>
						</div>
						
					</div>
				</c:forEach>
			</c:if>
			<c:if test="${blank == true}">
				<p>Bạn chưa thêm bài hát yêu thích nào </p>
			</c:if>
			</div>
						
					
				</div>
			</div>
		</div>
	</section>
	<!-- ##### Featured Artist Area End ##### -->

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