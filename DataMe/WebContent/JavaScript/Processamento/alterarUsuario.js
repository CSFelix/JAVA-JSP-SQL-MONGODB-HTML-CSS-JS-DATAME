/*
 * encaminha usuário à página de alteração dos dados do usuário
 * Assintótica: O(1)
 * */

function redirecionamentoAlterarUsuario(botaoAlterar) {
	botaoAlterar = botaoAlterar;
	uuid_usuario = $(botaoAlterar).data("uuid_usuario");
	
	window.location.replace("cadastro-usuario.jsp?hash_usuario=" + uuid_usuario);
}