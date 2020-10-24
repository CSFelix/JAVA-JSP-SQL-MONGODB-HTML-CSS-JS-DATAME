<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>   
    
<!DOCTYPE html>
<html>
<body>
	<div class="tabs neomorphismo uiFade">
	
		<!-- cabeçalho do painel --> 
  		<div class="tab-header">
			
    		<!-- dados públiccos -->
    		<div class="active primeira-tab opacito">
      			<i class="fas fa-folder-open"></i>
      			<p class="tab-legenda">Informações Públicas</p>
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
 
			<!-- dados públicos -->
    		<div class="active">
      			<center>
      				<br><br>
	      			<h2>Dados Públicos</h2>
	      			<br><br>
	      			
	      			<b class="tag">🔍 Título:</b>
	      			&nbsp&nbsp&nbsp
					<input id="filtroNoticiaNivel1" class="campoInput opacito neomorphismo neonGeral" type="text" onkeyup="filtrarTabelaNoticiasVisualizacaoNivel1Titulo()">
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