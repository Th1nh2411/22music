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
    <title>${songById.songName} | 22Music</title>
	
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
	

<base href="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/"/>
	<header class="header-area">
		<!-- Navbar Area -->
		<div class="oneMusic-main-menu">
			<div class="classy-nav-container breakpoint-off">
				<div class="container">
					<!-- Menu -->
					<nav class="classy-navbar justify-content-between" id="oneMusicNav">

						<!-- Nav brand -->
						<a href="index/" class="brand">22MUSIC</a>

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
									<li><a id="home" href="index/ ">Trang Chủ</a></li>
									<li><a href="#">Thể Loại<i></i></a>
										<ul class="dropdown">
											<li><a href="tag/Pop/">Nhạc Pop</a></li>
											<li><a href="tag/Bolero/">Nhạc Bolero</a></li>
											<li><a href="tag/Rap/">Nhạc Rap</a></li>
											<li><a href="tag/US-UK/">Nhạc US-UK</a></li>
											<li><a href="tag/EDM/">Nhạc EDM</a></li>
											<li><a href="tag/Korean/">Nhạc Hàn</a></li>
											
										</ul></li>

									<li><a id="recommend" href="tag/recommend/">Đề xuất</a>
										</li>
									<c:if test="${isLogin == true}">
										<li><a id="favor" href="favor/">Yêu thích</a>
										</li>
									</c:if>
									<c:if test="${isLogin == false}">
										<li><a id="favor" href="login.htm">Yêu thích</a>
										</li>
									</c:if>
									<li class = "search-nav">
										<form id="search" action="search/">
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
											</span> <a name="btnRegister" href="logout.htm" id="registerBtn">Đăng
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
	<!-- ##### Header Area End ##### -->
    <!-- ##### Featured Artist Area Start ##### -->
	<section
		class="featured-artist-area section-padding-100 bg-img bg-overlay bg-fixed"
		style="background-image: url(img/bg-img/bg-4.jpg);">
		<div class="container song-container">
			<!-- <div class="row align-items-end">
				<div class="col-12 col-md-12 col-lg-12">
				</div>
			</div> -->
		
			<div class="row align-items-start">
				<div class="col-12 col-md-7 col-lg-7">
					
						
							<!-- Section Heading -->
					<div class="song-play-area mt-30">
						<div class="song-name-area text-center">
							<h5>Now playing:</h5>
							<p>${songById.songName}</p>
						</div>
						<div class="featured-artist-thumb" style="background: url(${songById.image}) left center /cover no-repeat;"></div>
						<div class="song-options">
							<div onclick="switchStatusRepeat()" class="song-repeat">
								<i class="fa fa-rotate-right"></i>
								<div class="button-title">Lặp lại</div>
							</div>
							<div onclick="switchStatusAutoForward()" class="song-autoforward active" >
								<i class="fa fa-step-forward"></i>
								<div class="button-title">Tự động phát</div>
							</div>
						</div>
						<audio    onpause="cdPause()" onplay="cdPlay()" id="audio" preload="auto" controls="true">
							<source src="${songById.audio}">
						</audio>
						<c:if test="${isLogin == true}">
							
								<div onclick="switchStatusFavor()" class="favor-song">
									<i class="fa fa-heart-o"></i>
									<div class="button-title">Yêu thích</div>
								</div>
							
							
								<div onclick="switchStatusFavor()" hidden class="favor-song--active">
									<i class="fa fa-heart"></i>
									<div class="button-title">Bỏ yêu thích</div>
								</div>	
							
						</c:if>
						<c:if test="${isLogin == false}">
							
								<a href="login.htm">
									<div onclick="switchStatusFavor()" class="favor-song">
										<i class="fa fa-heart-o"></i>
										<div class="button-title">Yêu thích</div>
									</div>

								</a>	
							
						</c:if>
						
					</div>
					
					<div class="song-info-area">
						<div class="song-info__title">
							<h3>Lời bài hát: ${songById.songName}</h3>
							<p>Nhạc sĩ: ${songById.author}</p>
							<p>Ca sĩ thể hiện: ${songById.performer}</p>
						</div>
						<div class="song-info__lyrics">
							 <pre>${songById.lyric}</pre>
						</div>
					</div>
						
				
					
				</div>
						
						
					
				
				<div class="col-0 col-md-5 col-lg-5">
					<div class="suggest-container">
						
						<div class="suggest-title">Mọi người cũng nghe</div>
						<c:forEach var="suggestSongs" items="${suggestSongs}">
							<a class="song-item" href="Nhac/${suggestSongs.id}/1/" >
		               		<div class="song-info ">
	                 			<div class="song__thumb" style="background: url(${suggestSongs.image}) center /cover no-repeat"></div>
	               				<div class="song__body">
	                 				<h3 class="song-title">${suggestSongs.songName}</h3>
	                 				<p class="song-author">${suggestSongs.performer}</p>
	               				</div>
		               		</div>
		
		               		<div class="song__option">
		                 			<i class="fa fa-play-circle"></i>
		               		</div>
		              		</a>
              			</c:forEach>
					
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
    
    <!-- CD Rotate & getnumAudioCurrent  -->
    <script type="text/javascript">
	    const $ = document.querySelector.bind(document);
		const $$ = document.querySelectorAll.bind(document);
    	
		const favorIcon = $(".favor-song");
    	const favorIconActive = $(".favor-song--active");
    	
    	const cd = $(".featured-artist-thumb");
    	const songAudio = $("#audio");
    	const logoHref = $(".brand").href;
    	const homeHref = $("#home").href;
    	const recommendHref = $("#recommend").href;
    	const favorHref = $("#favor").href;
    	const searchHref = $("#search").action;
    	const tagHrefs = $$(".dropdown a");
    	const songHrefs = $$(".song-item");
    	const favorNumAddHref = "${songById.id}/"+40+"/${isPre}.htm";
    	
    	var defautSongHref ;
    	var defautTagHref;
    	var currentTime;
    	
    	var seconds = 0;
    	var isPlay = false;
    	var isFavor = ${isFavor};
    	var isUpdateHref = false;
    	
    	
    	
    	//Set giá trị ban đầu cho href 1 item
    	
    	//Nếu bài hát này đã được yêu thích
    	if (isFavor){
    		favorIconActive.hidden = false;
			favorIcon.hidden = true;
			$(".brand").href = logoHref + favorNumAddHref;
			$("#home").href = homeHref + favorNumAddHref;
	    	$("#recommend").href = recommendHref + favorNumAddHref;
	    	<c:if test="${isLogin == true}">
	    		$("#favor").href = favorHref + favorNumAddHref;
			</c:if>
	    	
	    	$("#search").action = searchHref + favorNumAddHref;
	    	Array.from(tagHrefs).forEach(function(item){
        		defautTagHref = item.href;
    			item.href = defautTagHref + favorNumAddHref;
    			
    		});
        	//Set giá trị ban đầu cho songs list href
        	Array.from(songHrefs).forEach(function(item){
        		defautSongHref = item.href;
    			item.href = defautSongHref + favorNumAddHref;
    			
    		});
	    	
    	}
    	
    	//Nếu bài hát này chưa được yêu thích
    	else{
    		$(".brand").href = logoHref + "${songById.id}/"+0+"/${isPre}.htm";
    		$("#home").href = homeHref + "${songById.id}/"+0+"/${isPre}.htm";
        	$("#recommend").href = recommendHref + "${songById.id}/"+0+"/${isPre}.htm";
        	<c:if test="${isLogin == true}">
        		$("#favor").href = favorHref + "${songById.id}/"+0+"/${isPre}.htm";
			</c:if>
        	
        	$("#search").action = searchHref + "${songById.id}/"+0+"/${isPre}.htm";
        	Array.from(tagHrefs).forEach(function(item){
        		defautTagHref = item.href;
				item.href = defautTagHref + "${songById.id}/"+seconds+"/${isPre}.htm";
				
			});
	    	Array.from(songHrefs).forEach(function(item){
	    		defautSongHref = item.href;
				item.href = defautSongHref + "${songById.id}/"+seconds+"/${isPre}.htm";
				
			});
        	//Set giá trị ban đầu cho list các taghrefs
        	
    	}
		
		function switchStatusFavor(){
    		
    		if (!isFavor){
    			$(".brand").href = logoHref + favorNumAddHref;
    			$("#home").href = homeHref + favorNumAddHref;
    	    	$("#recommend").href = recommendHref + favorNumAddHref;
    	    	<c:if test="${isLogin == true}">
    	    		$("#favor").href = favorHref + favorNumAddHref;
				</c:if>
    	    	
    	    	$("#search").action = searchHref + favorNumAddHref;
    	    	Array.from(tagHrefs).forEach(function(item){
    				item.href = defautTagHref + favorNumAddHref;
    				
    			});
    	    	Array.from(songHrefs).forEach(function(item){
    				item.href = defautSongHref + favorNumAddHref;
    				
    			});
    	    	isUpdateHref = false;
    			favorIconActive.hidden = false;
    			favorIcon.hidden = true;
    		} 
    		else {
    			$(".brand").href = logoHref + "${songById.id}/"+seconds+"/${isPre}.htm";
    			$("#home").href = homeHref + "${songById.id}/"+seconds+"/${isPre}.htm";
    	    	$("#recommend").href = recommendHref + "${songById.id}/"+seconds+"/${isPre}.htm";
    	    	<c:if test="${isLogin == true}">
    	    		$("#favor").href = favorHref + "${songById.id}/"+seconds+"/${isPre}.htm";
				</c:if>
    	    	
    	    	$("#search").action = searchHref + "${songById.id}/"+seconds+"/${isPre}.htm";
    	    	Array.from(tagHrefs).forEach(function(item){
    				item.href = defautTagHref + "${songById.id}/"+seconds+"/${isPre}.htm";
    				
    			});
    	    	Array.from(songHrefs).forEach(function(item){
    				item.href = defautSongHref + "${songById.id}/"+seconds+"/${isPre}.htm";
    				
    			});
    	    	isUpdateHref = true;
    			favorIconActive.hidden = true;
    			favorIcon.hidden = false;
    		}
    		isFavor = !isFavor;
    	}
		//Set vòng lặp sau 1 giây thì seconds tăng 1 và gán nó vào href
    	setInterval(function() {
        	if(isPlay){
            	seconds++;
            	if (isUpdateHref){
	            	const updateLogoHref = logoHref + "${songById.id}/"+seconds+"/${isPre}.htm";
	        		$(".brand").href = updateLogoHref;
	        		
	        		const updateHomeHref = homeHref + "${songById.id}/"+seconds+"/${isPre}.htm";
	        		$("#home").href = updateHomeHref;	
	        		
	        		const updateRecommendHref = recommendHref + "${songById.id}/"+seconds+"/${isPre}.htm";
	        		$("#recommend").href = updateRecommendHref;
	        		<c:if test="${isLogin == true}">
	        			const updateFavorHref = favorHref + "${songById.id}/"+seconds+"/${isPre}.htm";
	        			$("#favor").href = updateFavorHref;
					</c:if>
	        		
	        		
	        		const updateSearchHref = searchHref + "${songById.id}/"+seconds+"/${isPre}.htm";
	        		$("#search").action = updateSearchHref;

            	}
        	}
        		
        }, 1000 );
    	
		
    	//Duyệt từng phần từ href sau 1 giây thì gán seconds đã tăng ở trên vào các href
		Array.from(songHrefs).forEach(function(item){
			
			setInterval(function() {

	        	if(isUpdateHref){
	        		item.href = defautSongHref + "${songById.id}/"+seconds+"/${isPre}.htm";
	        	}
	        		
	        }, 1000);
		});
    	
		
		//Duyệt từng phần từ href sau 1 giây thì gán seconds đã tăng ở trên vào các href
		Array.from(tagHrefs).forEach(function(item){
			
			setInterval(function() {

	        	if(isUpdateHref){
	        		item.href = defautTagHref + "${songById.id}/"+seconds+"/${isPre}.htm";
	        	}
	        		
	        }, 1000);
		});

    	//Animation đĩa xoay
        const cdAnimate = cd.animate(
          [
            {
              transform: "rotate(360deg)",
            },
          ],
          {
            duration: 10000, // 10 second
            iterations: Infinity,
          }
        );
    	//set đĩa ban đầu dừng
        cdAnimate.pause();
        
        //hàm đĩa xoay, lúc đĩa xoay => nhạc đang play => gán isPlay = true
        function cdPlay() {
        	cdAnimate.play();
        	isPlay = true;
        	if (!isFavor){
        		isUpdateHref = true;
        	}
          };
        //hàm đĩa dừng, lúc đĩa dừng => nhạc đang pause => gán isPlay = false
        function cdPause() {
            cdAnimate.pause();
            
            isPlay = false;
          }; 
        songAudio.play();//set nhạc bật mỗi khi vào trang
        const repeatBtn = $(".song-repeat");
        const AutoBtn = $(".song-autoforward");
        var isAuto = true;
        var isRepeat = false;
       	function switchStatusAutoForward(){
       		isAuto = !isAuto;
       		AutoBtn.classList.toggle("active", isAuto);
       	}
       	function switchStatusRepeat(){
       		isRepeat = !isRepeat;
       		repeatBtn.classList.toggle("active", isRepeat);
       	}
       	songAudio.onended = function(){
       		if (isRepeat) {
                songAudio.play();
            }else if (isAuto){
            	songHrefs[1].click();
            }
       	}
    </script>
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