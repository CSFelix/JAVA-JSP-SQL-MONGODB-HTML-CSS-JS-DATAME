<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
<!DOCTYPE html>
<html>
	<head></head>
	<body></body>
	
	<script>
	<%
	session.setAttribute("login", 1);
	session.setAttribute("alterar_senha", 1);
	session.setAttribute("hash_usuario", request.getParameter("hash_usuario"));
	session.setAttribute("hash_alteracao_senha", request.getParameter("hash_alteracao_senha"));
	%>
	</script>
</html>