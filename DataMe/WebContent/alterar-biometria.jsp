<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
    
<%@page import="Seguranca.StripHTML" %>
<!DOCTYPE html>
<html lang="pt-br">
	<jsp:include page="Include\head-login.jsp" />

	<body>
		<jsp:include page="Include\header.jsp" />
		
		<section class="container flexCenter">
			<div class="formLogin neomorphismo uiFade flexCenter">
				<br><br>
				<jsp:include page="Include\titulo.jsp" />
				<br><br>
				
				<p class="mensagemInformacao">🎉 Bem vindo à Alteração Biométrica! Se estiver pronto, clique no botão digital abaixo!</p>
				<br><br>
				
				<a href="Processamento Java\Processamento-Verificar-Status-Alteracao-Biometrica.jsp">
					<button id="verificarStatusAlteracaoBiometrica" class="fas fa-fingerprint campoRedondo neomorphismo neonHover opacito uiFade"></button>
				</a>
				<br><br>
				<a href="index.jsp"><input class="botao opacito neomorphismo neonHover" type="button" value="Voltar ao Login"></a>
				<br><br>
			</div>
		</section>
		
		<jsp:include page="Include\footer.jsp" />
	</body>
	
	<jsp:include page="Include\script-login.jsp" />
	<jsp:include page="Include\Resetar Sessoes\Resetar-Sessoes-Alteracao-Biometrica.jsp" />
	<script>
	// captura de variável global
	const queryString = window.location.search;
	const urlParams = new URLSearchParams(queryString);
	
	const uuid_usuario = urlParams.get("hash_usuario");
	const uuid_alterar_biometria = urlParams.get("hash_alteracao_biometria");
	
	window.localStorage.setItem("uuid_usuario", uuid_usuario);
	window.localStorage.setItem("uuid_alterar_biometria", uuid_alterar_biometria);
	</script>
</html>