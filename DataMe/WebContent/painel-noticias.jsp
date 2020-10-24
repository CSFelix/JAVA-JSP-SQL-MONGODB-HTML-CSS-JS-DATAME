<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>

<%@page import="Bean.UsuarioBean" %>    
<%@page import="Seguranca.StripHTML" %>    
    
<!DOCTYPE html>
<html>
	<%
	UsuarioBean usuario = (UsuarioBean) session.getAttribute("usuario_logado");
	%>
	
	<jsp:include page="Include\head-painel-noticias.jsp" />
	
	<body>
		<jsp:include page="Include\header.jsp" />
		<jsp:include page="Include\modal.jsp" />
		
		<section class="container flexCenter">
			<!-- botões configurações -->
			<jsp:include page="Include\botoes-configuracoes-noticias.jsp" />
			
			<!-- painel -->
			<jsp:include page="Include\Paineis\painel-noticias.jsp" />
		</section>
		
		<jsp:include page="Include\footer.jsp" />
	</body>
	
	
	<jsp:include page="Include\script-painel-noticias.jsp" />
	<jsp:include page="Include\Resetar Sessoes\Resetar-Sessoes-Painel.jsp" />
	<jsp:include page="Include\Display Mensagens\Display-Mensagem-Alteracao-Nickname-Senha.jsp" />
	<jsp:include page="Include\Display Mensagens\Display-Mensagem-Alteracao-Biometria.jsp" />
</html>