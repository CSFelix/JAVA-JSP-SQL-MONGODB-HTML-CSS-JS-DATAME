/*
 * chamada à função de listagem das notícias nível 1 na tabela de visualização no painel inicial
 * Assintótica: O(n + t), sendo 'n' a qnt de notícias e 't' o tempo decorrido na comunicação
 * */

$(document).ready(function() {
	$("#botaoAtualizarNoticiasNivel1").click(function() {
		$.ajax({
			type: "POST",
			url: "Include\\Atualizacao Informacoes\\Atualizar-Tabela-Noticias-Nivel-1.jsp",
			data: { },
			success: function(data) {
				$("#tabelaNoticiasNivel1").find("tr:gt(0)").remove();
				$("#tabelaNoticiasNivel1 tr:last").after(data);
			}
		});
	});
});