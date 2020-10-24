/*
 * encaminha usuário à página de visualização de uma notícia específica
 * Assintótica: O(1)
 * */

function redirecionamentoVisualizarNoticia(botaoAlterar) {
	botaoAlterar = botaoAlterar;
	uuid_noticia = $(botaoAlterar).data("uuid_noticia");
	uuid_usuario_noticia = $(botaoAlterar).data("uuid_usuario_noticia");
	
	window.location.replace("noticia.jsp?hash_noticia=" + uuid_noticia + "&hash_usuario=" + uuid_usuario_noticia);
}