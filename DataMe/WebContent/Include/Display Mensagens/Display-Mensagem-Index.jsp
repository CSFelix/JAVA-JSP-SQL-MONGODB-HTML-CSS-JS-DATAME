<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
<!DOCTYPE html>
<html>
	<head></head>
	<body></body>
	
	<script>
	<%
	try {
		int logado = (int) session.getAttribute("login");
		
		if (logado == 0) { %> $(".mensagemErro").show(); <% }
		else { %> $(".mensagemErro").hide(); <% }
	}
	
	catch (Exception e) { %> $(".mensagemErro").hide(); <% }
	%>
	</script>
</html>