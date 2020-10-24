<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>

<%@page import="Bean.UsuarioBean" %>    
<%@page import="Seguranca.StripHTML" %>
    
<!DOCTYPE html>
<html lang="pt-br">
	<%
		UsuarioBean usuario = (UsuarioBean) session.getAttribute("usuario_logado");
	%>	

	<jsp:include page="Include\head-painel.jsp" />
	
	<body>
		<jsp:include page="Include\header.jsp" />
		<jsp:include page="Include\modal.jsp" />
		
		<section class="container flexCenter">
			
			<!-- botões configurações -->
			<jsp:include page="Include\botoes-configuracoes.jsp" />

			<!-- painel -->
			<% if (usuario.getNivel() == 1) { %>
				
				<!-- painel nível 1 -->
				<link rel="stylesheet" type="text/css" href="CSS\Classes\Paineis\style-painel-nivel-1.css">
				<jsp:include page="Include\Paineis\painel-nivel-1.jsp" />
				<script type="text/javascript" src="JavaScript\Efeitos\Paineis\tabs-painel-nivel-1.js"></script>
				
			<%} else if (usuario.getNivel() == 2) {%>
				
				<!-- painel nível 2 -->
				<link rel="stylesheet" type="text/css" href="CSS\Classes\Paineis\style-painel-nivel-2.css">
				<jsp:include page="Include\Paineis\painel-nivel-2.jsp" />
				<script type="text/javascript" src="JavaScript\Efeitos\Paineis\tabs-painel-nivel-2.js"></script>
				
			<%} else if (usuario.getNivel() == 3) { %>
				
				<!-- painel nível 3 -->
				<link rel="stylesheet" type="text/css" href="CSS\Classes\Paineis\style-painel-nivel-3.css">
				<jsp:include page="Include\Paineis\painel-nivel-3.jsp" />
				<script type="text/javascript" src="JavaScript\Efeitos\Paineis\tabs-painel-nivel-3.js"></script>
			
			<%} else { %>
				
				<!-- painel nível 4 -->
				<link rel="stylesheet" type="text/css" href="CSS\Classes\Paineis\style-painel-nivel-4.css">
				<jsp:include page="Include\Paineis\painel-nivel-4.jsp" />
				<script type="text/javascript" src="JavaScript\Efeitos\Paineis\tabs-painel-nivel-4.js"></script>
			
			<%} %>
		</section>
		
		<jsp:include page="Include\footer.jsp" />
	</body>
	
	<jsp:include page="Include\script-painel.jsp" />
	<jsp:include page="Include\Resetar Sessoes\Resetar-Sessoes-Painel.jsp" />
	<jsp:include page="Include\Display Mensagens\Display-Mensagem-Alteracao-Nickname-Senha.jsp" />
	<jsp:include page="Include\Display Mensagens\Display-Mensagem-Alteracao-Biometria.jsp" />
</html>