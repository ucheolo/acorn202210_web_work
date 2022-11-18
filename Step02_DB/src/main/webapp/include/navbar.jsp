<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /include/navbar.jsp 페이지의 내용 입니다. --%>
<%
	// 이 navbar.jsp 페이지가 어디에 include 되었는지 읽어와 보기
	String thisPage = request.getParameter("thisPage");
%>
<nav class="navbar navbar-expand-md navbar-dark" style="background-color:#712cf9;">
		<div class="container-fluid">
			<a class="navbar-brand" href="${pageContext.request.contextPath }/">
				<img src="https://getbootstrap.com/docs/5.2/assets/brand/bootstrap-logo.svg" alt="" width="30" height="24" class="d-inline-block align-text-top">
				Acorn
			</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      			<span class="navbar-toggler-icon"></span>
      		</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav">
					<li class="nav-item">
						<a class="nav-link <%=thisPage.equals("member")?"active":"" %>" href="${pageContext.request.contextPath }/member/list.jsp">회원목록</a>
					</li>
					<li class="nav-item">
						<a class="nav-link <%=thisPage.equals("todo")?"active":"" %>" href="${pageContext.request.contextPath }/todo/list.jsp">할일목록</a>
					</li>
				</ul>	
			</div>
		</div>
	</nav>