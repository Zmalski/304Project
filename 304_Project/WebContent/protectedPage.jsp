<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Example of Password Protected Page</title>
</head>
<body>
	<%@ include file="auth.jsp"%>
	<%
		String user = (String) session.getAttribute("authenticatedUser");
		out.println("<h1>You have access to this page: " + user + "</h1>");
	%>
</body>
</html>