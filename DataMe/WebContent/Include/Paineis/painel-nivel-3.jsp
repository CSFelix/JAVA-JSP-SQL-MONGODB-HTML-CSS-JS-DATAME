<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
    
<%@page import="Seguranca.StripHTML" %>    
<%@page import="Bean.UsuarioBean" %>   
    
<!DOCTYPE html>
<html>
	<%
	UsuarioBean usuario = (UsuarioBean) session.getAttribute("usuario_logado");
	
	int acesso_restrito;
	
	try { acesso_restrito = Integer.parseInt(request.getParameter("tipo_acesso")); }
	catch (Exception e) { acesso_restrito = -1; }
	%>
<body>
	<div class="tabs neomorphismo uiFade">
	
		<!-- cabeçalho do painel --> 
  		<div class="tab-header">
			
			<!--  cadastros -->
    		<div class="active primeira-tab opacito">
      			<i class="fa fa-pencil-square-o"></i>
      			<p class="tab-legenda">Cadastros</p>
    		</div>

    		<!-- dados públiccos -->
    		<div class="opacito">
      			<i class="fas fa-folder-open"></i>
      			<p class="tab-legenda">Informações Públicas</p>
    		</div>

			<!-- dados sigilosos -->
    		<div class="opacito">
      			<i class="fas fa-lock"></i>
      			<p class="tab-legenda">Informações Sigilosas</p>
    		</div>

			<!-- dados máximos -->
    		<div class="opacito">
      			<i class="fas fa-user-secret"></i>
      			<p class="tab-legenda">Informações Máximas</p>
    		</div>
    		
    		<!-- ferramentas -->
    		<div class="opacito">
      			<i class="fas fa-tools"></i>
      			<p class="tab-legenda">Ferramentas</p>
    		</div>
  		</div>

		<!-- indicador da tab ativa -->
  		<div class="tab-indicator"></div>

		<!-- conteúdos das tabs -->
  		<div class="tab-body flexCenter">
  		
  			<!-- cadastros -->
    		<div class="active">
      			<center>
	    			<br><br>
	      			<h2>Cadastros</h2>
	      			<br><br>
	      			
	      			<!-- filtros e opções -->
	      			<b class="tag">👤 Nickname:</b>
	      			&nbsp&nbsp&nbsp
					<input id="filtroNickname" class="campoInput opacito neomorphismo neonGeral" type="text" onkeyup="myFunction()">
					<a href="cadastro-usuario.jsp?hash_usuario=none-hash"><button class="fas fa-user-plus campoRedondo neomorphismo neonHover opacito" aria-hidden="true"></button></a>
					<button id="botaoAtualizarUsuariosCadastrados" class="fas fa-sync-alt campoRedondo neomorphismo neonHover opacito" aria-hidden="true"></button>
					<br><br>
						
					<!-- tabela com os dados dos usuários -->
					<!-- 
						fas fa-pencil-alt >> editar dados de usuários
						fas fa-lock >> usuário bloqueado 
						fas fa-lock-open >> usuário desbloqueado
					-->
					<table id="tabelaUsuariosCadastrados" class="tabelaUsuarios neomorphismo uiFade">
						<tr>
							<th>Alterar</th>
							<th>Permissão</th>
							<th>Nível</th>
							<th>Nickname</th>
							<th>Email</th>
						</tr>
						
						<jsp:include page="..\Atualizacao Informacoes\Atualizar-Tabela-Usuarios.jsp" />
					</table>
				</center>
    		</div>

			<!-- dados públicos -->
    		<div>
      			<center>
      				<br><br>
	      			<h2>Dados Públicos</h2>
	      			<br><br>
	      			
	      			<b class="tag">🔍 Título:</b>
	      			&nbsp&nbsp&nbsp
					<input id="filtroNoticiaNivel1" class="campoInput opacito neomorphismo neonGeral" type="text" onkeyup="filtrarTabelaNoticiasVisualizacaoNivel1Titulo()">
					<a href="cadastro-noticia.jsp?hash_noticia=none_hash"><button class="fas fa-paste campoRedondo neomorphismo neonHover opacito" aria-hidden="true"></button></a>
					<button id="botaoAtualizarNoticiasNivel1" class="fas fa-sync-alt campoRedondo neomorphismo neonHover opacito" aria-hidden="true"></button>
					<br><br>
	      			
      				<table id="tabelaNoticiasNivel1" class="tabelaUsuarios neomorphismo uiFade">
						<tr>
							<th>Ler</th>
							<th>Título</th>
							<th>Data Postagem</th>
						</tr>
						
						<jsp:include page="..\Atualizacao Informacoes\Atualizar-Tabela-Noticias-Nivel-1.jsp" />
					</table>
      			</center>
    		</div>
			
			<!-- dados sigilosos -->
    		<div class="flexCenter flexColumnDirection">
      			<center>
      				<br><br>
      				<h2>Dados Sigilosos</h2>
      				<br><br>
      			
      				<%
      				// acesso restrito
      				if (acesso_restrito == 0 || acesso_restrito == -1) {
      				%>
	      				<!-- mensagem de biometria -->
						<p class="mensagemBiometria">🔐 Informações privilegiadas, necessária confirmação biométrica!</p>
						<br><br>
						<a href="http://127.0.0.1:5501/reconhecimento.html?label=<%=usuario.getNickname()%>"><button id="mensagens" class="fas fa-fingerprint campoRedondo neomorphismo neonHover opacito uiFade"></button></a>
      				<%
      				} 
      			
 	     			// acesso liberado
    	  			else {
      				%>
      					
      					<b class="tag">🔍 Título:</b>
	      				&nbsp&nbsp&nbsp
						<input id="filtroNoticiaNivel2" class="campoInput opacito neomorphismo neonGeral" type="text" onkeyup="filtrarTabelaNoticiasVisualizacaoNivel2Titulo()">
						<a href="cadastro-noticia.jsp?hash_noticia=none_hash"><button class="fas fa-paste campoRedondo neomorphismo neonHover opacito" aria-hidden="true"></button></a>
						<button id="botaoAtualizarNoticiasNivel2" class="fas fa-sync-alt campoRedondo neomorphismo neonHover opacito" aria-hidden="true"></button>
						<br><br>
	      			
      					<table id="tabelaNoticiasNivel2" class="tabelaUsuarios neomorphismo uiFade">
							<tr>
								<th>Ler</th>
								<th>Título</th>
								<th>Data Postagem</th>
							</tr>
						
							<jsp:include page="..\Atualizacao Informacoes\Atualizar-Tabela-Noticias-Nivel-2.jsp" />
						</table>
      			
      				<%
      				}
      				%>
      			</center>
    		</div>

			<!-- dados máximos -->
    		<div class="flexCenter flexColumnDirection">
    			<center>
		    		<h2>Dados Máximos</h2>
      				<br><br>
      			
      				<%
      				if (acesso_restrito == 0 || acesso_restrito == -1) {
      				%>
	      				<!-- mensagem de biometria -->
						<p class="mensagemBiometria">🔐 Informações privilegiadas, necessária confirmação biométrica!</p>
						<br><br>
						<a href="http://127.0.0.1:5501/reconhecimento.html?label=<%=usuario.getNickname()%>"><button id="mensagens" class="fas fa-fingerprint campoRedondo neomorphismo neonHover opacito uiFade"></button></a>
      				<%
      				}
      			
      				// acesso liberado
      			 	else {
	      			%>	
      			
      					<b class="tag">🔍 Título:</b>
	      				&nbsp&nbsp&nbsp
						<input id="filtroNoticiaNivel3" class="campoInput opacito neomorphismo neonGeral" type="text" onkeyup="filtrarTabelaNoticiasVisualizacaoNivel3Titulo()">
						<a href="cadastro-noticia.jsp?hash_noticia=none_hash"><button class="fas fa-paste campoRedondo neomorphismo neonHover opacito" aria-hidden="true"></button></a>
						<button id="botaoAtualizarNoticiasNivel3" class="fas fa-sync-alt campoRedondo neomorphismo neonHover opacito" aria-hidden="true"></button>
						<br><br>
	      			
      					<table id="tabelaNoticiasNivel3" class="tabelaUsuarios neomorphismo uiFade">
							<tr>
								<th>Ler</th>
								<th>Título</th>
								<th>Data Postagem</th>
							</tr>
						
							<jsp:include page="..\Atualizacao Informacoes\Atualizar-Tabela-Noticias-Nivel-3.jsp" />
						</table>
      			
    	  			<%
      				 }
      				%>
      			</center>
    		</div>

			<!-- ferramentas -->
    		<div class="flexCenter flexColumnDirection">
      			<h2>Ferramentas</h2>
      			<br><br>
      			<a href="http://localhost:8080/AnnoteMe/index.html" target="_blank"><button class="botao neomorphismo neonHover opacito">AnnoteMe</button></a>
      			<br><br>
      			<a href="http://localhost:8080/ChatMe3.0/HTML/ShareMe/HTML/index.jsp" target="_blank"><button class="botao neomorphismo neonHover opacito">ShareMe</button></a>
    		</div>
    	</div>
	</div>
</body>
</html>