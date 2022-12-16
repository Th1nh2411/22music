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
    <title>Đăng kí | 22Music</title>

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
    <section class="reg-bg breadcumb-area bg-img bg-overlay" style="background-image: url(img/bg-img/breadcumb3.jpg);">
            
            
            <div class="user-content container">
            			<p>22MUSIC</p>
                        <h3>Đăng kí</h3>
                        
                        <!-- Login Form -->
                     
                            <form:form id="reg-form" action="register.htm"  modelAttribute="user">
                            <div class="form-group">
                            	<label for="username">Tên đăng
													nhập</label>
                                    <input name="username" type="text"
														class="form-control" id="username"
														placeholder="Nhập tên đăng nhập" />
													
                                 <div class="form-message"></div>   
                                </div>
                                <div class="form-group">
                                <label for="password">Mật khẩu</label>
                                <input name="pass" type="password"
														class="form-control" id="password"
														placeholder="Nhập mật khẩu" />
                                 <div class="form-message"></div>  
                                </div>
                                <div class="form-group">
                                <label for="passwordCF">Xác nhận mật khẩu</label>
                                <input name="passwordCF" type="password"
														class="form-control" id="passwordCF"
														placeholder="Nhập mật khẩu" />
								<div class="form-message"></div>
                                   
                                </div>
                                <div class="form-group d-flex justify-content-between align-items-center">
	                                <div class="user-name">
	                                	<label for="name">Tên người dùng</label>
		                                <form:input path="name" type="text" name ="name"
																class="form-control" id="name"
																placeholder="Tên người dùng" />
										<div class="form-message"></div>
	                                </div>
				                    <div class="gender-group">
										
											
												<form:radiobutton class="gender-radio" path="gender" value="0" label="Nam" />
												<form:radiobutton class="gender-radio" path="gender" value="1" label="Nữ" />
											
										
									</div>
                                   
                                </div>
                                <div class="form-group">
	                              	<label for="email">Email</label>
	                                <form:input path="mail" type="text" name ="email"
															class="form-control" id="email"
															placeholder="Nhập email" />
                                   <div class="form-message"></div>
                                </div>
                                <div class="form-group">
												<div class="user-confirmArea">
													
													<a href="login.htm">Đã có tài khoản?</a>
													<button
														class="btn btn-primary "
														type="submit">
														Đăng kí <i class="fas fa-sign-in-alt ms-1"></i>
													</button>
												</div>
												<!--end col-->
											</div>
                            </form:form>
                            <div>${message}</div>
                            
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
	<script src="js/validator.js"></script>
    <!-- ##### All Javascript Script ##### -->
    <script>
	    const regValidate = new Validator({
	      form: '#reg-form',
	      formGroupSelector: '.form-group',
	      errorSelector: '.form-message',
	      rules: [
	        Validator.isRequired('#email', 'Vui lòng nhập email'),
	        Validator.isEmail('#email'),
	        Validator.minLength('input[name="pass"]', 6, "Mật khẩu phải tối thiểu 6 kí tự"),
	        Validator.isRequired('#name', "Vui lòng nhập tên người dùng"),
	        Validator.isRequired('input[name="passwordCF"]', "Vui lòng xác nhận mật khẩu"),
	        Validator.isRequired('input[name="username"]', "Vui lòng nhập tên đăng nhập"),
	        Validator.isConfirmed('input[name="passwordCF"]', function () {
	          return document.querySelector('input[name="pass"]').value
	        }, "Mật khẩu nhập lại không chính xác")
	      ],
	    })
	    regValidate.main();
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