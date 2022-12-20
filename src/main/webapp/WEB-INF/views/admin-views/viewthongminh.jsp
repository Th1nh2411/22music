<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<base href="${pageContext.servletContext.contextPath}/">
<meta charset="utf-8">
<title>Insert title here</title>
<link href="css/style.min.css" rel="stylesheet">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="fonts/fontawesome-free-6.1.1-web/css/all.min.css" rel="stylesheet">
</head>

<body>
  
    <div class="preloader" style="display: none;">
        <div class="lds-ripple">
            <div class="lds-pos"></div>
            <div class="lds-pos"></div>
        </div>
    </div>
   
    <div id="main-wrapper" data-layout="vertical" data-navbarbg="skin5" data-sidebartype="full" data-sidebar-position="absolute" data-header-position="absolute" data-boxed-layout="full">

        <header class="topbar" data-navbarbg="skin6">
            <nav class="navbar top-navbar navbar-expand-md navbar-dark">
                <div class="navbar-header" data-logobg="skin6">
                  
                    <a class="navbar-brand ms-4" href="">
                     
                        <span class="logo-text" style="
    font-size: 32PX;
">
                          
                            
22MUSIC
                        </span>
                    </a>
                    
                    <a class="nav-toggler waves-effect waves-light text-white d-block d-md-none" href="javascript:void(0)"><i class="ti-menu ti-close"></i></a>
                </div>
               
                <div class="navbar-collapse collapse" id="navbarSupportedContent" data-navbarbg="skin5">
                    <ul class="navbar-nav d-lg-none d-md-block ">
                        <li class="nav-item">
                            <a class="nav-toggler nav-link waves-effect waves-light text-white " href="javascript:void(0)"><i class="ti-menu ti-close"></i></a>
                        </li>
                    </ul>
          
                    <ul class="navbar-nav me-auto mt-md-0 ">
                   
                        <!-- ============================================================== -->
                        <!-- Search -->
                        <!-- ============================================================== -->

                        <li class="nav-item search-box">
                            <a class="nav-link text-muted" href="javascript:void(0)"><i class="ti-search"></i></a>
                            <form class="app-search" style="display: none;">
                                <input type="text" class="form-control" placeholder="Search &amp; enter"> <a class="srh-btn"><i class="ti-close"></i></a> </form>
                        </li>
                    </ul>

                    <!-- ============================================================== -->
                    <!-- Right side toggle and nav items -->
                    <!-- ============================================================== -->
                    <ul class="navbar-nav">
                        <!-- ============================================================== -->
                        <!-- User profile and search -->
                        <!-- ============================================================== -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle text-muted waves-effect waves-dark" href="file:///D:/Download/Compressed/material-pro-lite-master/html/table-basic.html#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="fa-regular fa-udaser"></i>
                                Admin</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown"></ul>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <!-- ============================================================== -->
        <!-- End Topbar header -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <aside class="left-sidebar" data-sidebarbg="skin6">
            <!-- Sidebar scroll-->
            <div class="scroll-sidebar">
                <!-- Sidebar navigation-->
                <nav class="sidebar-nav">
                    <ul id="sidebarnav" class="in">
                        <!-- User Profile-->                        
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="admin/trangchu.htm" aria-expanded="false"><i class="mdi me-2 mdi-table"></i><span class="hide-menu">Bài hát</span></a></li>                                               
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="admin/thongtinUser.htm" aria-expanded="false"><i class="mdi me-2 mdi-account-settings-variant"></i><span class="hide-menu">Tài khoản</span></a>
                        </li>
                         <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link active" href="" aria-expanded="false"><i class="mdi me-2 mdi-help-circle"></i><span class="hide-menu">Thông minh</span></a>
                        </li>
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="logout.htm" aria-expanded="false"><i class="mdi me-2 mdi-help-circle"></i><span class="hide-menu">Đăng xuất</span></a>
                        </li>
                        
                    </ul>

                </nav>
                <!-- End Sidebar navigation -->
            </div>
            <!-- End Sidebar scroll-->
            <div class="sidebar-footer">
                
            </div>
        </aside>
        <!-- ============================================================== -->
        <!-- End Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Page wrapper  -->
        <!-- ============================================================== -->
        <div class="page-wrapper">
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="page-breadcrumb">
                <div class="row align-items-center">
                    <div class="col-md-6 col-8 align-self-center">
                        <h3 class="page-title mb-0 p-0">Train thông minh</h3>
                        <div class="d-flex align-items-center">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item">Home</li>
                                   <Li class="fa-solid fa-arrow-right-long" style = " margin-left: 5px; margin-right: 5px"></Li>                                  
                                    <li class="breadcrumb-item active" aria-current="page">Thông minh</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                    <div class="col-md-6 col-4 align-self-center">
                        
                    </div>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- End Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
                <div class="row">
                    <!-- column -->
                    <div class="col-sm-12">
                        <div class="card">
                            <div class="card-body">
                                <div style="
								    display: flex;
								    justify-content: space-between;
								    align-items: center;
								">
								    <h4 class="card-title">Đánh giá</h4>
								</div>
								${message}                 
                                <div class="table-responsive">
                                    <table class="table user-table">
                                        <tr>
                                               <th>
                                               ${message1}%.
                                               </th>
                                               </tr>
                                        
                                            <tr>                                          
                                                                                                                               
                                    </table>
                                </div>                            
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-body">
                                <div style="
								    display: flex;
								    justify-content: space-between;
								    align-items: center;
								">
								    <h4 class="card-title">Train</h4>
								</div>
								${message}                 
                                <div class="table-responsive">
                                    <table class="table user-table">
                                        
                                        
                                            <tr>                                          
                                            <th><a type="button" class="btn btn-secondary" href="admin/admin.htm">Đổ dữ liệu vào txt</a></th>
                                            
                                            <th> ${message2}</th>                                           
                                               </tr>
                                               <c:if test="${isStep1 == 0}">
	                                               <tr>
	                                                <th><a type="button" class="btn btn-secondary" href="admin/train.htm">Train data</a></th>
	                                                <th> ${message3}</th>
	                                               </tr>
                                               </c:if>
                                               <c:if test="${isStep2 == 0}">  
	                                               <tr>
	                                               <th><a type="button" class="btn btn-secondary" href="admin/getPred.htm">Lấy dữ liệu dự đoán</a></th>
	                                               <th> ${message4}</th>
	                                               </tr>   
                                               </c:if>                                                                                        
                                    </table>
                                </div>                            
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- End PAge Content -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Right sidebar -->
                <!-- ============================================================== -->
                <!-- .right-sidebar -->
                <!-- ============================================================== -->
                <!-- End Right sidebar -->
                <!-- ============================================================== -->
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
            
            <!-- ============================================================== -->
            <!-- End footer -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
    <script src="./songs_files/jquery.min.js.download"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="./songs_files/bootstrap.bundle.min.js.download"></script>
    <script src="./songs_files/app-style-switcher.js.download"></script>
    <!--Wave Effects -->
    <script src="./songs_files/waves.js.download"></script>
    <!--Menu sidebar -->
    <script src="./songs_files/sidebarmenu.js.download"></script>
    <!--Custom JavaScript -->
    <script src="./songs_files/custom.js.download"></script>
</body></html>