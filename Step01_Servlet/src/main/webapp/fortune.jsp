<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/fortune.jsp</title>
</head>
<body>
<%
		//오늘의 운세 5개를 미리 준비해 둔다.
		String[] fortunes = {"행운지수1", "행운지수3","행운지수5", "행운지수7", "행운지수100"};
		
		Random ran = new Random();
		int ranNum = ran.nextInt(fortunes.length);
		
%>
	<p>오늘의 운세:<%=fortunes[ranNum]%></p>
	<p>오늘의 운세:<%out.print(fortunes[ranNum]); %></p>
</body>
</html>