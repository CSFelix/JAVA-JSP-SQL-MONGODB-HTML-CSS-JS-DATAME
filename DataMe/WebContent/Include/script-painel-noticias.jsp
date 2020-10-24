<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>

<%@page import="Bean.UsuarioBean" %>

<!DOCTYPE html>
<html>
<head>
</head>
<body>

</body>
	<% 
	UsuarioBean usuario = (UsuarioBean) session.getAttribute("usuario_logado");
	%>

	<!-- bibliotecas -->
	<script type="text/javascript" src="JavaScript\Bibliotecas\fontAwesome.js"></script>
	<script type="text/javascript" src="JavaScript\Bibliotecas\jquery.js"></script>
	<script type="text/javascript" src="JavaScript\Bibliotecas\jqueryUI.js"></script>
	<script type="text/javascript" src="JavaScript\Bibliotecas\mojs.js"></script>
	<script type="text/javascript" src="JavaScript\Bibliotecas\webcam.min.js"></script>
	
	<!-- ajax -->
	<script type="text/javascript" src="JavaScript\Ajax\AjaxAlterarBiometria.js"></script>
	<script type="text/javascript" src="JavaScript\Ajax\AjaxAlterarDadosUsuario.js"></script>
	<script type="text/javascript" src="JavaScript\Ajax\AjaxCadastrarNoticia.js"></script>
	
	<!-- efeitos -->
	<%
	if (usuario.isInspecionarElementoBloqueado() == 1) {
	%>
		<script type="text/javascript" src="JavaScript\Efeitos\bloquearInspecionarElemento.js"></script>
	<%
	}
	%>
	
	<script type="text/javascript" src="JavaScript\Efeitos\bloqueioUsuarioCadastro.js"></script>
	<script type="text/javascript" src="JavaScript\Efeitos\carregarPreviewNoticia.js"></script>
	<script type="text/javascript" src="JavaScript\Efeitos\filtrarTabelaNoticiasTitulo.js"></script>
	<script type="text/javascript" src="JavaScript\Efeitos\labelInput.js"></script>
	<script type="text/javascript" src="JavaScript\Efeitos\modal.js"></script>
	<script type="text/javascript" src="JavaScript\Efeitos\mojsAtivarClique.js"></script>
	<script type="text/javascript" src="JavaScript\Efeitos\mojsClique.js"></script>
	<script type="text/javascript" src="JavaScript\Efeitos\statusCadastroNoticia.js"></script>
	<script type="text/javascript" src="JavaScript\Efeitos\trocarTema.js"></script>
	<script type="text/javascript" src="JavaScript\Efeitos\toogle.js"></script>
	<script type="text/javascript" src="JavaScript\Efeitos\visualizarAlteracaoFotoPerfil.js"></script>
	
	<!-- efeitos painel -->
	<script type="text/javascript" src="JavaScript\Efeitos\Paineis\tabs-painel-noticias.js"></script>
	
	<!-- processamentos -->
	<script type="text/javascript" src="JavaScript\Processamento\alterarNoticia.js"></script>
	<script type="text/javascript" src="JavaScript\Processamento\logoff.js"></script>
</html>