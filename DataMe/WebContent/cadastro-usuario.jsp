<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
   
<%@page import="Bean.UsuarioBean" %>
<%@page import="Dao.UsuarioDao" %>    
<%@page import="Seguranca.StripHTML" %>
    
<!DOCTYPE html>
<html lang="pt-br">
	<%
	UsuarioBean usuario = (UsuarioBean) session.getAttribute("usuario_logado");
	String uuid_usuario_cadastro = request.getParameter("hash_usuario");
	%>

	<jsp:include page="Include\head-painel.jsp" />
	
	<body>
		<jsp:include page="Include\header.jsp" />
		<jsp:include page="Include\modal.jsp" />
		
		<section class="container flexCenter">
		
			<!-- botões configurações -->
			<jsp:include page="Include\botoes-configuracoes.jsp" />
			
			
			<!-- painel -->
			<section  class="formCadastroUsuario neomorphismo uiFade">
				<br><br>
				<h2> Cadastro de Usuários</h2>
				<br><br>
			
				<!-- botão de retorno -->
				<a href="painel.jsp"><button class="fas fa-backward campoRedondo neomorphismo neonHover opacito uiFade" title="Retornar\Cancelar"></button></a>
				<br><br>
				<br><br>
				
				<%
				// cadastro de um novo usuário
				if (uuid_usuario_cadastro.equals("none-hash")) {
				%>
				
					<!-- nickname -->
					<div class="campoDiv flexCenter">
						<label id="labelNickname" class="campoLabel">Nickname</label>
						<p>👤</p>&nbsp&nbsp<input title="Somente letras maiúsculas e minúsculas, números e underlines são aceitos! Até 15 caracteres!" 
											type="text" name="nickname" id="nicknameCadastroUsuario" class="campoInput opacito neomorphismo neonGeral" pattern="<%=StripHTML.REGEX_NICKNAME_SENHA%>" onkeyup="checkLabel('labelNickname', this)" onkeydown="checkLabel('labelNickname', this)" autofocus required>
					</div>
					<br><br>
						
					<!-- mensagem de nickname já cadastrado -->
					<center><p id="mensagemErroNickname" class="mensagemErro"></p></center>
					<br><br>
						
					<!-- email -->
					<div class="campoDiv flexCenter">
						<label id="labelLogin" class="campoLabel">Email</label>
						<p>✉️</p>&nbsp&nbsp<input title="Somente letras maiúsculas e minúsculas, números e underlines são aceitos! Até 200 caracteres!" 
											type="email" name="email" id="emailCadastroUsuario" class="campoInput opacito neomorphismo neonGeral" pattern="<%=StripHTML.REGEX_EMAIL%>" onkeyup="checkLabel('labelLogin', this)" onkeydown="checkLabel('labelLogin', this)" autofocus required>
					</div>
					<br><br>
					
					<!-- mensagem de email já cadastrado -->
					<center><p id="mensagemErroEmail" class="mensagemErro"></p></center>
					<br><br>
					
					<!-- nível de usuário -->
					🌟 Nível de Acesso:
					&nbsp&nbsp&nbsp&nbsp
				
					<select class="campoInput neomorphismo neonGeral opacito" name="nivelUsuario" id="nivelUsuario">
	    				<optgroup label="Acesso Restrito">
	      					<option value="1">Colaborador (Notícias 1, Ferramentas)</option>
	        				<option value="2">Chefes de Setores (Notícias 1 \ 2, Ferramentas, Cadastros, Postagens)</option>
	    				</optgroup>
	    				
	    				<optgroup label="Acesso Liberado">
	      					<option value="3">Ministro (Notícias 1 \ 2 \ 3, Ferramentas, Cadastros, Postagens, Avaliações)</option>
	      					<option value="4">Programação (Notícias 1 \ 2 \ 3, Ferramentas, Cadastros, Postagens, Avaliações, Design Mode)</option>
	    				</optgroup>
	  				</select>
					<br><br>
					<br><br>	
					
					<!-- biometria -->
					<button id="botaoFotoReconhecimento" class="fas fa-fingerprint campoRedondo neomorphismo neonHover opacito uiFade" title="Biometria"></button>
					&nbsp&nbsp&nbsp
					
					<!-- foto de perfil (apenas visualização) -->
					<button id="botaoFotoPerfil" class="far fa-images campoRedondo neomorphismo neonHover opacito uiFade" title="Foto de Perfil"></button>
					&nbsp&nbsp&nbsp
					
					<!-- bloqueio\desbloqueio de funcionário -->
					<button id="botaoBloqueio" onclick="animacaoBloqueioUsuario(this)" class="fas fa-unlock campoRedondo neomorphismo neonHover opacito uiFade" title="Bloqueio\Desbloqueio do Usuário"></button>
					<br><br>
					
					<!-- imagem de reconhecimento -->
					<center><p id="mensagemInformacaoFotoReconhecimento" class="mensagemErro">😥 Usuário não cadastrado para ter Foto de Reconhecimento</p></center>
					<br><br>
					
					<!-- imagem de perfil -->
					<img class="fotoPerfilCadastroUsuario neonHover opacito" src="Imagens\Foto Perfil\avatar.png">
					<br><br>
					<center><p id="mensagemInformacaoFotoPerfil" class="mensagemInformacao">🎉 Apenas para Visualização!</p></center>
					<br><br>
					
					<!-- submit -->
					<input id="cadastrarUsuario" class="botao opacito neomorphismo neonHover" type="button" value="Salvar">
					<br><br>
					
					<!-- mensagem de falha no processamento -->
					<center><p id="mensagemErroProcessamento" class="mensagemErro"></p></center>
					
				<%
				
				// alteraão de um usuário
				} else {
					
					UsuarioDao usuario_dao = new UsuarioDao();
					UsuarioBean usuario_alteracao = usuario_dao.SelecionarUsuario(uuid_usuario_cadastro);
					usuario_alteracao.setUuid(uuid_usuario_cadastro);
				%>
					
					<!-- nickname -->
					<div class="campoDiv flexCenter">
						<label id="labelNickname" class="campoLabel labelAtiva">Nickname</label>
						<p>👤</p>&nbsp&nbsp<input value="<%=usuario_alteracao.getNickname() %>" title="Somente letras maiúsculas e minúsculas, números e underlines são aceitos! Até 15 caracteres!" 
											type="text" name="nickname" id="nicknameCadastroUsuario" class="campoInput opacito neomorphismo neonGeral" pattern="<%=StripHTML.REGEX_NICKNAME_SENHA%>" onkeyup="checkLabel('labelNickname', this)" onkeydown="checkLabel('labelNickname', this)" autofocus required>
					</div>
					<br><br>
						
					<!-- mensagem de nickname já cadastrado -->
					<center><p id="mensagemErroNickname" class="mensagemErro"></p></center>
					<br><br>
						
					<!-- email -->
					<div class="campoDiv flexCenter">
						<label id="labelLogin" class="campoLabel labelAtiva">Email</label>
						<p>✉️</p>&nbsp&nbsp<input value="<%=usuario_alteracao.getEmail() %>" title="Somente letras maiúsculas e minúsculas, números e underlines são aceitos! Até 200 caracteres!" 
											type="email" name="email" id="emailCadastroUsuario" class="campoInput opacito neomorphismo neonGeral" pattern="<%=StripHTML.REGEX_EMAIL%>" onkeyup="checkLabel('labelLogin', this)" onkeydown="checkLabel('labelLogin', this)" autofocus required>
					</div>
					<br><br>
					
					<!-- mensagem de email já cadastrado -->
					<center><p id="mensagemErroEmail" class="mensagemErro"></p></center>
					<br><br>
					
					<!-- nível de usuário -->
					🌟 Nível de Acesso:
					&nbsp&nbsp&nbsp&nbsp
				
					<select class="campoInput neomorphismo neonGeral opacito" name="nivelUsuario" id="nivelUsuario">
						<%
						if (usuario_alteracao.getNivel() == 1) { 
						%>
							<optgroup label="Acesso Restrito">
		      					<option selected value="1">Colaborador (Notícias 1, Ferramentas)</option>
		        				<option value="2">Chefes de Setores (Notícias 1 \ 2, Ferramentas, Cadastros, Postagens)</option>
		    				</optgroup>
		    				
		    				<optgroup label="Acesso Liberado">
		      					<option value="3">Ministro (Notícias 1 \ 2 \ 3, Ferramentas, Cadastros, Postagens, Avaliações)</option>
		      					<option value="4">Programação (Notícias 1 \ 2 \ 3, Ferramentas, Cadastros, Postagens, Avaliações, Design Mode)</option>
		    				</optgroup>
						<%
						} else if (usuario_alteracao.getNivel() == 2) {
						%>
							<optgroup label="Acesso Restrito">
		      					<option value="1">Colaborador (Notícias 1, Ferramentas)</option>
		        				<option selected value="2">Chefes de Setores (Notícias 1 \ 2, Ferramentas, Cadastros, Postagens)</option>
		    				</optgroup>
		    				
		    				<optgroup label="Acesso Liberado">
		      					<option value="3">Ministro (Notícias 1 \ 2 \ 3, Ferramentas, Cadastros, Postagens, Avaliações)</option>
		      					<option value="4">Programação (Notícias 1 \ 2 \ 3, Ferramentas, Cadastros, Postagens, Avaliações, Design Mode)</option>
		    				</optgroup>
						<%
						} else if (usuario_alteracao.getNivel() == 3) {
						%>
							<optgroup label="Acesso Restrito">
		      					<option value="1">Colaborador (Notícias 1, Ferramentas)</option>
		        				<option value="2">Chefes de Setores (Notícias 1 \ 2, Ferramentas, Cadastros, Postagens)</option>
		    				</optgroup>
		    				
		    				<optgroup label="Acesso Liberado">
		      					<option selected value="3">Ministro (Notícias 1 \ 2 \ 3, Ferramentas, Cadastros, Postagens, Avaliações)</option>
		      					<option value="4">Programação (Notícias 1 \ 2 \ 3, Ferramentas, Cadastros, Postagens, Avaliações, Design Mode)</option>
		    				</optgroup>
						<%
						} else {
						%>
							<optgroup label="Acesso Restrito">
		      					<option value="1">Colaborador (Notícias 1, Ferramentas)</option>
		        				<option value="2">Chefes de Setores (Notícias 1 \ 2, Ferramentas, Cadastros, Postagens)</option>
		    				</optgroup>
		    				
		    				<optgroup label="Acesso Liberado">
		      					<option value="3">Ministro (Notícias 1 \ 2 \ 3, Ferramentas, Cadastros, Postagens, Avaliações)</option>
		      					<option selected value="4">Programação (Notícias 1 \ 2 \ 3, Ferramentas, Cadastros, Postagens, Avaliações, Design Mode)</option>
		    				</optgroup>
						<%
						}
						%>
	  				</select>
					<br><br>
					<br><br>	
					
					<!-- biometria -->
					<button id="botaoFotoReconhecimento" class="fas fa-fingerprint campoRedondo neomorphismo neonHover opacito uiFade" title="Biometria"></button>
					&nbsp&nbsp&nbsp
					
					<!-- foto de perfil (apenas visualização) -->
					<button id="botaoFotoPerfil" class="far fa-images campoRedondo neomorphismo neonHover opacito uiFade" title="Foto de Perfil"></button>
					&nbsp&nbsp&nbsp
					
					<%
					if (usuario_alteracao.isBloqueado() == 0) {
					%>
					<!-- bloqueio\desbloqueio de funcionário -->
					<button id="botaoBloqueio" onclick="animacaoBloqueioUsuario(this)" class="fas fa-unlock campoRedondo neomorphismo neonHover opacito uiFade" title="Bloqueio\Desbloqueio do Usuário"></button>
					<%
					} else {
					%>
					<!-- bloqueio\desbloqueio de funcionário -->
					<button id="botaoBloqueio" onclick="animacaoBloqueioUsuario(this)" class="fas fa-lock campoRedondo neomorphismo neonHover opacito uiFade" title="Bloqueio\Desbloqueio do Usuário"></button>
					<%
					}
					%>
					<br><br>
					
					<!-- usuário tem foto de reconhecimento cadastrada-->
					<%
					if (usuario_alteracao.getFotoReconhecimento() != null) {
					%>
						<!-- imagem de reconhecimento -->
						<img class="fotoReconhecimento neonHover opacito" src="<%=usuario_alteracao.getFotoReconhecimento() %>">
						<br><br>
						<center><p id="mensagemInformacaoFotoReconhecimento" class="mensagemInformacao">🎉 Apenas para Visualização!</p></center>
						<br><br>
						<div class="enviarRequisicaoAlteracaoBiometriaAlteracaoUsuario" class="fas fa-fingerprint campoRedondo neomorphismo neonHover opacito uiFade" aria-hidden="true" style=""></div><br><br>
						<br><br>
					<!-- usuário não tem foto de reconhecimento cadastrada -->
					<%
					} else {
					%>
						<!-- imagem de reconhecimento -->
						<center><p id="mensagemInformacaoFotoReconhecimento" class="mensagemErro">😥 Usuário ainda não tem foto de biometria cadastrada</p></center>
						<br><br>
						<div class="enviarRequisicaoAlteracaoBiometriaAlteracaoUsuario" class="fas fa-fingerprint campoRedondo neomorphismo neonHover opacito uiFade" aria-hidden="true" style=""></div><br><br>
						<br><br>
					<%
					}
					%>
					
					<!-- imagem de perfil -->
					<img class="fotoPerfilCadastroUsuario neonHover opacito" src="Include\imagem.jsp?usuario_uuid=<%=usuario_alteracao.getUuid() %>">
					<br><br>
					<center><p id="mensagemInformacaoFotoPerfil" class="mensagemInformacao">🎉 Apenas para Visualização!</p></center>
					<br><br>
					
					<!-- submit -->
					<input id="cadastrarUsuario" class="botao opacito neomorphismo neonHover" type="button" value="Salvar">
					<br><br>
					
					<!-- mensagem de falha no processamento -->
					<center><p id="mensagemErroProcessamento" class="mensagemErro"></p></center>
				<%
				}
				%>
			</section>
		</section>
		
		<jsp:include page="Include\footer.jsp" />
	</body>
	
	<jsp:include page="Include\script-painel.jsp" />
	<jsp:include page="Include\Resetar Sessoes\Resetar-Sessoes-Painel.jsp" />
	<jsp:include page="Include\Display Mensagens\Display-Mensagem-Cadastro-Usuario.jsp" />
	<jsp:include page="Include\Display Mensagens\Display-Mensagem-Alteracao-Nickname-Senha.jsp" />
	<jsp:include page="Include\Display Mensagens\Display-Mensagem-Alteracao-Biometria.jsp" />
</html>