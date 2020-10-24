<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
    
<%@page import="Seguranca.StripHTML" %>

<!DOCTYPE html>
<html lang="pt-br">
	<jsp:include page="Include\head-login.jsp" />

	<body>
		<jsp:include page="Include\header.jsp" />
		
		<section class="container flexCenter">
			<form method="POST" class="formLogin neomorphismo uiFade flexCenter" action="Processamento Java\Processamento-Login.jsp">
				<br><br>
				<jsp:include page="Include\titulo.jsp" />
				<br><br>
				
				<!-- email -->
				<div class="campoDiv flexCenter">
					<label id="labelLogin" class="campoLabel">Seu Email</label>
					<p>👤</p>&nbsp&nbsp<input title="Somente letras maiúsculas e minúsculas, números e underlines são aceitos! Até 200 caracteres!" 
										type="email" name="email" id="inputEmail" class="campoInput opacito neomorphismo neonGeral" pattern="<%=StripHTML.REGEX_EMAIL%>" onkeyup="checkLabel('labelLogin', this)" onkeydown="checkLabel('labelLogin', this)" autofocus required>
				</div>
				<br><br>
				
				<!-- senha -->
				<div class="campoDiv flexCenter">
					<label id="labelSenha" class="campoLabel">Sua Senha</label>
					<p>🔒</p>&nbsp&nbsp<input title="Somente letras maiúsculas e minúsculas, números e underlines são aceitos! Até 15 caracteres!" 
										type="password" name="senha" id="inputSenha" class="campoInput opacito neomorphismo neonGeral"  pattern="<%=StripHTML.REGEX_NICKNAME_SENHA%>"  onkeyup="checkLabel('labelSenha', this)" onkeydown="checkLabel('labelSenha', this)"  required>
				</div>
				<br><br>
				
				<!-- mensagem de erro -->
				<p class="mensagemErro">😥  Email ou senha inválidos</p>
				<br><br>
				
				<!-- botão de login -->
				<input id="login" class="botao opacito neomorphismo neonHover" type="submit" value="Login">
				<br><br>
				
				<!-- link de esqueceu senha -->
				<a class="esqueceuSenha opacito" href="esqueceu-senha.jsp">Esqueceu sua senha?</a>
				<br><br>
			</form>
		</section>
		
		<jsp:include page="Include\footer.jsp" />
	</body>
	
	<jsp:include page="Include\script-login.jsp" />
	<jsp:include page="Include\Resetar Sessoes\Resetar-Sessoes-Index.jsp" />
	<jsp:include page="Include\Display Mensagens\Display-Mensagem-Index.jsp" />
</html>