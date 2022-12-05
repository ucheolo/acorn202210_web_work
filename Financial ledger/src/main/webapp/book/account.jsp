<%@page import="java.util.List"%>
<%@page import="test.account.dao.AccountDao"%>
<%@page import="test.account.dto.AccountDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	AccountDto dto = new AccountDto();
	List<AccountDto> list = AccountDao.getInstance().getList(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/book/account.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<div class="container">
			<div>남은 금액 : </div>
			<div>총 수입 : </div>
			<div>총 지출 : </div>
		</div>
		<button><a href="${pageContext.request.contextPath }/book/private/incomeform.jsp">수입 입력하기</a></button>
		<button><a href="${pageContext.request.contextPath }/book/private/expenditureform.jsp">지출 입력하기</a></button>
		<table class="table table-striped">
			<thead class="table-dark">
				<tr>
					<th>내용</th>
					<th>수입</th>
					<th>지출</th>
					<th>날짜</th>
				</tr>
			</thead>
			<tbody>
			<%for(AccountDto tmp:list){ %>
				<tr>
					<td><%=tmp.getContents() %></td>
					<td><%=(tmp.getIncome()==null)? "-":tmp.getIncome() %></td>
					<td><%=(tmp.getExpenditure()==null)? "-":tmp.getExpenditure() %></td>
					<td><%=tmp.getRegdate() %></td>
				</tr>
			<%} %>
			</tbody>
		</table>
	</div>
</body>
</html>