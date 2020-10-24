package Bean;

public class NoticiaPostBean {
	/*
	 * Classe responsável por armazenar os dados das notícias postadas pelos usuários:
	 * 
	 * uuid_noticia_post
	 * uuid_usuario
	 * status  // 0 >> em edição, 1 >> postado, 2 >> excluído	
	 * nivel
	 * 
	 * data_hora_postagem
	 * titulo
	 * descrição >> a notícia em si
	 * */
	public NoticiaPostBean() {}
	
	String uuid_noticia_post;
	String uuid_usuario;
	int status;
	int nivel;
	
	String data_hora_postagem;
	String titulo;
	String descricao;
	
	public String getUuidNoticiaPost() { return uuid_noticia_post; }
	public void setUuidNoticiaPost(String uuid) { this.uuid_noticia_post = uuid; }
	
	public String getUuidUsuario() { return uuid_usuario; }
	public void setUuidUsuario(String uuid) { this.uuid_usuario = uuid; }
	
	public int getStatus() { return status; }
	public void setStatus(int status) { this.status = status; }
	
	public int getNivel() { return nivel; }
	public void setNivel(int nivel) { this.nivel = nivel; }
	
	public String getDataHoraPostagem() { return this.data_hora_postagem; }
	public void setDataHoraPostagem(String data_hora) { this.data_hora_postagem = data_hora; }
	
	public String getTitulo() { return titulo; }
	public void setTitulo(String titulo) { this.titulo = titulo; }
	
	public String getDescricao() { return descricao; }
	public void setDescricao(String descricao) { this.descricao = descricao; }
}
