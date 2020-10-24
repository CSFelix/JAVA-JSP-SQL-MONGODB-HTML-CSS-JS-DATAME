/*
 * bloqueio\desbloqueio da conta do usuário dinamicamente
 * Assintótica: O(1)
 * */

// desbloqueado: fas fa-unlock
// bloqueado; fas fa-lock

function animacaoBloqueioUsuario(botao) {
	botao = botao;
	
	// bloqueio
	if ($(botao).hasClass("fa-unlock")) {
		$(botao).removeClass("fa-unlock").addClass("fa-lock");
	}
	
	// desbloqueio
	else {
		$(botao).removeClass("fa-lock").addClass("fa-unlock");
	}
}