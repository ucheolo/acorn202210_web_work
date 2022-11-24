<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="one"></div>
	<script>
		let data = {imagePath:"/image"};
		
		let img1 = '<img src="/Step04_Final/images/kim1.png">';
		let img2 = '<img src="/Step04_Final' + data.imagePath + '">';
		let img3 = `<img src="/Step04_Final${data.imagePath}">`;
	</script>
</body>
</html>