<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
   // 1. �� ���۵Ǵ� ���̵�, ��й�ȣ �о����
   request.setCharacterEncoding("utf-8");
   String id = request.getParameter("id");
   String pwd = request.getParameter("pwd");

   UsersDto dto = new UsersDto();
   dto.setId(id);
   dto.setPwd(pwd);
   // 2. DB�� ������ �����ϴ� �´� �������� Ȯ���Ѵ�.(�´� �����̸� �α���ó�� �Ѵ�.)
   boolean isValid= UsersDao.getInstance().isValid(dto);
   if(isValid){
	  //session scope �� id��� Ű������ �α��ε� ���̵� ���
      session.setAttribute("id", id);
   }
   
   // 3. ����
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/login.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
   <div class="container">
      <%if(isValid) {%>
         <p class="alert alert-success">
            <strong><%=dto.getId() %></strong> �� �α��εǾ����ϴ�.
            <a href="${pageContext.request.contextPath }/index.jsp">Ȩ���� ����</a>
         </p>
      <%}else{ %>
         <p class="alert alert-danger">
            �α��� ����
            <a href="loginform.jsp">�ٽ� �α��� �ϱ�</a>            
         </p>
      <%} %>
   </div>
</body>
</html>