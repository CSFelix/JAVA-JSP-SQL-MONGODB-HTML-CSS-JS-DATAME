<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
    
<%@page import="Seguranca.StripHTML" %>
    
<!DOCTYPE html>
<html lang="pt-br">
	<jsp:include page="Include\head-login.jsp" />

	<body>
		<jsp:include page="Include\header.jsp" />
		
		<section class="container flexCenter">
			<div class="formBiometria neomorphismo uiFade flexCenter">
				<br><br>
				<jsp:include page="Include\titulo.jsp" />
				<br><br>
				
				<!-- mensagem de informação -->
				<p class="mensagemInformacao">🎉 Vamos começar com a alteração, clique no primeiro botão abaixo!</p>
				<br><br>
				
				<button id="iniciarCaptura" class="fas fa-camera campoRedondo neomorphismo neonHover opacito uiFade"></button>
				<br><br>
				
				<!-- elementos da captura da face -->
				<div id="camera"></div>
				
				<div class="separador"></div>
				<button id="capturarFoto" class="fas fa-camera campoRedondo neomorphismo neonHover opacito uiFade"></button>
				<div class="separador"></div>
				
				<img id="previaImagemCapturada" width="240px" height="240px">
				
				<div class="separador"></div>
				
				<div id="formulario"></div>
			</div>
		</section>
		
		<jsp:include page="Include\footer.jsp" />
	</body>
	
	<jsp:include page="Include\script-login.jsp" />
	<jsp:include page="Include\Resetar Sessoes\Resetar-Sessoes-Geral.jsp" />
</html>