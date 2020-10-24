package Dao;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import BancoDados.ConexaoMySQL;
import Bean.UsuarioBean;

public class UsuarioDao {
	public UsuarioDao() { }
	
	
	/*
	 * M�todos Principais (Vis�veis)
	 * 
	 * */
	
	public String SelecionarNickname(String uuid_usuario) {
		/*
		 * Seleciona nickanme de usu�rios via uuid
		 * Assint�tica: O(1)
		 * */
		try {
			String sql = "SELECT nickname"
					   + " FROM usuario"
					   + " WHERE uuid_usuario = UUID_TO_BIN(?);";
			Connection conexao = ConexaoMySQL.AbrirConexao();
			PreparedStatement smtp = conexao.prepareStatement(sql);
			String retorno;
			
			smtp.setString(1, uuid_usuario);
			ResultSet rs = smtp.executeQuery();
			
			// Usu�rio encontrado
			if (rs.next()) {
				retorno = rs.getString("nickname");
				
				smtp.close();
				ConexaoMySQL.FecharConexao(conexao);
				return retorno;
			}
						
			// Usu�rio n�o encontrado
			else { 
				rs.close();
				smtp.close();
				ConexaoMySQL.FecharConexao(conexao);
				return null; 
			}
			
		}
		catch (SQLException e) { 
			e.printStackTrace(); 
			return null;
		}
	}
	
	public UsuarioBean SelecionarUsuarioNoticia(String uuid_usuario) {
		/*
		 * Seleciona usu�rio no cadastro
		 * Assint�tica: O(1)
		 * */
		try {
			String sql = "SELECT BIN_TO_UUID(uuid_usuario), email, nickname"
					   + " FROM usuario"
					   + " WHERE uuid_usuario = UUID_TO_BIN(?);";
			UsuarioBean retorno = new UsuarioBean();
			Connection conexao = ConexaoMySQL.AbrirConexao();
			PreparedStatement smtp = conexao.prepareStatement(sql);
			
			smtp.setString(1, uuid_usuario);
			ResultSet rs = smtp.executeQuery();
			
			// Usu�rio encontrado
			if (rs.next()) {
				retorno.setUuid(rs.getString("BIN_TO_UUID(uuid_usuario)"));
				retorno.setEmail(rs.getString("email"));
				retorno.setNickname(rs.getString("nickname"));
				
				smtp.close();
				ConexaoMySQL.FecharConexao(conexao);
				return retorno;
			}
						
			// Usu�rio n�o encontrado
			else { 
				rs.close();
				smtp.close();
				ConexaoMySQL.FecharConexao(conexao);
				return null; 
			}
			
		}
		catch (SQLException e) { 
			e.printStackTrace(); 
			return null;
		}
	}
	
	public UsuarioBean SelecionarUsuario(String uuid_usuario) {
		/*
		 * Seleciona usu�rio no cadastro
		 * Assint�tica: O(1)
		 * */
		try {
			String sql = "SELECT CONVERT(foto_reconhecimento USING utf8), nickname, email, nivel, bloqueado"
					   + " FROM usuario"
					   + " WHERE uuid_usuario = UUID_TO_BIN(?);";
			UsuarioBean retorno = new UsuarioBean();
			Connection conexao = ConexaoMySQL.AbrirConexao();
			PreparedStatement smtp = conexao.prepareStatement(sql);
			
			smtp.setString(1, uuid_usuario);
			ResultSet rs = smtp.executeQuery();
			
			// Usu�rio encontrado
			if (rs.next()) {
				retorno.setFotoReconhecimento(rs.getString("CONVERT(foto_reconhecimento USING utf8)"));
				retorno.setNickname(rs.getString("nickname"));
				retorno.setEmail(rs.getString("email"));
				retorno.setNivel(rs.getInt("nivel"));
				retorno.setBloqueado(rs.getInt("bloqueado"));
				
				smtp.close();
				ConexaoMySQL.FecharConexao(conexao);
				return retorno;
			}
						
			// Usu�rio n�o encontrado
			else { 
				rs.close();
				smtp.close();
				ConexaoMySQL.FecharConexao(conexao);
				return null; 
			}
			
		}
		catch (SQLException e) { 
			e.printStackTrace(); 
			return null;
		}
	}
	
	public boolean BloquearUsuario(String uuid_usuario, int operacao) {
		/*
		 * Bloqueio de Usu�rio
		 * Assint�tica: O(1)
		 * */
		try {
			String sql = "UPDATE usuario SET"
					   + " bloqueado = ?"
					   + " WHERE uuid_usuario = UUID_TO_BIN(?);";
			Connection conexao = ConexaoMySQL.AbrirConexao();
			PreparedStatement smtp = conexao.prepareStatement(sql);
			
			smtp.setInt(1, operacao);
			smtp.setString(2, uuid_usuario);
			
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
	
	public ArrayList<UsuarioBean> ListarUsuarios(String uuid_usuario_logado) {
		/*
		 * Altera��o dados do usu�rio
		 * Assint�tica: O(n - 1) >> sendo 'n' a qnt de usu�rios cadastrados
		 * */
		try {
			ArrayList<UsuarioBean> lista_usuarios = new ArrayList<UsuarioBean>();
			String sql = "SELECT CONVERT(foto_reconhecimento USING utf8), BIN_TO_UUID(uuid_usuario), bloqueado, nivel, nickname, email"
						 + " FROM usuario"
						 + " WHERE uuid_usuario != UUID_TO_BIN(?);";
			Connection conexao = ConexaoMySQL.AbrirConexao();
			PreparedStatement smtp = conexao.prepareStatement(sql);
			
			smtp.setString(1, uuid_usuario_logado);
			ResultSet rs = smtp.executeQuery();
			
			// Usu�rios Encontrados
			while (rs.next()) {
				UsuarioBean usuario = new UsuarioBean();
				usuario.setFotoReconhecimento(rs.getString("CONVERT(foto_reconhecimento USING utf8)"));
				usuario.setUuid(rs.getString("BIN_TO_UUID(uuid_usuario)"));
				usuario.setBloqueado(rs.getInt("bloqueado"));
				usuario.setNivel(rs.getInt("nivel"));
				usuario.setNickname(rs.getString("nickname"));
				usuario.setEmail(rs.getString("email"));
				
				lista_usuarios.add(usuario);
			}
			
			return lista_usuarios;
		}
			
		catch (SQLException e) { 
			e.printStackTrace(); 
			return null;
		}
	}
	
	public int AlterarDados(UsuarioBean usuario) {
		/*
		 * Altera��o dados do usu�rio
		 * Assint�tica: O(4) >> O(1)
		 * */
		try {
			boolean email_cadastrado = !ChecarEmailExcetoUsuarioLogado(usuario.getEmail(), usuario.getUuid());
			boolean nickname_cadastrado = !ChecarNicknameExcetoUsuarioLogado(usuario.getNickname(), usuario.getUuid());
			
			// email ou nickname j� cadastrados
			if (email_cadastrado || nickname_cadastrado) {
				
				// email e nickname j� cadastrados
				if (email_cadastrado && nickname_cadastrado) {
					return 1;
				}
				
				// email j� cadastrados
				else if (email_cadastrado) {
					return 2;
				}
				
				// nickname j� cadastrados
				else { return 3; }
			}
			
			// Caso o email e o nickname n�o estejam j� cadastrados
			// os dados s�o atualizados
			else {
				String sql = "UPDATE usuario SET"
						   + " nickname = ?, email = ?"
						   + " WHERE uuid_usuario = UUID_TO_BIN(?);";
				Connection conexao = ConexaoMySQL.AbrirConexao();
				PreparedStatement smtp = conexao.prepareStatement(sql);
				
					
				// Altera��o dos dados do usu�rio
				smtp.setString(1, usuario.getNickname());
				smtp.setString(2, usuario.getEmail());
				smtp.setString(3, usuario.getUuid());
				
				smtp.executeUpdate();
				smtp.close();
				ConexaoMySQL.FecharConexao(conexao);
				
				return 4;
			}
			
		}
		catch (SQLException e) { 
			e.printStackTrace(); 
			return 0;
		}
	}
	
	public int AlterarDadosUsariosCadastrados(UsuarioBean usuario) {
		/*
		 * Altera��o dados do usu�rio
		 * Assint�tica: O(4) >> O(1)
		 * */
		try {
			String sql = "UPDATE usuario SET"
					   + " nickname = ?, email = ?, bloqueado = ?, nivel = ?"
					   + " WHERE uuid_usuario = UUID_TO_BIN(?);";
			Connection conexao = ConexaoMySQL.AbrirConexao();
			PreparedStatement smtp = conexao.prepareStatement(sql);
			
			boolean nickname_tamanho = !((usuario.getNickname().length() >= 5) && (usuario.getNickname().length() <= 15));
			boolean email_tamanho = !((usuario.getEmail().length() >= 5) && (usuario.getEmail().length() <= 200));
			
			boolean email_cadastrado = !ChecarEmailAlteracao(usuario.getEmail(), usuario.getUuid());
			boolean nickname_cadastrado = !ChecarNicknameAlteracao(usuario.getNickname(), usuario.getUuid());
			
			// os dados n�o seguem o padr�a de tamanho (qnt de caracteres)
			// ou j� se encontram cadastrados
			if ((nickname_tamanho || email_tamanho) 
				|| (email_cadastrado || nickname_cadastrado)) {
							
				if (nickname_tamanho && email_tamanho) { return 5; }
				else if (nickname_tamanho && email_cadastrado) { return 6; }
				else if (nickname_cadastrado && email_tamanho) { return 7; }
				else if (nickname_cadastrado && email_cadastrado) { return 8; }
				else if (nickname_tamanho) { return 1; }
				else if (nickname_cadastrado) { return 2; }
				else if (email_tamanho) { return 3; }
				else if (email_cadastrado) { return 4; }
							
			}
			
			// Caso o email e o nickname n�o estejam j� cadastrados
			// O cadastro � realizado
			else {
							
				// Alterar Usuario
				smtp.setString(1, usuario.getNickname());
				smtp.setString(2 , usuario.getEmail());
				smtp.setInt(3, usuario.isBloqueado());
				smtp.setInt(4, usuario.getNivel());
				smtp.setString(5, usuario.getUuid());
				
				smtp.executeUpdate();
				smtp.close();
				ConexaoMySQL.FecharConexao(conexao);
							
				return 9;
			}
			
			return 0;
			
		}
		catch (SQLException e) { 
			e.printStackTrace(); 
			return 0;
		}
	}
	
	public int Cadastrar(UsuarioBean usuario) {
		/*
		 * Insere registro de usu�rio cadastrado
		 * Assint�tica: O(3) >> O(1)
		 * */
		try {
			String sql = "INSERT INTO usuario(uuid_usuario, email, nickname, foto_perfil, nivel, bloqueado, status)"
						 + " VALUES(UUID_TO_BIN(UUID()), ?, ?, ?, ?, ?, ?);";
			Connection conexao = ConexaoMySQL.AbrirConexao();
			PreparedStatement smtp = conexao.prepareStatement(sql);
			
			boolean nickname_tamanho = !((usuario.getNickname().length() >= 5) && (usuario.getNickname().length() <= 15));
			boolean email_tamanho = !((usuario.getEmail().length() >= 5) && (usuario.getEmail().length() <= 200));
			
			boolean nickname_cadastrado = !ChecarNickname(usuario.getNickname());
			boolean email_cadastrado = !ChecarEmail(usuario.getEmail());
			
			// os dados n�o seguem o padr�a de tamanho (qnt de caracteres)
			// ou j� se encontram cadastrados
			if ((nickname_tamanho || email_tamanho) 
				|| (email_cadastrado || nickname_cadastrado)) {
				
				if (nickname_tamanho && email_tamanho) { return 5; }
				else if (nickname_tamanho && email_cadastrado) { return 6; }
				else if (nickname_cadastrado && email_tamanho) { return 7; }
				else if (nickname_cadastrado && email_cadastrado) { return 8; }
				else if (nickname_tamanho) { return 1; }
				else if (nickname_cadastrado) { return 2; }
				else if (email_tamanho) { return 3; }
				else if (email_cadastrado) { return 4; }
				
			}
			
			// Caso o email e o nickname n�o estejam j� cadastrados
			// O cadastro � realizado
			else {
				
				// Cadastrar Usuario
				smtp.setString(1, usuario.getEmail());
				smtp.setString(2, usuario.getNickname());
				smtp.setBinaryStream(3, usuario.getStreamAvatar());
				smtp.setInt(4, usuario.getNivel());
				smtp.setInt(5, usuario.isBloqueado());
				smtp.setInt(6, 0);
				
				smtp.executeUpdate();
				smtp.close();
				ConexaoMySQL.FecharConexao(conexao);
				
				return 9;
			}
			
			return 0;
			
		}
		catch (SQLException e) { 
			e.printStackTrace(); 
			return 0;
		}
	}
	
	public UsuarioBean Logar(UsuarioBean usuario) throws IOException { 
		/*
		 * Seleciona um registro de usu�rio no banco de dados
		 * Assint�tica: O(2) >> O(1)
		 * */
		
		try {
			String sql = "SELECT BIN_TO_UUID(uuid_usuario), email, nickname"
					   + ", bloqueio_inspecionar_elemento, nivel, bloqueado, status"
					   + " FROM usuario WHERE email = ?;";
			Connection conexao = ConexaoMySQL.AbrirConexao();
			PreparedStatement smtp = conexao.prepareStatement(sql);
			
			// Verifica se o login e a senha s�o inv�lidos ou incorretos
			if (!ChecarLogin(usuario.getEmail(), usuario.getSenha())) { return null; }
			
			// Caso estiverem corretos
			// O registro vinculado � selecionado
			else {
				smtp.setString(1, usuario.getEmail());
				ResultSet rs = smtp.executeQuery();
				
				if (rs.next()) {
					UsuarioBean usuario_logado = new UsuarioBean();
					usuario_logado.setUuid(rs.getString("BIN_TO_UUID(uuid_usuario)"));
					usuario_logado.setEmail(rs.getString("email"));					
					usuario_logado.setNickname(rs.getString("nickname"));
					usuario_logado.setAvatar(null);
					usuario_logado.setLiberarInspecionarElemento(rs.getInt("bloqueio_inspecionar_elemento"));
					usuario_logado.setNivel(rs.getInt("nivel"));
					usuario_logado.setBloqueado(rs.getInt("bloqueado"));
					usuario_logado.setOnline(rs.getInt("status"));
					
					smtp.close();
					ConexaoMySQL.FecharConexao(conexao);
					
					MudarStatus(usuario_logado.getUuid());
					return usuario_logado;      
				}
				
				return null;
			}
		}
		catch (SQLException e) { 
			e.printStackTrace(); 
			return null;
		}
	}
	
	public boolean Deslogar(String uuid_usuario) { 
		/*
		 * Altera campo 'status' para 0 (deslogado)
		 * Assint�tica: O(1)
		 * */
		try {
			String sql = "UPDATE usuario SET"
						 + " status = 0"
					     + " WHERE uuid_usuario = UUID_TO_BIN(?);";
			Connection conexao = ConexaoMySQL.AbrirConexao();
			PreparedStatement smtp = conexao.prepareStatement(sql);
			
			smtp.setString(1, uuid_usuario);
			
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
	
	public boolean AlterarAvatar(String uuid_usuario, InputStream imagem) throws FileNotFoundException {
		/*
		 * Altera foto de perfil do usuario
		 * Assint�tica: O(1)
		 * */
		try {
			String sql = "UPDATE usuario SET"
					     + " foto_perfil = ?"
					     + " WHERE uuid_usuario = UUID_TO_BIN(?);";
			Connection conexao = ConexaoMySQL.AbrirConexao();
			PreparedStatement smtp = conexao.prepareStatement(sql);
			
			smtp.setBlob(1, imagem);
			smtp.setString(2, uuid_usuario);
			
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
	
	public boolean AlterarFotoReconhecimento(String uuid_usuario, InputStream imagem) {
		try {
			String sql = "UPDATE usuario SET"
					     + " foto_reconhecimento = ?"
					     + " WHERE uuid_usuario = UUID_TO_BIN(?);";
			Connection conexao = ConexaoMySQL.AbrirConexao();
			PreparedStatement smtp = conexao.prepareStatement(sql);
			
			smtp.setBlob(1, imagem);
			smtp.setString(2, uuid_usuario);
			
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
	
	public boolean AlterarSenha(UsuarioBean usuario) {
		/*
		 * Realiza altera��o de senha do usu�rio
		 * Assint�tica: O(1)
		 * */
		
		try {
			SaltDao salt_dao = new SaltDao();
			String sql = "UPDATE usuario SET"
					 + " senha = ?"
				     + " WHERE uuid_usuario = UUID_TO_BIN(?);";
			Connection conexao = ConexaoMySQL.AbrirConexao();
			PreparedStatement smtp = conexao.prepareStatement(sql);
			
			
			smtp.setString(1, salt_dao.SelecionarCalcularSaltSenha(usuario.getUuid(), usuario.getSenha()));
			smtp.setString(2, usuario.getUuid());
			
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
	
	public String SelecionarUuid(String email) {
		/*
		 * Checa se o email de login e a senha est�o ambos vinculados a um registro de usu�rio
		 * Assint�tica: O(1)
		 * */
		try {
			String uuid;
			String sql = "SELECT BIN_TO_UUID(uuid_usuario) FROM usuario WHERE email = ?;";
			Connection conexao = ConexaoMySQL.AbrirConexao();
			PreparedStatement smtp = conexao.prepareStatement(sql);
			
			smtp.setString(1, email);
			ResultSet rs = smtp.executeQuery();
			
			// Login e Senha corretos
			if (rs.next()) {
				uuid = rs.getString("BIN_TO_UUID(uuid_usuario)");
				smtp.close();
				ConexaoMySQL.FecharConexao(conexao);
			}
			
			// Login e Senha incorretos ou inv�lidos
			else { 
				rs.close();
				smtp.close();
				ConexaoMySQL.FecharConexao(conexao);
				return null; 
			}
			
			return uuid;
		}
		catch (SQLException e) { 
			e.printStackTrace(); 
			return null;
		}
	}
	
	public byte[] SelecionarAvatar(String usuario_uuid) {
		try {
			String sql = "SELECT foto_perfil FROM usuario WHERE uuid_usuario = UUID_TO_BIN(?);";
			Connection conexao = ConexaoMySQL.AbrirConexao();
			PreparedStatement smtp = conexao.prepareStatement(sql);
			ResultSet rs = null;
			byte[] foto_perfil;
			
			smtp.setString(1, usuario_uuid);
			rs = smtp.executeQuery();
			
			if (rs.next()) { 
				foto_perfil = rs.getBytes("foto_perfil");
				rs.close();
				smtp.close();
				ConexaoMySQL.FecharConexao(conexao);
				
				System.out.println("Imagem:");
				System.out.println(foto_perfil);
				return foto_perfil;
			}
			else { 
				rs.close();
				smtp.close();
				ConexaoMySQL.FecharConexao(conexao);
				System.out.println("Sem Imagem:");
				return null; 
			}
		}
		catch (SQLException e) { 
			e.printStackTrace(); 
			return null;
		}
	}
	
	/*
	 * M�todos Secud�rios (Ocultos)
	 * 
	 * */
	
	private boolean ChecarLogin(String email, String senha) {
		/*
		 * Checa se o email de login e a senha est�o ambos vinculados a um registro de usu�rio
		 * Assint�tica: O(1)
		 * */
		try {
			SaltDao salt_dao = new SaltDao();
			String sql = "SELECT uuid_usuario FROM usuario WHERE email = ? AND senha = ?;";
			String uuid_usuario = SelecionarUuid(email);
			Connection conexao = ConexaoMySQL.AbrirConexao();
			PreparedStatement smtp = conexao.prepareStatement(sql);
			
			
			smtp.setString(1, email);
			smtp.setString(2, salt_dao.SelecionarCalcularSaltSenha(uuid_usuario, senha));
			ResultSet rs = smtp.executeQuery();
			
			// Login e Senha corretos
			if (rs.next()) { 
				smtp.close();
				ConexaoMySQL.FecharConexao(conexao);
				return true; 
			}
			
			// Login e Senha incorretos ou inv�lidos
			else { 
				rs.close();
				smtp.close();
				ConexaoMySQL.FecharConexao(conexao);
				return false; 
			}
		}
		catch (SQLException e) { 
			e.printStackTrace(); 
			return false;
		}
	}
	
	public boolean ChecarEmail(String email) {
		/*
		 * Checa se um email est� cadastrado na tabela Usuario
		 * Assint�tica: O(1)
		 * */
		
		try {
			String sql = "SELECT uuid_usuario FROM usuario WHERE email = ?;";
			Connection conexao = ConexaoMySQL.AbrirConexao();
			PreparedStatement smtp = conexao.prepareStatement(sql);
			
			smtp.setString(1, email);
			ResultSet rs = smtp.executeQuery();
			
			// Email j� cadastrado
			if (rs.next()) {
				smtp.close();
				ConexaoMySQL.FecharConexao(conexao);
				return false; 
			}
			
			// Email n�o cadastrado
			else { 
				rs.close();
				smtp.close();
				ConexaoMySQL.FecharConexao(conexao);
				return true; 	
			}
			
		}
		catch (SQLException e) { 
			e.printStackTrace(); 
			return false;
		}
	}
	
	public boolean ChecarEmailAlteracao(String email, String uuid_usuario) {
		/*
		 * Checa se um email est� cadastrado na tabela Usuario
		 * Assint�tica: O(1)
		 * */
		
		try {
			String sql = "SELECT uuid_usuario FROM usuario WHERE email = ? AND uuid_usuario != UUID_TO_BIN(?);";
			Connection conexao = ConexaoMySQL.AbrirConexao();
			PreparedStatement smtp = conexao.prepareStatement(sql);
			
			smtp.setString(1, email);
			smtp.setString(2, uuid_usuario);
			ResultSet rs = smtp.executeQuery();
			
			// Email j� cadastrado
			if (rs.next()) {
				smtp.close();
				ConexaoMySQL.FecharConexao(conexao);
				return false; 
			}
			
			// Email n�o cadastrado
			else { 
				rs.close();
				smtp.close();
				ConexaoMySQL.FecharConexao(conexao);
				return true; 	
			}
			
		}
		catch (SQLException e) { 
			e.printStackTrace(); 
			return false;
		}
	}
	
	private boolean ChecarEmailExcetoUsuarioLogado(String email, String uuid) {
		/*
		 * Checa se um email est� cadastrado na tabela Usuario
		 * Assint�tica: O(1)
		 * */
		
		try {
			String sql = "SELECT email FROM usuario WHERE email = ? AND uuid_usuario != UUID_TO_BIN(?);";
			Connection conexao = ConexaoMySQL.AbrirConexao();
			PreparedStatement smtp = conexao.prepareStatement(sql);
			
			smtp.setString(1, email);
			smtp.setString(2, uuid);
			ResultSet rs = smtp.executeQuery();
			
			// Email j� cadastrado
			if (rs.next()) {
				smtp.close();
				ConexaoMySQL.FecharConexao(conexao);
				return false; 
			}
			
			// Email n�o cadastrado
			else { 
				rs.close();
				smtp.close();
				ConexaoMySQL.FecharConexao(conexao);
				return true; 	
			}
			
		}
		catch (SQLException e) { 
			e.printStackTrace(); 
			return false;
		}
	}
	
	private boolean ChecarNickname(String nickname) {
		/*
		 * Checa se um nickname j� se encontra cadastrado na tabela Usuario
		 * Assint�tica: O(1)
		 * */
		
		try {
			String sql = "SELECT uuid_usuario FROM usuario WHERE nickname = ?;";
			Connection conexao = ConexaoMySQL.AbrirConexao();
			PreparedStatement smtp = conexao.prepareStatement(sql);
			
			smtp.setString(1, nickname);
			ResultSet rs = smtp.executeQuery();
			
			// Nickname j� cadastrado
			if (rs.next()) { 
				smtp.close();
				ConexaoMySQL.FecharConexao(conexao);
				return false; 
			}
			
			// Nickname n�o cadastrado
			else { 
				rs.close();
				smtp.close();
				ConexaoMySQL.FecharConexao(conexao);
				return true; 
			}
		}
		catch (SQLException e) { 
			e.printStackTrace(); 
			return false;
		}
	}
	
	private boolean ChecarNicknameAlteracao(String nickname, String uuid_usuario) {
		/*
		 * Checa se um nickname j� se encontra cadastrado na tabela Usuario
		 * Assint�tica: O(1)
		 * */
		
		try {
			String sql = "SELECT uuid_usuario FROM usuario WHERE nickname = ? AND uuid_usuario != UUID_TO_BIN(?);";
			Connection conexao = ConexaoMySQL.AbrirConexao();
			PreparedStatement smtp = conexao.prepareStatement(sql);
			
			smtp.setString(1, nickname);
			smtp.setString(2, uuid_usuario);
			ResultSet rs = smtp.executeQuery();
			
			// Nickname j� cadastrado
			if (rs.next()) { 
				smtp.close();
				ConexaoMySQL.FecharConexao(conexao);
				return false; 
			}
			
			// Nickname n�o cadastrado
			else { 
				rs.close();
				smtp.close();
				ConexaoMySQL.FecharConexao(conexao);
				return true; 
			}
		}
		catch (SQLException e) { 
			e.printStackTrace(); 
			return false;
		}
	}
	
	private boolean ChecarNicknameExcetoUsuarioLogado(String nickname, String uuid) {
		/*
		 * Checa se um nickname j� se encontra cadastrado na tabela Usuario
		 * Assint�tica: O(1)
		 * */
		
		try {
			String sql = "SELECT nickname FROM usuario WHERE nickname = ? AND uuid_usuario != UUID_TO_BIN(?);";
			Connection conexao = ConexaoMySQL.AbrirConexao();
			PreparedStatement smtp = conexao.prepareStatement(sql);
			
			smtp.setString(1, nickname);
			smtp.setString(2, uuid);
			ResultSet rs = smtp.executeQuery();
			
			// Nickname j� cadastrado
			if (rs.next()) { 
				smtp.close();
				ConexaoMySQL.FecharConexao(conexao);
				return false; 
			}
			
			// Nickname n�o cadastrado
			else { 
				rs.close();
				smtp.close();
				ConexaoMySQL.FecharConexao(conexao);
				return true; 
			}
		}
		catch (SQLException e) { 
			e.printStackTrace(); 
			return false;
		}
	}
	
	private boolean MudarStatus(String uuid_usuario) {
		/*
		 * Altera status de online do usu�rio para 1 (logado)
		 * Assint�tica: O(1)
		 * */
		try {
			String sql = "UPDATE usuario SET status = ? WHERE uuid_usuario = UUID_TO_BIN(?);";
			Connection conexao = ConexaoMySQL.AbrirConexao();
			PreparedStatement smtp = conexao.prepareStatement(sql);
			
			smtp.setInt(1, 1);
			smtp.setString(2, uuid_usuario);
			
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
}