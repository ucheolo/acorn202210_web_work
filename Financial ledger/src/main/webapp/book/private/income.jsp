
<%@page import="test.account.dto.AccountDto"%>
<%@page import="test.account.dao.AccountDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String income = request.getParameter("income");
	String contents = request.getParameter("contents");
	
	AccountDto dto=new AccountDto(); 
	dto.setIncome(income);
	dto.setContents(contents);
	
	boolean isSuccess = AccountDao.getInstance().incomeinsert(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/book/private/income.jsp</title>
</head>
<body>
	<div class="container">
		<%if(isSuccess) {%>
			<p>
				수입을 저장했습니다.
				<a href="${pageContext.request.contextPath }/book/account.jsp">확인</a>
			</p>
		<%}else { %>
			<p>
				수입 저장 실패
				<a href="incomeform.jsp">다시 작성하기</a>
			</p>
		<%} %>
	</div>
</body>
</html>