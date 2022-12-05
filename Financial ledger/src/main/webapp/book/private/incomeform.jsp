<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/book/private/incomeform.jsp</title>
</head>
<body>
	<form action="income.jsp" method="post">
		<div>
			<label for="income">수입</label>
			<input type="text" name="income" id="income"/>
		</div>
		<div>
			<label for="contents">내용</label>
			<input type="text" name="contents" id="contents"/>
		</div>
		<button type="submit">수입 추가</button>
	</form>
</body>
</html>