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
                                  <style type="text/css"> 
table, th, td {  
border : red;
    border-collapse: collapse;
}
</style>
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
                    <form action ="timkiem.htm">
							<div class="navbar-collapse collapse" id="navbarSupportedContent" data-navbarbg="skin5">
							<button>
									<i class="fa-solid fa-magnifying-glass"></i>
								</button>	
								<input type="text" name="timkiem" class="headerbelow__navbar-input"
									placeholder="Tìm kiếm...">
							</div>							
							</form>
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
                            <i class="fa-regular fa-user"></i>
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
                        <li class="sidebar-item selected"> <a class="sidebar-link waves-effect waves-dark sidebar-link active" href="admin/trangchu.htm" aria-expanded="false"><i class="mdi me-2 mdi-table"></i><span class="hide-menu">Bài hát</span></a></li>                                               
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="admin/thongtinUser.htm" aria-expanded="false"><i class="mdi me-2 mdi-account-settings-variant"></i><span class="hide-menu">Tài khoản</span></a>
                        </li>
                         <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="" aria-expanded="false"><i class="mdi me-2 mdi-help-circle"></i><span class="hide-menu">Thông minh</span></a>
                        </li>
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="" aria-expanded="false"><i class="mdi me-2 mdi-help-circle"></i><span class="hide-menu">Đăng xuất</span></a>
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
                        <h3 class="page-title mb-0 p-0">Sửa bài hát</h3>
                        <div class="d-flex align-items-center">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item">Home</li>
                                   <Li class="fa-solid fa-arrow-right-long" style = " margin-left: 5px; margin-right: 5px"></Li>                                  
                                    <li class="breadcrumb-item active" aria-current="page">Sửa bài hát</li>
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
                               
                              <form:form action="admin/suasong/${id}.htm" modelAttribute="suabaihat" class='signform'>
		<table  border="1" width="600px" height = "450px">
			<tr>
			
			<th><label>Tên bài hát</label></th>
			<th><form:input path="songName" placeholder="${suabaihat.songName}"/></th>
			<th><form:errors path="songName" style = "color : red;"/></th>
		</tr>
		
		<tr>
		<th><label>Ngày phát hành</label></th>
			<th><form:input path="date" placeholder="${ suabaihat.date}"/></th>
			<th><form:errors path="date" style = "color : red;"/></th>
			</tr>
			<tr></tr>
			<tr>
			<th><label>Thể loại</label></th>
			<th>
			<form:select path ="tag" placeholder="${suabaihat.tag}">
			<option value = "pop">
			nhạc pop
			</option>
			<option value = "bolero">
			nhạc bolero
			</option>
			<option value = "rap">
			nhạc rap
			</option>
			<option value = "US-Uk">
			nhạc US-UK
			</option>
			<option value = "EDM">
			nhạc EDM
			</option>
			<option value = "kpop">
			nhạc Kpop
			</option>
			</form:select>
</th>
			<th><form:errors path="tag" style = "color : red;"/></th>
			</tr>
			<tr></tr>
			<tr>
			<th><label>Ảnh phát</label></th>
			<th><form:input path="image" placeholder="${ suabaihat.image}"/></th>
			<th><form:errors path="image" style = "color : red;"/></th>
			</tr>
			<tr></tr>
			<tr>
			<th><label>bài hát</label></th>
			<th><form:input path="audio"/></th>
			<th><form:errors path="audio" style = "color : red;"/></th>
			</tr>
			<tr></tr>
			<tr>
			<th><label>Lời bài hát</label></th>
			<th><form:input path="lyric"/></th>
			<th><form:errors path="lyric" style = "color : red;"/></th>
			</tr>
			<tr></tr>
			<tr>
			<th><label>Người sáng tác</label></th>
			<th><form:input path="author" placeholder="${ suabaihat.author}"/></th>
			<th><form:errors path="author" style = "color : red;"/></th>
			</tr>
			<tr></tr>
			<tr>
			<th><label>Người thể hiện</label></th>
			<th><form:input path="performer" placeholder="${ suabaihat.performer}"/></th>
			<th><form:errors path="performer" style = "color : red;"/></th>
				</tr>
				<tr></tr>
			<tr><th><button>sửa bài hát</button></th></tr>
			</table>
		
	</form:form>         
                                      
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