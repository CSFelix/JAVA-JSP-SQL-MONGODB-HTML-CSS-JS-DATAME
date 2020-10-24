<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
    
<%@page import="Seguranca.StripHTML" %>
    
<!DOCTYPE html>
<html lang="pt-br">
	<jsp:include page="Include\head-login.jsp" />

	<body>
		<jsp:include page="Include\header.jsp" />
		
		<section class="container flexCenter">
			<form method="POST" action="#" class="formLogin neomorphismo uiFade flexCenter">
				<br><br>
				<jsp:include page="Include\titulo.jsp" />
				<br><br>
				
				<!-- mensagem de informação -->
				<p class="mensagemInformacao">🎉 Biometria alterada com sucesso!</p>
				<br><br>
				
				<a href="index.jsp"><input class="botao opacito neomorphismo neonHover" type="button" value="Voltar ao Login"></a>
				<br><br>
			</form>
		</section>
		
		<jsp:include page="Include\footer.jsp" />
	</body>
	
	<jsp:include page="Include\script-login.jsp" />
	<jsp:include page="Include\Resetar Sessoes\Resetar-Sessoes-Geral.jsp" />
</html>