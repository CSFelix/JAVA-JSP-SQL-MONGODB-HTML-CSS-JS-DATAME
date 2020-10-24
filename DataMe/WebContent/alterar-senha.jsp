<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
    
<%@page import="Seguranca.StripHTML" %>

<!DOCTYPE html>
<html lang="pt-br">
	<jsp:include page="Include\head-login.jsp" />

	<body>
		<jsp:include page="Include\header.jsp" />
		
		<section class="container flexCenter">
			<form method="POST" action="Processamento Java\Processamento-Alterar-Senha.jsp" class="formLogin neomorphismo uiFade flexCenter">
				<br><br>
				<jsp:include page="Include\titulo.jsp" />
				<br><br>
				
				<!-- nova senha -->
				<div class="campoDiv flexCenter">
					<label id="labelNovaSenha" class="campoLabel">Sua Nova Senha</label>
					<p>🔒</p>&nbsp&nbsp<input title="Somente letras maiúsculas e minúsculas, números e underlines são aceitos! De 5 até 15 caracteres!" 
										type="password" name="novaSenha" id="novaSenha" class="campoInput opacito neomorphismo neonGeral" pattern="<%=StripHTML.REGEX_NICKNAME_SENHA%>" onkeyup="checkLabel('labelNovaSenha', this)" onkeydown="checkLabel('labelNovaSenha', this)" autofocus required>
				</div>
				<br><br>
				
				<!-- confirmar nova senha -->
				<div class="campoDiv flexCenter">
					<label id="labelConfirmarNovaSenha" class="campoLabel">Confirme Sua Nova Senha</label>
					<p>🔒</p>&nbsp&nbsp<input title="Somente letras maiúsculas e minúsculas, números e underlines são aceitos! De 5 até 15 caracteres!" 
										type="password" name="confirmarNovaSenha" id="confirmarNovaSenha" class="campoInput opacito neomorphismo neonGeral" pattern="<%=StripHTML.REGEX_NICKNAME_SENHA%>" onkeyup="checkLabel('labelConfirmarNovaSenha', this)" onkeydown="checkLabel('labelConfirmarNovaSenha', this)" autofocus required>
				</div>
				<br><br>
				
				<!-- mensagem de erro -->
				<p class="mensagemErro">😥  Senhas não Coincidem</p>
				<br><br>
				
				<!-- botões de envio e retorno ao login -->
				<input id="confirmacaoAlterarSenha" class="botao opacito neomorphismo neonHover" type="submit" value="Alterar Senha">
				<br><br>
				<a href="index.jsp"><input class="botao opacito neomorphismo neonHover" type="button" value="Voltar ao Login"></a>
				<br><br>
			</form>
		</section>
		
		<jsp:include page="Include\footer.jsp" />
	</body>
	
	<jsp:include page="Include\script-login.jsp" />
	<jsp:include page="Include\Resetar Sessoes\Resetar-Sessoes-Alteracao-Senha.jsp" />
	<jsp:include page="Include\Display Mensagens\Display-Mensagem-Alteracao-Senha.jsp" />
</html>