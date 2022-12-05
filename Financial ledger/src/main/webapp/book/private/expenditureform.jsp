<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/book/private/expenditureform.jsp</title>
</head>
<body>
	<form action="expenditure.jsp" method="post">
		<div>
			<label for="expenditure">지출</label>
			<input type="text" name="expenditure" id="expenditure"/>
		</div>
		<div>
			<label for="contents">내용</label>
			<input type="text" name="contents" id="contents"/>
		</div>
		<button type="submit">지출 추가</button>
	</form>
</body>
</html>