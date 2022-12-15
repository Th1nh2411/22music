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
	<%@include file="/WEB-INF/include/header.jsp"%>
	<!-- ##### Header Area End ##### -->

    <!-- ##### Breadcumb Area Start ##### -->
    <section class="breadcumb-area bg-img bg-overlay" style="background-image: url(img/bg-img/breadcumb3.jpg);">
            
            
            <div class="user-content container">
            			<p>22MUSIC</p>
                        <h3>Đăng kí</h3>
                        
                        <!-- Login Form -->
                     
                            <form:form action="action.htm" modelAttribute="User">
                            <div class="form-group">
                            	
													
                                    
                                </div>
                                <div class="form-group">
                            	<label for="name">Tên người dùng</label>
                                    <form:input path="name" type="text"
														class="form-control" id="name"
														placeholder="Nhập tên người dùng" />
													
                                    
                                </div>
                                <div class="form-group">
                            	<label for="gender">Giới tính</label>
                            			<form:select path="gender" class="form-select">
											<form:option value="0" label="Nam" />
											<form:option value="1" label="Nữ" />
										</form:select>
                            	
	                                    <%-- <div class="form-check form-check-inline">
										  <form:radiobutton class="form-check-input"  name="male" id="male" value="0" path="gender"/>
										  <label class="form-check-label" for="male">Nam</label>
										</div>
										<div class="form-check form-check-inline">
										  <form:radiobutton class="form-check-input" name="female" id="female" value="1" path="gender" />
										  <label class="form-check-label" for=female>Nữ</label>
										</div> --%>
													
                                    
                                </div>
                                <div class="form-group">
                            	<label for="email">Email</label>
                                    <form:input path="email" type="email"
														class="form-control" id="email"
														placeholder="Nhập email" />
													
                                    
                                </div>
                                
                                <div class="form-group">
												<div class="user-confirmArea">
													
													<button
														class="btn btn-primary "
														type="submit">
														Bắt đầu <i class="fas fa-sign-in-alt ms-1"></i>
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