<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
   
<%@page import="Bean.UsuarioBean" %>
<%@page import="Bean.NoticiaPostBean" %>
<%@page import="Dao.NoticiaPostDao" %>
<%@page import="Seguranca.StripHTML" %>
    
<!DOCTYPE html>
<html lang="pt-br">
	<%
	UsuarioBean usuario = (UsuarioBean) session.getAttribute("usuario_logado");
	String uuid_noticia_cadastro = request.getParameter("hash_noticia");
	%>

	<jsp:include page="Include\head-painel-noticias.jsp" />
	
	<body>
		<jsp:include page="Include\header.jsp" />
		<jsp:include page="Include\modal.jsp" />
		
		<section class="container flexCenter">
		
			<!-- botões configurações -->
			<jsp:include page="Include\botoes-configuracoes-noticias.jsp" />
			
			<!-- painel -->
			<div class="tabs neomorphismo uiFade">
	
				<!-- cabeçalho do painel --> 
  				<div class="tab-header">
			
					<!--  notícias edição -->
    				<div class="active primeira-tab opacito">
      					<i class="fas fa-edit"></i>
      					<p class="tab-legenda">Formulário</p>
    				</div>

    				<!-- notícias publicadas -->
    				<div class="opacito">
      					<i class="fas fa-eye"></i>
      					<p class="tab-legenda">Preview</p>
    				</div>
		
					<!-- notícias deletadas -->
    				<div class="opacito">
      					<i class="fas fa-file"></i>
      					<p class="tab-legenda">Documentação</p>
    				</div>
  				</div>
	
				<!-- indicador da tab ativa -->
  				<div class="tab-indicator"></div>

				<!-- conteúdos das tabs -->
  				<div class="tab-body flexCenter">
  		
  					<!-- notícias edição -->
    				<div class="active">
      					
	    					<br><br>
	      					<h2>Formulário</h2>
	      					<br><br>
	      					
	      					<!-- botão de retorno -->
							<a href="painel-noticias.jsp"><button class="fas fa-backward campoRedondo neomorphismo neonHover opacito uiFade" title="Retornar\Cancelar"></button></a>
							<br><br>
							<br><br>
	      					<%
							// cadastro de uma nova notícia
							if (uuid_noticia_cadastro.equals("none_hash")) {
							%>
								<!-- título da notícia -->
								<section class="campoDiv flexCenter">
									<label id="labelTitulo" class="campoLabel">Título</label>
									<p>👓</p>&nbsp&nbsp<input title="Apenas caracteres, underlines e números são permitidos. Até 30 caracteres." 
														type="text" name="titulo" id="tituloCadastroNoticia" class="campoInput opacito neomorphismo neonGeral" pattern="<%=StripHTML.REGEX_TITULO_NOTICIA%>" onkeyup="checkLabel('labelTitulo', this)" onkeydown="checkLabel('labelTitulo', this)" autofocus required>
								</section>
								<br><br>
								
								<!-- descrição da notícia -->
								<p>🖊️ Descrição</p>
								<br><br>
								<textarea title="Documentação HTML é permitida (exceto comandos em javascript)" 
										name="descricao" id="descricaoCadastroNoticia" class="campoInput opacito neomorphismo neonGeral textAreaDescricao" autofocus required>
								</textarea>
								<br><br>
								
								<!-- nível da notícia -->
								🌟 Nível de Acesso:
								&nbsp&nbsp&nbsp&nbsp
								
								<select class="campoInput neomorphismo neonGeral opacito" name="nivelNoticia" id="nivelNoticia">
	    							<optgroup label="Biometria não Necessária para Visualização">
	      								<option value="1">Informação Pública</option>
	    							</optgroup>
	    				
	    							<optgroup label="Biometria Necessária para Visualização">
	      								<option value="2">Informacao Sigilosa</option>
	      								
	      								<!-- apenas usuários níveis 3 e 4 podem cadastrar notícias nível 3 -->
	      								<%if (usuario.getNivel() > 2) {%>
	      									<option value="3">Informação Máxima</option>
	      								<%} %>
	    							</optgroup>
	  							</select>
								<br><br>
								
								<!-- status notícia -->
								🏵️ Status:
								&nbsp&nbsp&nbsp&nbsp
								
								<section id="statusNoticia" onclick="animacaoStatusNoticia(this)"
									class="fas fa-file-alt campoRedondo neomorphismo neonHover opacito uiFade" title="Em edição"></section>
								<br><br>
								<p id="mensagemStatus" class="mensagemInformacao">🎉 Notícia Em Edição!</p>
								<br><br>	
								
								<!-- submit -->
								<input id="cadastrarNoticia" class="botao opacito neomorphismo neonHover" type="button" value="Salvar">
								<br><br>
					
								<!-- mensagem de falha no processamento -->
								<center><p id="mensagemErroProcessamento" class="mensagemErro"></p></center>
							<%
							
							// alteração de notícia
							} else {
								NoticiaPostBean noticia = new NoticiaPostBean();
								noticia.setUuidNoticiaPost(uuid_noticia_cadastro);
								noticia.setUuidUsuario(usuario.getUuid());
								
								NoticiaPostDao noticia_dao = new NoticiaPostDao();
								noticia = noticia_dao.SelecionarNoticia(noticia);
							%>
								<!-- título da notícia -->
								<section class="campoDiv flexCenter">
									<label id="labelTitulo" class="campoLabel labelAtiva">Título</label>
									<p>👓</p>&nbsp&nbsp<input title="Apenas caracteres, underlines e números são permitidos. Até 30 caracteres."  value="<%=noticia.getTitulo() %>"
														type="text" name="titulo" id="tituloCadastroNoticia" class="campoInput opacito neomorphismo neonGeral" pattern="<%=StripHTML.REGEX_TITULO_NOTICIA%>" onkeyup="checkLabel('labelTitulo', this)" onkeydown="checkLabel('labelTitulo', this)" autofocus required>
								</section>
								<br><br>
								
								<!-- descrição da notícia -->
								<p>🖊️ Descrição</p>
								<br><br>
								<textarea title="Documentação HTML é permitida (exceto comandos em javascript)"
										name="descricao" id="descricaoCadastroNoticia" class="campoInput opacito neomorphismo neonGeral textAreaDescricao" autofocus required>
									<%=noticia.getDescricao()%>
								</textarea>
								<br><br>
								
								<!-- nível da notícia -->
								🌟 Nível de Acesso:
								&nbsp&nbsp&nbsp&nbsp
								
								<%
									if (noticia.getNivel() == 1) {
								%>
										<select class="campoInput neomorphismo neonGeral opacito" name="nivelNoticia" id="nivelNoticia">
	    									<optgroup label="Biometria não Ncessária para Visualização">
	      										<option selected value="1">Informação Pública</option>
	    									</optgroup>
	    				
	    									<optgroup label="Biometria Necessária para Visualização">
	      										<option value="2">Informacao Sigilosa</option>
	      										
	      										<!-- apenas usuários níveis 3 e 4 podem cadastrar notícias nível 3 -->
	      										<%if (usuario.getNivel() > 2) {%>
	      											<option value="3">Informação Máxima</option>
	      										<%} %>
	    									</optgroup>
	  									</select>
								<%
									} else if (noticia.getNivel() == 2) {
								%>
										<select class="campoInput neomorphismo neonGeral opacito" name="nivelNoticia" id="nivelNoticia">
	    									<optgroup label="Biometria não Ncessária para Visualização">
	      										<option value="1">Informação Pública</option>
	    									</optgroup>
	    				
	    									<optgroup label="Biometria Necessária para Visualização">
	      										<option selected value="2">Informacao Sigilosa</option>
	      										
	      										<!-- apenas usuários níveis 3 e 4 podem cadastrar notícias nível 3 -->
	      										<%if (usuario.getNivel() > 2) {%>
	      											<option value="3">Informação Máxima</option>
	      										<%} %>
	    									</optgroup>
	  									</select>
								<%
									} else {
								%>
										<select class="campoInput neomorphismo neonGeral opacito" name="nivelNoticia" id="nivelNoticia">
	    									<optgroup label="Biometria não Ncessária para Visualização">
	      										<option value="1">Informação Pública</option>
	    									</optgroup>
	    				
	    									<optgroup label="Biometria Necessária para Visualização">
	      										<option value="2">Informacao Sigilosa</option>
	      										<option selected value="3">Informação Máxima</option>
	    									</optgroup>
	  									</select>
								<%
									}
								%>
								<br><br>
								
								<!-- status notícia -->
								🏵️ Status:
								&nbsp&nbsp&nbsp&nbsp
								
								<%
									if (noticia.getStatus() == 0) {
								%>
										<section id="statusNoticia" onclick="animacaoStatusNoticia(this)"
											class="fas fa-file-alt campoRedondo neomorphismo neonHover opacito uiFade" title="Em edição"></section>
										<br><br>
										<p id="mensagemStatus" class="mensagemInformacao">🎉 Notícia Em Edição!</p>
								<%
									} else if (noticia.getStatus() == 1) {
								%>
										<section id="statusNoticia" onclick="animacaoStatusNoticia(this)"
											class="far fa-newspaper campoRedondo neomorphismo neonHover opacito uiFade" title="Em edição"></section>
										<br><br>
										<p id="mensagemStatus" class="mensagemInformacao">🎉 Notícia Publicada!</p>
								<%
									} else {
								%>
										<section id="statusNoticia" onclick="animacaoStatusNoticia(this)"
											class="fas fa-trash campoRedondo neomorphismo neonHover opacito uiFade" title="Em edição"></section>
										<br><br>
										<p id="mensagemStatus" class="mensagemInformacao">🎉 Notícia Excluída</p>
								<%
									}
								%>
								<br><br>	
								
								<!-- submit -->
								<input id="cadastrarNoticia" class="botao opacito neomorphismo neonHover" type="button" value="Salvar">
								<br><br>
					
								<!-- mensagem de falha no processamento -->
								<center><p id="mensagemErroProcessamento" class="mensagemErro">😥 Falha no Processamento: Tente novamente mais tarde!</p></center>
							<%
							}
							%>
						
    				</div>

					<!-- preview -->
    				<div>
      					<center>
	    					<br><br>
	      					<h2>Preview</h2>
	      					<br><br>
	      					
	      					<!-- botão de retorno -->
							<a href="painel-noticias.jsp"><button class="fas fa-backward campoRedondo neomorphismo neonHover opacito uiFade" title="Retornar\Cancelar"></button></a>
							<br><br>
							<br><br>
	      					
	      					<!-- botão para carrregar visualizar do preview -->
	      					<p>💡 Carregar Visualização da Notícia</p>
	      					<br><br>
	      					<button id="botaoCarregarNoticia" class="far fa-lightbulb campoRedondo neomorphismo neonHover opacito uiFade"></button>
	      					<br><br>
	      					
	      					<section id="previewDescricaoNoticia"></section>
						</center>
    				</div>
			
					<!-- documentação -->
    				<div class="flexCenter flexColumnDirection">
      					<center>
	    					<br><br>
	      					<h2>Documentação</h2>
	      					<br><br>
	      					
	      					<!-- botão de retorno -->
							<a href="painel-noticias.jsp"><button class="fas fa-backward campoRedondo neomorphismo neonHover opacito uiFade" title="Retornar\Cancelar"></button></a>
							<br><br>
							<br><br>
	      					
	      					<table class="tabelaUsuarios neomorphismo uiFade">
	      						
		      					<tr>
		      						<th><a href="https://www.w3schools.com/tags/default.asp" target="_blank">Descrição</a></th>
		      						<th>Efeito</th>
		      						<th>Tag</th>
		      						<th>Resultado</th>
		      					</tr>
		      						
		      					<tr>
		      						<td>
		      							<a href="https://www.w3schools.com/TAGs/tag_hn.asp" target="_blank"><section class="fas fa-search campoRedondo neomorphismo neonHover opacito uiFade"></section></a>
		      						</td>
		      						<td>Título</td>
		      						<td>< h1 ao h6></td>
		      						<td><h3>Título</h3></td>
		      					</tr>
		      					
		      					<tr>
		    						<td>
		      							<a href="https://www.w3schools.com/TAGs/tag_b.asp" target="_blank"><section class="fas fa-search campoRedondo neomorphismo neonHover opacito uiFade"></section></a>
		      						</td>
		      						<td>Negrito</td>
		      						<td>< b></td>
		      						<td><b>Negrito</b></td>
		      					</tr>
		      						
		      					<tr>
		      						<td>
		      							<a href="https://www.w3schools.com/TAGs/tag_i.asp" target="_blank"><section class="fas fa-search campoRedondo neomorphismo neonHover opacito uiFade"></section></a>
		      						</td>
		      						<td>Itálico</td>
		      						<td>< i></td>
		      						<td><i>Itálico</i></td>
		      					</tr>
	      						
		      					<tr>
		      						<td>
		      							<a href="https://www.w3schools.com/TAGs/tag_u.asp" target="_blank"><section class="fas fa-search campoRedondo neomorphismo neonHover opacito uiFade"></section></a>
		      						</td>
		      						<td>Sublinhado</td>
		      						<td>< u></td>
		      						<td><u>Sublinhado</u></td>
		      					</tr>
	      						
		      					<tr>
		      						<td>
		      							<a href="https://www.w3schools.com/TAGs/tag_br.asp" target="_blank"><section class="fas fa-search campoRedondo neomorphismo neonHover opacito uiFade"></section></a>
		      						</td>
		      						<td>Pular Linha</td>
		      						<td>< br></td>
		      						<td><br>Linha Pulada em Cima</td>
		      					</tr>
	      					</table>
						</center>
    				</div>
    			</div>
			</div>
		</section>
		
		<jsp:include page="Include\footer.jsp" />
	</body>
	
	<jsp:include page="Include\script-painel-noticias.jsp" />
	<jsp:include page="Include\Resetar Sessoes\Resetar-Sessoes-Painel.jsp" />
	<jsp:include page="Include\Display Mensagens\Display-Mensagem-Cadastro-Usuario.jsp" />
	<jsp:include page="Include\Display Mensagens\Display-Mensagem-Alteracao-Nickname-Senha.jsp" />
	<jsp:include page="Include\Display Mensagens\Display-Mensagem-Alteracao-Biometria.jsp" />
</html>