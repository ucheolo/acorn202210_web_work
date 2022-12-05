<%@page import="test.account.dao.AccountDao"%>
<%@page import="test.account.dto.AccountDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contents = request.getParameter("contents");
	String expenditure = request.getParameter("expenditure");
	
	AccountDto dto=new AccountDto();
	dto.setContents(contents);
	dto.setExpenditure(expenditure);
	
	boolean isSuccess = AccountDao.getInstance().expenditureinsert(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/book/private/expenditure.jsp</title>
</head>
<body>
	<div class="container">
		<%if(isSuccess) {%>
			<p>
				지출을 저장했습니다.
				<a href="${pageContext.request.contextPath }/book/account.jsp">확인</a>
			</p>
		<%}else { %>
			<p>
				지출 저장 실패
				<a href="expenditureform.jsp">다시 작성하기</a>
			</p>
		<%} %>
	</div>
</body>
</html>