<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/insertform.jsp</title>
</head>
<body>
	<div class="container">
		<h1>할일 추가 양식</h1>
		<form action="insert.jsp" method="post">
			<div>
				<label for="content">할일</label>
				<input type="text" name="content" id="content"/>
			</div>
			<button type="submit">추가</button>
		</form>
	</div>
</body>
</html>