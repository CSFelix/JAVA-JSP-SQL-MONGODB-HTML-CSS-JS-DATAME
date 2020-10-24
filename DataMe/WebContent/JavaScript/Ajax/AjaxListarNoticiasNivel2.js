/*
 * chamada à função de listagem das notícias nível 2 na tabela de visualização no painel inicial
 * Assintótica: O(n + t), sendo 'n' a qnt de notícias e 't' o tempo decorrido na comunicação
 * */

$(document).ready(function() {
	$("#botaoAtualizarNoticiasNivel2").click(function() {
		$.ajax({
			type: "POST",
			url: "Include\\Atualizacao Informacoes\\Atualizar-Tabela-Noticias-Nivel-2.jsp",
			data: { },
			success: function(data) {
				$("#tabelaNoticiasNivel2").find("tr:gt(0)").remove();
				$("#tabelaNoticiasNivel2 tr:last").after(data);
			}
		});
	});
});