/*
 * bloqueio dos usuarios de maneira diâmica na tabela do painel inicial
 * Assintótica: O(t), sendo 't' o tempo decorrido na comunicação
 * */

function listaBloqueioUsuario(botaoBloqueio) {
	botaoBloqueio = botaoBloqueio;
	uuid_usuario = $(botaoBloqueio).data("uuid_usuario");
	operacao = ($(botaoBloqueio).hasClass("fa-unlock") ? 0 : 1);
	
	$.ajax({
		method: "POST",
		url: "Processamento Java\\Processamento-Bloquear-Usuario.jsp",
		data: { "uuidUsuario": uuid_usuario, "operacao": operacao },
		success: function(data) { }
	});
}