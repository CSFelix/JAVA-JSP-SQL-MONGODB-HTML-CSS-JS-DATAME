/*
 * chamada à função de listagem dos usuários na tabela de visualização no painel inicial
 * Assintótica: O(n + t), sendo 'n' a qnt de usuários e 't' o tempo decorrido na comunicação
 * */

$(document).ready(function() {
	$("#botaoAtualizarUsuariosCadastrados").click(function() {
		$.ajax({
			type: "POST",
			url: "Processamento Java\\Processamento-Listar-Usuarios.jsp",
			data: { },
			success: function(data) {
				$("#tabelaUsuariosCadastrados").find("tr:gt(0)").remove();
				$("#tabelaUsuariosCadastrados tr:last").after(data);
			}
		});
	});
});