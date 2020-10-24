<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
<%@page import="Bean.UsuarioBean" %>    
    
<!DOCTYPE html>
<html>
	<%
	UsuarioBean usuario = (UsuarioBean) session.getAttribute("usuario_logado");
	%>
<body>
	<!-- botao de configurações -->
	<div id="configuracoes" class="fas fa-cog campoRedondo elementoAbsolute neomorphismo neonHover opacito uiFade"></div>
	
	<%if (usuario.getNivel() >= 2) {%>
		<!-- botão de cadastro de notícias -->
		<a href="painel-noticias.jsp"><div id="cadastroNoticias" class="fas fa-paste campoRedondo elementoAbsolute neomorphismo neonHover opacito uiFade"></div></a>
	<%} %>
	
	<!-- botão de alertas\mensagens 
	<i class="fas fa-bell-slash"></i> >> sino desativado
	-->
	<button id="mensagens" class="fas fa-bell campoRedondo elementoAbsolute neomorphismo neonHover opacito uiFade"></button>
			
	<!-- lista de alertas -->
	<ul class="listaMensagens neomorphismo opacitoSecundario">
		<li>teste</li>
		<li>teste</li>
		<li>teste</li>
	</ul>
			
	<!-- botão de logoff -->
	<button id="logoff" class="fas fa-sign-out-alt campoRedondo elementoAbsolute neomorphismo neonHover opacito uiFade"></button>
</body>
</html>