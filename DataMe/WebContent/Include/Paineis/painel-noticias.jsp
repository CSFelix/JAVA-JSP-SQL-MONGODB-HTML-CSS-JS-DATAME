<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
<!DOCTYPE html>
<html>
<body>
	<div class="tabs neomorphismo uiFade">
	
		<!-- cabeçalho do painel --> 
  		<div class="tab-header">
			
			<!--  notícias edição -->
    		<div class="active primeira-tab opacito">
      			<i class="fa fa-pencil-square-o"></i>
      			<p class="tab-legenda">Notícias Edição</p>
    		</div>

    		<!-- notícias publicadas -->
    		<div class="opacito">
      			<i class="fas fa-check-circle"></i>
      			<p class="tab-legenda">Notícias Publicadas</p>
    		</div>

			<!-- notícias deletadas -->
    		<div class="opacito">
      			<i class="fas fa-trash-alt"></i>
      			<p class="tab-legenda">Notícias Deletadas</p>
    		</div>
  		</div>

		<!-- indicador da tab ativa -->
  		<div class="tab-indicator"></div>

		<!-- conteúdos das tabs -->
  		<div class="tab-body flexCenter">
  		
  			<!-- notícias edição -->
    		<div class="active">
      			<center>
	    			<br><br>
	      			<h2>Notícias Edição</h2>
	      			<br><br>
	      			
	      			<!-- filtros e opções -->
	      			<b class="tag">🔍 Título:</b>
	      			&nbsp&nbsp&nbsp
					<input id="filtroTituloCadastrados" class="campoInput opacito neomorphismo neonGeral" type="text" onkeyup="filtrarTabelaNoticiasEdicaoTitulo()">
					<a href="cadastro-noticia.jsp?hash_noticia=none_hash"><button class="fas fa-plus campoRedondo neomorphismo neonHover opacito" aria-hidden="true"></button></a>
					<br><br>
						
					<!-- tabela com os dados dos usuários -->
					<table id="tabelaNoticiasCadastradas" class="tabelaUsuarios neomorphismo uiFade">
						<tr>
							<th>Alterar</th>
							<th>Nível</th>
							<th>Título</th>
						</tr>
						
						<jsp:include page="..\Atualizacao Informacoes\Atualizar-Tabelas-Noticias-Edicao.jsp" />
					</table>
				</center>
    		</div>

			<!-- notícias publicadas -->
    		<div>
      			<center>
	    			<br><br>
	      			<h2>Notícias Publicadas</h2>
	      			<br><br>
	      			
	      			<!-- filtros e opções -->
	      			<b class="tag">🔍 Título:</b>
	      			&nbsp&nbsp&nbsp
					<input id="filtroTituloPublicados" class="campoInput opacito neomorphismo neonGeral" type="text" onkeyup="filtrarTabelaNoticiasPublicadasTitulo()">
					<br><br>
						
					<!-- tabela com os dados dos usuários -->
					<table id="tabelaNoticiasPublicadas" class="tabelaUsuarios neomorphismo uiFade">
						<tr>
							<th>Alterar</th>
							<th>Nível</th>
							<th>Título</th>
						</tr>
						
						<jsp:include page="..\Atualizacao Informacoes\Atualizar-Tabelas-Noticias-Publicadas.jsp" />
					</table>
				</center>
    		</div>
			
			<!-- notícias deletadas -->
    		<div class="flexCenter flexColumnDirection">
      			<center>
	    			<br><br>
	      			<h2>Notícias Deleção</h2>
	      			<br><br>
	      			
	      			<!-- filtros e opções -->
	      			<b class="tag">🔍 Título:</b>
	      			&nbsp&nbsp&nbsp
					<input id="filtroTituloDeletados" class="campoInput opacito neomorphismo neonGeral" type="text" onkeyup="filtrarTabelaNoticiasDeletadasTitulo()">
					<br><br>
						
					<!-- tabela com os dados dos usuários -->
					<table id="tabelaNoticiasDeletadas" class="tabelaUsuarios neomorphismo uiFade">
						<tr>
							<th>Alterar</th>
							<th>Nível</th>
							<th>Título</th>
						</tr>
						
						<jsp:include page="..\Atualizacao Informacoes\Atualizar-Tabelas-Noticias-Deletadas.jsp" />
					</table>
				</center>
    		</div>
    	</div>
	</div>
</body>
</html>