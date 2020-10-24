/*
 * muda status da notícia dinamicamente
 * Assintótica: O(3) >> O(1)
 * */

// edição: fas fa-file-alt
// publicação: far fa-newspaper
// exclusão: fas fa-trash

function animacaoStatusNoticia(botao) {
	// edição >> publicação >> exclusão >> edição...
	botao = botao;
	
	// edição para publicação
	if ($(botao).hasClass("fas fa-file-alt")) { 
		$(botao).removeClass("fas fa-file-alt").addClass("far fa-newspaper").attr("title", "Publicada"); 
		$("#mensagemStatus").text("🎉 Notícia Publicada!");
	}
	
	// publicação para exclusão
	else if ($(botao).hasClass("far fa-newspaper")) { 
		$(botao).removeClass("far fa-newspaper").addClass("fas fa-trash").attr("title", "Excluída");
		$("#mensagemStatus").text("🎉 Notícia Excluída!");
	}
	
	// exclusão para edição
	else { 
		$(botao).removeClass("fas fa-trash").addClass("fas fa-file-alt").attr("title", "Em Edição"); 
		$("#mensagemStatus").text("🎉 Notícia Em Edição!");
	}
	
}