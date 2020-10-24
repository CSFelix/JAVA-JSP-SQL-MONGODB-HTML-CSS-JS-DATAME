/*
 * encaminha usuário à página de alteração das notícias
 * Assintótica: O(1)
 * */

function redirecionamentoAlterarNoticia(botaoAlterar) {
	botaoAlterar = botaoAlterar;
	uuid_usuario = $(botaoAlterar).data("uuid_noticia");
	
	window.location.replace("cadastro-noticia.jsp?hash_noticia=" + uuid_usuario);
}