package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import BancoDados.ConexaoMySQL;
import Bean.NoticiaPostBean;

public class NoticiaPostDao {
	/*
	 * classe responsável pela transferência e comunicação de informações com o banco de dados relacionadas às notícias
	 * criadas pelos usuários
	 * */
	public NoticiaPostDao() {}
	
	/*
	 * Funções Principais
	 * */
	public boolean CadastrarNoticia(NoticiaPostBean noticia) {
		/*
		 * Insere registro de noticia
		 * Assintótica: O(1)
		 * */
		try {
			String sql = "INSERT INTO noticia_post(uuid_noticia, uuid_usuario, status, nivel, titulo, descricao)"
					   + " VALUES(UUID_TO_BIN(UUID()), UUID_TO_BIN(?), ?, ?, ?, ?);";
			Connection conexao = ConexaoMySQL.AbrirConexao();
			PreparedStatement smtp = conexao.prepareStatement(sql);
			
			smtp.setString(1, noticia.getUuidUsuario());
			smtp.setInt(2, noticia.getStatus());
			smtp.setInt(3, noticia.getNivel());
			smtp.setString(4, noticia.getTitulo());
			smtp.setString(5, noticia.getDescricao());
			
			smtp.executeUpdate();
			smtp.close();
			ConexaoMySQL.FecharConexao(conexao);
				
			return true;
		}
		catch (SQLException e) { 
			e.printStackTrace(); 
			return false;
		}
	}
	
	public boolean AlterarNoticia(NoticiaPostBean noticia) {
		/*
		 * Insere registro de noticia
		 * Assintótica: O(1)
		 * */
		try {
			String sql = "UPDATE noticia_post SET"
					   + " status = ?, nivel = ?, data_hora_postagem = NOW(), titulo = ?, descricao = ?"
					   + " WHERE uuid_noticia = UUID_TO_BIN(?) AND uuid_usuario = UUID_TO_BIN(?)";
			Connection conexao = ConexaoMySQL.AbrirConexao();
			PreparedStatement smtp = conexao.prepareStatement(sql);
			
			smtp.setInt(1, noticia.getStatus());
			smtp.setInt(2, noticia.getNivel());
			smtp.setString(3, noticia.getTitulo());
			smtp.setString(4, noticia.getDescricao());
			smtp.setString(5, noticia.getUuidNoticiaPost());
			smtp.setString(6, noticia.getUuidUsuario());
			
			smtp.executeUpdate();
			smtp.close();
			ConexaoMySQL.FecharConexao(conexao);
				
			return true;
		}
		catch (SQLException e) { 
			e.printStackTrace(); 
			return false;
		}
	}
	
	public NoticiaPostBean SelecionarNoticia(NoticiaPostBean noticia) {
		/*
		 * Seleciona registro de notícia específico
		 * Assintótica: O(1)
		 * */
		try {
			String sql = "SELECT status, nivel, data_hora_postagem, titulo, descricao"
					   + " FROM noticia_post"
					   + " WHERE uuid_noticia = UUID_TO_BIN(?) AND uuid_usuario = UUID_TO_BIN(?);";
			Connection conexao = ConexaoMySQL.AbrirConexao();
			PreparedStatement smtp = conexao.prepareStatement(sql);
			NoticiaPostBean retorno = new NoticiaPostBean();
			ResultSet rs;
			
			smtp.setString(1, noticia.getUuidNoticiaPost());
			smtp.setString(2, noticia.getUuidUsuario());
			rs = smtp.executeQuery();
			
			if (rs.next()) {
				retorno.setStatus(rs.getInt("status"));
				retorno.setNivel(rs.getInt("nivel"));
				retorno.setDataHoraPostagem(rs.getString("data_hora_postagem"));
				retorno.setTitulo(rs.getString("titulo"));
				retorno.setDescricao(rs.getString("descricao"));
			}
			
			rs.close();
			smtp.close();
			ConexaoMySQL.FecharConexao(conexao);
				
			return retorno;
		}
		catch (SQLException e) { 
			e.printStackTrace(); 
			return null;
		}
	}
	
	public ArrayList<NoticiaPostBean> ListarNoticiasEdicao(NoticiaPostBean noticia) {
		/*
		 * Seleciona todas as notícias em edição
		 * Assintótica: O(n), sendo 'n' a quantidade de notícias em edição do usuário
		 * */
		try {
			String sql = "SELECT BIN_TO_UUID(uuid_noticia), nivel, titulo, descricao"
					   + " FROM noticia_post"
					   + " WHERE uuid_usuario = UUID_TO_BIN(?) AND status = 0;";
			Connection conexao = ConexaoMySQL.AbrirConexao();
			PreparedStatement smtp = conexao.prepareStatement(sql);
			ArrayList<NoticiaPostBean> lista_noticias = new ArrayList<NoticiaPostBean>();
			ResultSet rs;
			
			smtp.setString(1, noticia.getUuidUsuario());
			rs = smtp.executeQuery();
			
			while (rs.next()) {
				NoticiaPostBean post = new NoticiaPostBean();
				post.setUuidNoticiaPost(rs.getString("BIN_TO_UUID(uuid_noticia)"));
				post.setNivel(rs.getInt("nivel"));
				post.setTitulo(rs.getString("titulo"));
				
				lista_noticias.add(post);
			}
			
			rs.close();
			smtp.close();
			ConexaoMySQL.FecharConexao(conexao);
				
			return lista_noticias;
		}
		catch (SQLException e) { 
			e.printStackTrace(); 
			return null;
		}
	}
	
	public ArrayList<NoticiaPostBean> ListarNoticiasPublicadas(NoticiaPostBean noticia) {
		/*
		 * Seleciona todas as notícias publicadas
		 * Assintótica: O(n), sendo 'n' a quantidade de notícias publicadas do usuário
		 * */
		try {
			String sql = "SELECT BIN_TO_UUID(uuid_noticia), nivel, titulo, descricao"
					   + " FROM noticia_post"
					   + " WHERE uuid_usuario = UUID_TO_BIN(?) AND status = 1;";
			Connection conexao = ConexaoMySQL.AbrirConexao();
			PreparedStatement smtp = conexao.prepareStatement(sql);
			ArrayList<NoticiaPostBean> lista_noticias = new ArrayList<NoticiaPostBean>();
			ResultSet rs;
			
			smtp.setString(1, noticia.getUuidUsuario());
			rs = smtp.executeQuery();
			
			while (rs.next()) {
				NoticiaPostBean post = new NoticiaPostBean();
				post.setUuidNoticiaPost(rs.getString("BIN_TO_UUID(uuid_noticia)"));
				post.setNivel(rs.getInt("nivel"));
				post.setTitulo(rs.getString("titulo"));
				
				lista_noticias.add(post);
			}
			
			rs.close();
			smtp.close();
			ConexaoMySQL.FecharConexao(conexao);
				
			return lista_noticias;
		}
		catch (SQLException e) { 
			e.printStackTrace(); 
			return null;
		}
	}
	
	public ArrayList<NoticiaPostBean> ListarNoticiasDeletadas(NoticiaPostBean noticia) {
		/*
		 * Seleciona todas as notícias deletadas
		 * Assintótica: O(n), sendo 'n' a quantidade de notícias deletadas pelo usuário
		 * */
		try {
			String sql = "SELECT BIN_TO_UUID(uuid_noticia), nivel, titulo, descricao"
					   + " FROM noticia_post"
					   + " WHERE uuid_usuario = UUID_TO_BIN(?) AND status = 2;";
			Connection conexao = ConexaoMySQL.AbrirConexao();
			PreparedStatement smtp = conexao.prepareStatement(sql);
			ArrayList<NoticiaPostBean> lista_noticias = new ArrayList<NoticiaPostBean>();
			ResultSet rs;
			
			smtp.setString(1, noticia.getUuidUsuario());
			rs = smtp.executeQuery();
			
			while (rs.next()) {
				NoticiaPostBean post = new NoticiaPostBean();
				post.setUuidNoticiaPost(rs.getString("BIN_TO_UUID(uuid_noticia)"));
				post.setNivel(rs.getInt("nivel"));
				post.setTitulo(rs.getString("titulo"));
				
				lista_noticias.add(post);
			}
			
			rs.close();
			smtp.close();
			ConexaoMySQL.FecharConexao(conexao);
				
			return lista_noticias;
		}
		catch (SQLException e) { 
			e.printStackTrace(); 
			return null;
		}
	}
	
	
	
	public ArrayList<NoticiaPostBean> ListarPreviewNoticiasNivel1() {
		/*
		 * Seleciona todas as notícias nível 1 para a tabela de visualização
		 * Assintótica: O(n), sendo 'n' a quantidade total de notícias nível 1
		 * */
		try {
			String sql = "SELECT BIN_TO_UUID(uuid_noticia), BIN_TO_UUID(uuid_usuario), titulo, data_hora_postagem"
					   + " FROM noticia_post"
					   + " WHERE status = 1 AND nivel = 1;";
			Connection conexao = ConexaoMySQL.AbrirConexao();
			PreparedStatement smtp = conexao.prepareStatement(sql);
			ArrayList<NoticiaPostBean> lista_noticias = new ArrayList<NoticiaPostBean>();
			ResultSet rs;
			
			rs = smtp.executeQuery();
			
			while (rs.next()) {
				NoticiaPostBean post = new NoticiaPostBean();
				post.setUuidNoticiaPost(rs.getString("BIN_TO_UUID(uuid_noticia)"));		
				post.setUuidUsuario(rs.getString("BIN_TO_UUID(uuid_usuario)"));
				post.setTitulo(rs.getString("titulo"));
				post.setDataHoraPostagem(rs.getString("data_hora_postagem"));
				
				lista_noticias.add(post);
			}
			
			rs.close();
			smtp.close();
			ConexaoMySQL.FecharConexao(conexao);
				
			return lista_noticias;
		}
		catch (SQLException e) { 
			e.printStackTrace(); 
			return null;
		}
	}
	
	public ArrayList<NoticiaPostBean> ListarPreviewNoticiasNivel2() {
		/*
		 * Seleciona todas as notícias nível 2 para visualização na tabela
		 * Assintótica: O(n), sendo 'n' a qnt de notícias
		 * */
		try {
			String sql = "SELECT BIN_TO_UUID(uuid_noticia), BIN_TO_UUID(uuid_usuario), titulo, data_hora_postagem"
					   + " FROM noticia_post"
					   + " WHERE status = 1 AND nivel = 2;";
			Connection conexao = ConexaoMySQL.AbrirConexao();
			PreparedStatement smtp = conexao.prepareStatement(sql);
			ArrayList<NoticiaPostBean> lista_noticias = new ArrayList<NoticiaPostBean>();
			ResultSet rs;
			
			rs = smtp.executeQuery();
			
			while (rs.next()) {
				NoticiaPostBean post = new NoticiaPostBean();
				post.setUuidNoticiaPost(rs.getString("BIN_TO_UUID(uuid_noticia)"));
				post.setUuidUsuario(rs.getString("BIN_TO_UUID(uuid_usuario)"));	
				post.setTitulo(rs.getString("titulo"));
				post.setDataHoraPostagem(rs.getString("data_hora_postagem"));
				
				lista_noticias.add(post);
			}
			
			rs.close();
			smtp.close();
			ConexaoMySQL.FecharConexao(conexao);
				
			return lista_noticias;
		}
		catch (SQLException e) { 
			e.printStackTrace(); 
			return null;
		}
	}
	
	public ArrayList<NoticiaPostBean> ListarPreviewNoticiasNivel3() {
		/*
		 * Seleciona todas as notícias nível 3 para visualização na tabela
		 * Assintótica: O(n), sendo 'n' a quantidade de notícias
		 * */
		try {
			String sql = "SELECT BIN_TO_UUID(uuid_noticia), BIN_TO_UUID(uuid_usuario), titulo, data_hora_postagem"
					   + " FROM noticia_post"
					   + " WHERE status = 1 AND nivel = 3;";
			Connection conexao = ConexaoMySQL.AbrirConexao();
			PreparedStatement smtp = conexao.prepareStatement(sql);
			ArrayList<NoticiaPostBean> lista_noticias = new ArrayList<NoticiaPostBean>();
			ResultSet rs;
			
			rs = smtp.executeQuery();
			
			while (rs.next()) {
				NoticiaPostBean post = new NoticiaPostBean();
				post.setUuidNoticiaPost(rs.getString("BIN_TO_UUID(uuid_noticia)"));				
				post.setUuidUsuario(rs.getString("BIN_TO_UUID(uuid_usuario)"));	
				post.setTitulo(rs.getString("titulo"));
				post.setDataHoraPostagem(rs.getString("data_hora_postagem"));
				
				lista_noticias.add(post);
			}
			
			rs.close();
			smtp.close();
			ConexaoMySQL.FecharConexao(conexao);
				
			return lista_noticias;
		}
		catch (SQLException e) { 
			e.printStackTrace(); 
			return null;
		}
	}
	
	/*
	 * Funções Secundárias
	 * */
}
