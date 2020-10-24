/* Capturação das id's dos modais, spans de fechamento e botões de abertura dos modais */

// Dados do Usuário
var modalDados = document.getElementById("modalDados");
var btnDados = document.getElementById("configuracoes");
var spanDados = document.getElementById("fecharModalDados");

//Avatar (alterar foto de pefil)
var modalAvatar = document.getElementById("modalAvatar");
var btnAvatar = document.getElementById("botaoModalAvatar");
var spanAvatar = document.getElementById("fecharModalAvatar");

/* Aberturas dos modais */
btnDados.onclick = function() { modalDados.style.display = "block"; }
btnAvatar.onclick = function() { modalAvatar.style.display = "block"; }

/* Fechamento dos Modais */

// Clique no Span
spanDados.onclick = function() { 
	modalDados.style.display = "none";
	$("#mensagemAlteracaoNicknameEmail").hide();
	$("#mensagemAlteracaoBiometria").hide();
}

spanAvatar.onclick = function() { modalAvatar.style.display = "none"; }

// Clique fora do Modal
window.onclick = function(event) {
	if (event.target == modalDados) { 
		modalDados.style.display = "none";
		$("#mensagemAlteracaoNicknameEmail").hide();
		$("#mensagemAlteracaoBiometria").hide();
	}
	
	else if (event.target == modalAvatar) { modalAvatar.style.display = "none"; }
}

/* Cancelamento de Operações do Modal >> algo que levará ao fechamento do mesmmo */
var btnCancelarModalDados = document.getElementById("cancelarModalDados");
var btnCancelarModalAvatar = document.getElementById("cancelarModalAvatar");

btnCancelarModalDados.onclick = function() { 
	modalDados.style.display = "none";
	$("#mensagemAlteracaoNicknameEmail").hide();
	$("#mensagemAlteracaoBiometria").hide();
}

btnCancelarModalAvatar.onclick = function() { modalAvatar.style.display = "none"; }