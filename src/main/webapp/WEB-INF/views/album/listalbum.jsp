<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>


<!DOCTYPE html>
<html lang="en">

<head>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!-- Title -->
<title>One Music - Modern Music HTML5 Template</title>

<!-- Favicon -->
<link rel="icon" href="img/core-img/favicon.ico">

<!-- Stylesheet -->


<style type="text/css">
table {
	
}

th, td {
	border: 2px solid black;
}
</style>
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
						<a href="listNhac.htm" class="nav-brand"><img
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
									<li><a href="listnhac.htm">Nhạc</a></li>
									<li><a href="listalbum.htm">Albums</a></li>
									
								</ul>

								<!-- Login/Register & Cart Button -->
								<div
									class="login-register-cart-button d-flex align-items-center">


									<c:if test="${login == true}">
										<!-- Login/Register -->
										<div class="login-register-btn mr-20">

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
	<!-- Tìm kiếm -->
	<br>
	<br>
	<br>
	<br>
	<br>
	<form action="timkiemlistalbum.htm">
		<input type="text" name="name" value=""> <input
			type="submit" value="Tìm Kiếm">
	</form>

	<!-- hiển thị bản -->
	<div>${message}</div>
	<table class="table table-hover">
		<tr>
			
			<th>Image</th>
			<th>Tên Album</th>
			<th>Ngày PH</th>
			<th>Yêu Thích</th>
			
			<th><a href="insertalbum.htm">Insert</a></th>
			
		</tr>
		<c:forEach var="u" items="${album}">
			<tr>
				<td><img alt="Album đã xóa" src="${u.imagecore}"></td>
				<td>${u.ten}</td>
				<td><fmt:formatDate type="date" value="${u.ngayph}" pattern ="dd/MM/yyyy" /></td>
				<td>${u.yeuthich}</td>
				
				
				
				
				
				<td><a href="updatealbum.htm?id=${u.id}">update</a></td>
				<th><a href ="deletealbum.htm?id=${u.id}">Xóa</a></th>
			</tr>
		</c:forEach>
	</table>






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