<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
    <title>Đăng nhập | 22Music</title>

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
	<%@include file="/WEB-INF/include/header.jsp"%>
	<!-- ##### Header Area End ##### -->

    <!-- ##### Breadcumb Area Start ##### -->
    <section class="breadcumb-area bg-img bg-overlay" style="background-image: url(img/bg-img/breadcumb3.jpg);">
            
            
            <div class="user-content container">
            			<p>22MUSIC</p>
                        <h3>Đăng nhập</h3>
                        
                        <!-- Login Form -->
                     
                            <form:form id="login-form" action="action.htm" modelAttribute="account">
                            <div class="form-group">
                            	<label for="username">Tên đăng
													nhập</label>
                                    <form:input path="name" type="text"
														class="form-control" id="username"
														placeholder="Nhập tên đăng nhập" />
									<div class="form-message"></div>				
                                    
                                </div>
                                <div class="form-group">
                                <label for="userpassword">Mật khẩu</label>
                                <form:input path="pass" type="password"
														class="form-control" id="userpassword"
														placeholder="Nhập mật khẩu" />
                                   <div class="form-message"></div>
                                </div>
                                <div class="error-message">${message}</div>
                                <div class="form-group">
												<div class="user-confirmArea">
													
													<a href="register.htm">Tạo tài khoản?</a>
													<button
														class="btn btn-primary "
														type="submit">
														Đăng Nhập <i class="fas fa-sign-in-alt ms-1"></i>
													</button>
												</div>
												<!--end col-->
											</div>
                            </form:form>
                            
                    </div>
            </div>
        </div>
        </div>
    </section>
    <!-- ##### Breadcumb Area End ##### -->

    <!-- ##### Login Area Start ##### -->
        
    <!-- ##### Login Area End ##### -->

    <!-- ##### Footer Area Start ##### -->
    <%@include file="/WEB-INF/include/footer.jsp"%>
    <!-- ##### Footer Area Start ##### -->

    <!-- ##### All Javascript Script ##### -->
    <script src="js/validator.js"></script>
    <!-- ##### All Javascript Script ##### -->
    <script>
	    const loginValidate = new Validator({
	      form: '#login-form',
	      formGroupSelector: '.form-group',
	      errorSelector: '.form-message',
	      rules: [
	        
	        Validator.isRequired('#username', "Vui lòng nhập tên đăng nhập"),
	        Validator.isRequired('#userpassword', "Vui lòng nhập mật khẩu"),
	       
	      ],
	    })
	    loginValidate.main();
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