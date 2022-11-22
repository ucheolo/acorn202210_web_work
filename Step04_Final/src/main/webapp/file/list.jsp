<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   //파일 목록을 얻어와서
   List<FileDto> list=FileDao.getInstance().getList();
   //응답하기
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/list.jsp</title>
</head>
<body>
   <div class="container">
      <a href="${pageContext.request.contextPath }/file/private/upload_form.jsp">업로드 하기</a>
      <h3>자료실 목록 보기</h3>
      <table>
         <thead>
            <tr>
               <th>번호</th>
               <th>작성자</th>
               <th>제목</th>
               <th>파일명</th>
               <th>크기</th>
               <th>등록일</th>
            </tr>
         </thead>
         <tbody>
         <%for(FileDto tmp:list){ %>
            <tr>
               <td><%=tmp.getNum() %></td>
               <td><%=tmp.getWriter() %></td>
               <td><%=tmp.getTitle() %></td>
               <td>
               		<a href="download.jsp?num=<%=tmp.getNum() %>"><%=tmp.getOrgFileName() %></a>
               </td>
               <td><%=tmp.getFileSize() %></td>
               <td><%=tmp.getRegdate() %></td>
            </tr>
         <%} %>
         </tbody>
      </table>
   </div>
</body>
</html>





