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
	<form:form action = "updatenhac.htm?id=${baihat.id}" modelAttribute ="baihat"  enctype = "multipart/form-data" method = "post">
	
	<div>
		<label>Tên Bài Hát</label>
		<form:input path = "ten" value = "${baihat.ten}"/>	
	</div>

	<!--  
	<div>
		<label>Ngày Phát Hành</label>
		<input type ="date" name = "date" value = "02/02/2017"/>	
	</div>
	-->
	<div>
		<label>Yêu Thích</label>
		<form:input type="number" path ="yeuthich"  value = "${baihat.yeuthich}"/>	
	</div>
	<div>
		<lable>Album</lable>
		<select id = "IdAlbum" name ="IdAlbum" value = "${baihat.album.id}">
			<c:forEach var = "u" items ="${album}">
				<option value ="${u.id}">${u.ten}</option>
			</c:forEach>
		</select>
	</div>
	
	<div>
	<label>Thể Loại</label>
		<select id = "theloai" name ="theloai" value = "NhacTre">
			
				<option value ="NhacTre">Nhạc Trẻ</option>
				<option value ="Bolero">Nhạc Bolero</option>
				<option value ="Rap">Rap</option>
				<option value ="US-UK">Nhạc US-UK</option>
				<option value ="NhacHoa">Nhạc Hoa</option>
				<option value ="Latin">Nhạc Latin</option>
				<option value ="Korean">Nhạc Hàn</option>
				<option value ="Khac">Thể Loại Khác</option>
			
		</select>
	</div>
	
		<div>
	<label>Quốc Gia</label>
		<select id = "quocgia" name ="quocgia" value = "${baihat.quocgia}">
			
				<option value ="VN">Việt Nam</option>
				<option value ="ChauA">Nhạc Bolero</option>
				<option value ="MyLatin">Rap</option>
				<option value ="US-UK">Nhạc US-UK</option>
				<option value ="NhacHoa">Nhạc Hoa</option>
				<option value ="Korean">Nhạc Hàn</option>
				<option value ="Khac">Thể Loại Khác</option>
			
		</select>
	</div>

	<div>
		<label>Nhạc Sĩ</label>
		<form:input  path = "nhacsi" value = "${baihat.nhacsi}"/>	
	</div>
	<div>
		<label>Ca Sĩ</label>
		<form:input path = "casi" value = "${baihat.casi}"/>	
	</div>
	
		
	
	<div>
		<label>File Hình Ảnh</label>
		<input type = "file" name = "fileimagecore" src ="${baihat.imagecore}" >
	</div>
	<div>
		<label>File Âm Thanh</label>
		<input type = "file" name = "fileaudio" src = "${baihat.audio}">
	</div>
	<div>
		<label>Lời Bài Hát</label>
		<textarea name ="lyrics" value = "${baihat.lyrics}">
		</textarea>
	</div>
	
	<div>
		<button class = "btn btn-default">Cập Nhật</button>
	</div>
	
	
	</form:form>
	<div>
		<button class="btn btn-default"><a href="#">Nhập lại</a></button>
		<button class="btn btn-default"><a href="listnhac.htm">Thoát</a></button>
	</div>
</body>
</html>