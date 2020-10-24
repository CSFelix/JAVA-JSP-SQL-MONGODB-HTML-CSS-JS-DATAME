/*
 * filtro das notícias na tabela de visualização pelo título
 * Assintótica: O(n), sendo 'n' a quantidade de notícias
 * */

function filtrarTabelaNoticiasVisualizacaoNivel1Titulo() {
	var titulo, filtro, tabela, tr, td, i, valorTituloTabela;
	titulo = document.getElementById("filtroNoticiaNivel1");
	filtro = titulo.value.toUpperCase();
	tabela = document.getElementById("tabelaNoticiasNivel1");
	tr = tabela.getElementsByTagName("tr");
	
	for (i = 0; i < tr.length; i++) {
		td = tr[i].getElementsByTagName("td")[1];
   
		if (td) { 
			valorTituloTabela = td.textContent || td.innerText;
			
			if (valorTituloTabela.toUpperCase().indexOf(filtro) > -1) { tr[i].style.display = ""; } 
			else { tr[i].style.display = "none"; }
		}       
	}
}

function filtrarTabelaNoticiasVisualizacaoNivel2Titulo() {
	var titulo, filtro, tabela, tr, td, i, valorTituloTabela;
	titulo = document.getElementById("filtroNoticiaNivel2");
	filtro = titulo.value.toUpperCase();
	tabela = document.getElementById("tabelaNoticiasNivel2");
	tr = tabela.getElementsByTagName("tr");
	
	for (i = 0; i < tr.length; i++) {
		td = tr[i].getElementsByTagName("td")[1];
   
		if (td) { 
			valorTituloTabela = td.textContent || td.innerText;
			
			if (valorTituloTabela.toUpperCase().indexOf(filtro) > -1) { tr[i].style.display = ""; } 
			else { tr[i].style.display = "none"; }
		}       
	}
}

function filtrarTabelaNoticiasVisualizacaoNivel3Titulo() {
	var titulo, filtro, tabela, tr, td, i, valorTituloTabela;
	titulo = document.getElementById("filtroNoticiaNivel3");
	filtro = titulo.value.toUpperCase();
	tabela = document.getElementById("tabelaNoticiasNivel3");
	tr = tabela.getElementsByTagName("tr");
	
	for (i = 0; i < tr.length; i++) {
		td = tr[i].getElementsByTagName("td")[1];
   
		if (td) { 
			valorTituloTabela = td.textContent || td.innerText;
			
			if (valorTituloTabela.toUpperCase().indexOf(filtro) > -1) { tr[i].style.display = ""; } 
			else { tr[i].style.display = "none"; }
		}       
	}
}

function filtrarTabelaNoticiasEdicaoTitulo() {
	var titulo, filtro, tabela, tr, td, i, valorTituloTabela;
	titulo = document.getElementById("filtroTituloCadastrados");
	filtro = titulo.value.toUpperCase();
	tabela = document.getElementById("tabelaNoticiasCadastradas");
	tr = tabela.getElementsByTagName("tr");
	
	for (i = 0; i < tr.length; i++) {
		td = tr[i].getElementsByTagName("td")[2];
   
		if (td) { 
			valorTituloTabela = td.textContent || td.innerText;
			
			if (valorTituloTabela.toUpperCase().indexOf(filtro) > -1) { tr[i].style.display = ""; } 
			else { tr[i].style.display = "none"; }
		}       
	}
}

function filtrarTabelaNoticiasPublicadasTitulo() {
	var titulo, filtro, tabela, tr, td, i, valorTituloTabela;
	titulo = document.getElementById("filtroTituloPublicados");
	filtro = titulo.value.toUpperCase();
	tabela = document.getElementById("tabelaNoticiasPublicadas");
	tr = tabela.getElementsByTagName("tr");
	
	for (i = 0; i < tr.length; i++) {
		td = tr[i].getElementsByTagName("td")[2];
   
		if (td) { 
			valorTituloTabela = td.textContent || td.innerText;
			
			if (valorTituloTabela.toUpperCase().indexOf(filtro) > -1) { tr[i].style.display = ""; } 
			else { tr[i].style.display = "none"; }
		}       
	}
}

function filtrarTabelaNoticiasDeletadasTitulo() {
	var titulo, filtro, tabela, tr, td, i, valorTituloTabela;
	titulo = document.getElementById("filtroTituloDeletados");
	filtro = titulo.value.toUpperCase();
	tabela = document.getElementById("tabelaNoticiasDeletadas");
	tr = tabela.getElementsByTagName("tr");
	
	for (i = 0; i < tr.length; i++) {
		td = tr[i].getElementsByTagName("td")[2];
   
		if (td) { 
			valorTituloTabela = td.textContent || td.innerText;
			
			if (valorTituloTabela.toUpperCase().indexOf(filtro) > -1) { tr[i].style.display = ""; } 
			else { tr[i].style.display = "none"; }
		}       
	}
}

