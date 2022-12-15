<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Spring MVC</title>
</head>
<body>
 	<div>${message}</div>
	<form:form action = "insertalbum.htm" modelAttribute ="album"  enctype = "multipart/form-data" method = "post">
	
	<div>
		<label>Tên Album</label>
		<form:input path = "ten" value = "${album.ten}"/>	
	</div>
	
	<!--  
	<div>
		<label>Ngày Phát Hành</label>
		<input type ="date" name = "date" value = "02/02/2017"/>	
	</div>
	-->
	<div>
		<label>Yêu Thích</label>
		<form:input type="number" path ="yeuthich"  value = "${album.yeuthich}"/>	
	</div>

	

	



	
		
	
	<div>
		<label>File Hình Ảnh</label>
		<input type = "file" name = "fileimagecore" src ="D:/LapTrinh/Web/Web_NgheNhac/WebContent/${baihat.imagecore}" >
	</div>


	
	<div>
		<button class = "btn btn-default">Thêm</button>
	</div>
	</form:form>
	<div>
		<button class="btn btn-default"><a href="#">Nhập lại</a></button>
		<button class="btn btn-default"><a href="listalbum.htm">Thoát</a></button>
	</div>
</body>
</html>