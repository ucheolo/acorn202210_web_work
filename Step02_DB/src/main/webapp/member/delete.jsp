<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%
	//1. 회원 한명의 정보를 삭제하기(몇번 회원을 삭제 하지?)
	//GET 방식 파라미터로 전달되는 삭제할 회원의 번호를 읽어와서 숫자로 바로 바꿔준다.
	int num = Integer.parseInt(request.getParameter("num"));
	//MemberDao 객체를 이용해서 삭제
	MemberDao.getInstance().delete(num);
	//2. 응답하기
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/delete.jsp</title>
</head>
<body>
	<div class="container">
			<p>
				<strong><%=num %></strong>번 회원을 삭제했습니다.
				회원 정보 삭제 성공!
				<a href="list.jsp">확인</a><%-- 상대 경로 --%>
				<a href="${pageContext.request.contextPath }/member/list.jsp">확인</a><%-- 절대 경로 --%>
			</p>
	</div>
</body>
</html>