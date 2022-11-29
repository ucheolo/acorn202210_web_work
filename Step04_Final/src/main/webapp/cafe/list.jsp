<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/list.jsp</title>
</head>
<body>
	<div class="container">
		<a href="${pageContext.request.contextPath }/cafe/private/insertform.jsp">새글 작성</a>
		<h3>카페 글 목록 입니다.</h3>
		<table>
			<thead>
				<tr>
					<th>글번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>조회수</th>
					<th>작성일</th>
				</tr>
			</thead>
		</table>
	</div>
</body>
</html>