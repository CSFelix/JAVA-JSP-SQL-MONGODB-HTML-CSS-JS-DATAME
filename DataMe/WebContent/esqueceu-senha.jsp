<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
    
<%@page import="Seguranca.StripHTML" %>
    
<!DOCTYPE html>
<html lang="pt-br">
	<jsp:include page="Include\head-login.jsp" />
	
	<body>
		<jsp:include page="Include\header.jsp" />
		
		<section class="container flexCenter">
			<form method="POST" action="Processamento Java\Processamento-Esqueceu-Senha.jsp" class="formLogin neomorphismo uiFade flexCenter">
				<br><br>
				<jsp:include page="Include\titulo.jsp" />
				<br><br>
				
				<!-- email -->
				<div class="campoDiv flexCenter">
					<label id="labelEmail" class="campoLabel">Seu Email</label>
					<p>✉️</p>&nbsp&nbsp<input title="Somente letras maiúsculas e minúsculas, números e underlines são aceitos! Até 200 caracteres!" 
										type="email" name="email" id="inputEmail" class="campoInput opacito neomorphismo neonGeral" pattern="<%=StripHTML.REGEX_EMAIL%>" onkeyup="checkLabel('labelEmail', this)" onkeydown="checkLabel('labelEmail', this)" autofocus required>
				</div>
				<br><br>
				
				<!-- mensagem de erro -->
				<p class="mensagemErro">😥 Email não Cadastrado</p>
				<br><br>
				
				<!-- botões de solicitar alteração de senha e de voltar ao login -->
				<input id="alterarSenha" class="botao opacito neomorphismo neonHover" type="submit" value="Alterar Senha">
				<br><br>
				<a href="index.jsp"><input class="botao opacito neomorphismo neonHover" type="button" value="Voltar ao Login"></a>
				<br><br>
			</form>
		</section>
		
		<jsp:include page="Include\footer.jsp" />
	</body>
	
	<jsp:include page="Include\script-login.jsp" />
	<jsp:include page="Include\Resetar Sessoes\Resetar-Sessoes-Esqueceu-Senha.jsp" />
	<jsp:include page="Include\Display Mensagens\Display-Mensagem-Esqueceu-Senha.jsp" />
</html>