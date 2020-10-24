/*
 * processamento do cadastro de notícias
 * Assintótica(t), sendo 't' o tempo de comunicação com o servidor
 * */

$(document).ready(function() {
	$("#cadastrarNoticia").click(function() {
		var tituloCadastroNoticia = $("#tituloCadastroNoticia").val();
		var descricaoCadastroNoticia = $("#descricaoCadastroNoticia").val();
		var nivelCadastroNoticia = $("#nivelNoticia").val();
		var statusCadastroNoticia = ($("#statusNoticia").hasClass("fas fa-file-alt") ? 0 
							 : $("#statusNoticia").hasClass("far fa-newspaper") ? 1
							 : 2);
		
		/// capturar uuid
		const queryString = window.location.search;
		const urlParams = new URLSearchParams(queryString);
		var uuid_noticia = urlParams.get("hash_noticia");
		
		// verifica se título e descrição foram preenchidos
		if (tituloCadastroNoticia == "" || descricaoCadastroNoticia == "") { alert("Título e Descrição da notícia devem ser preenchidos!"); }
		else {
			$.ajax({
				type: "POST",
				url: "Processamento Java\\Processamento-Cadastrar-Noticia.jsp",
				data: { "titulo": tituloCadastroNoticia, "descricao": descricaoCadastroNoticia,
						"nivel": nivelCadastroNoticia, "status": statusCadastroNoticia,
						"uuidNoticia": uuid_noticia },
				success: function (data) {
					// falha no processamento
					if (data.includes("0")) { $("#mensagemErroProcessamento").show(); }
					
					// sucesso no processamento
					else {
						$("#mensagemErroProcessamento").hide();
						window.location.replace("painel-noticias.jsp");
					}
				}
					
			});
		}
	});
});
$("#mensagemErroProcessamento").hide();