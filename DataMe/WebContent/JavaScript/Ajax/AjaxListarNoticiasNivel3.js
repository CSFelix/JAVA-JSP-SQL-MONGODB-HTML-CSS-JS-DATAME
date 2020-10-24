/*
 * chamada à função de listagem das notícias nível 3 na tabela de visualização no painel inicial
 * Assintótica: O(n + t), sendo 'n' a qnt de notícias e 't' o tempo decorrido na comunicação
 * */

$(document).ready(function() {
	$("#botaoAtualizarNoticiasNivel3").click(function() {
		$.ajax({
			type: "POST",
			url: "Include\\Atualizacao Informacoes\\Atualizar-Tabela-Noticias-Nivel-3.jsp",
			data: { },
			success: function(data) {
				$("#tabelaNoticiasNivel3").find("tr:gt(0)").remove();
				$("#tabelaNoticiasNivel3 tr:last").after(data);
			}
		});
	});
});