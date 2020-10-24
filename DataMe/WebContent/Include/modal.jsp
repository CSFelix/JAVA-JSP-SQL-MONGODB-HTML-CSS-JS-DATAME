<%@ page language="java" contentType="text/html; charset=utf8" pageEncoding="utf8"%>

<%@page import="Bean.UsuarioBean" %>
<%@page import="Seguranca.StripHTML" %>

<!DOCTYPE html>
<html>
<head></head>
<body>

<% 
UsuarioBean usuario = (UsuarioBean) session.getAttribute("usuario_logado");
%>

<!-- Modal Dados do Usuário -->
<div id="modalDados" class="modal">
  	<form method="POST" class="modal-content neomorphismo">
    	<span id="fecharModalDados" class="close">&times;</span>
    							
    	<center><b class="tag">Dados - Usuário</b></center><br>
    							
    	<div class="bloco">
    							
    		<!-- foto de perfil -->
			<div class="foto">
				<a href="#" id="botaoModalAvatar" class="profile-pic neonHover">
					<div class="profile-pic" style="background-image: url(Include/imagem.jsp?usuario_uuid=<%=usuario.getUuid()%>);">
						<span>Alterar Avatar</span>
					</div>
				</a>
			</div>
									
									
									
			<div class="separador"></div>
									
			<!-- dados do usuário -->
			<div class="dados">
			
				<!-- nickname -->															
				<b class="tag">👤 Nickname:</b>
				<br><br> 
				<input id="nicknameUsuario" title="Somente letras maiúsculas e minúsculas, números e underlines são aceitos! De 5 até 15 caracteres!" 
						name="nickname" class="campoInput opacito neomorphismo neonGeral" pattern="<%=StripHTML.REGEX_NICKNAME_SENHA %>" type="text" value="<%= usuario.getNickname() %>" required>
				<br><br>
				
				<!-- email -->					
				<b class="tag">✉️ Email:</b>
				<br><br> 
				<input id="emailUsuario" title="Somente letras maiúsculas e minúsculas, números e underlines são aceitos! De 5 até 15 caracteres!" 
						name="email" class="campoInput opacito neomorphismo neonGeral" pattern="<%=StripHTML.REGEX_EMAIL %>" type="email" value="<%= usuario.getEmail() %>" required>
				<br><br>
				
				<!-- mensagem do processo -->
				<p id="mensagemAlteracaoNicknameEmail" class="mensagemBiometria"></p>
				<br><br>
				
				<!-- exibição da solicitação de alteração biométrica somente para os usuários que utilizam tal função,
				ou seja, para usuários de nível 2 acima -->
				<%
				if (usuario.getNivel() != 1) {
				%>
					<b class="tag">🔮 Solicitar Alteração Biométrica:</b><br><br> 
					<div id="enviarRequisicaoAlteracaoBiometria" class="fas fa-fingerprint campoRedondo neomorphismo neonHover opacito uiFade" aria-hidden="true" style=""></div><br><br>
					
					<!-- mensagem do processo -->
					<p id="mensagemAlteracaoBiometria" class="mensagemBiometria"></p>
					<br><br>	
				<%
				}
				%>
				
				<!-- alteração de senha -->
				<a class="esqueceuSenha" href="Processamento Java\Processamento-Logoff-Alteracao-Senha.jsp">Alterar Senha</a>
			</div>
									
			<div class="separador"></div>
											
			<!-- botões de ações -->
			<div class="botoesAlteracoes">
				<input id="salvarDadosUsuario" class="botao opacito neomorphismo neonHover" type="button" value="Salvar">
				<br><br>				
				<input class="botao opacito neomorphismo neonHover" id="cancelarModalDados" type="button" value="Cancelar">
			</div>
  		</div>
  	</form>
</div>

<!-- Modal Avatar -->
<div id="modalAvatar" class="modal">
  	<form method="POST" action="ProcessamentoAlterarAvatar" class="modal-content neomorphismo" enctype="multipart/form-data">
    	<span id="fecharModalAvatar" class="close">&times;</span>
    							
    	<center><b class="tag">🖼️ Alterar Imagem do Avatar</b></center><br>
    							
    	<div class="bloco">
    		<div class="dados">
    			<input name="uuid_usuario" type="hidden" value="<%= usuario.getUuid()%>">
    			<input id="selecionarFoto" class="campoInput opacito neomorphismo neonGeral" name="avatar" type="file" accept="image/*" required>
    		
    			<!-- avatar -->
				<a href="#" class="profile-pic neonHover">
  					<label id="fotoVisualizacao" for="selecionarFoto" src="#" class="profile-pic">	
  						<span>Alterar Dados</span>
  					</label>
				</a>
			</div>
			
    		<div class="separador"></div>
    		
    		<div class="dados">
    			<input id="salvarAvatar" class="botao opacito neomorphismo neonHover" type="submit" value="Alterar">
    			<br><br>
    			<input class="botao opacito neomorphismo neonHover" id="cancelarModalAvatar" type="button" value="Cancelar">
    		</div>
  		</div>
  	</form>
</div>
</body>
</html>