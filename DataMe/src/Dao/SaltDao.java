package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import BancoDados.ConexaoMySQL;
import Seguranca.GeradorHash;

public class SaltDao {
	/*
	 * Clase respons�vel pela transfer�ncia dos dados bean com o banco de dados relacionados ao c�lculo e � cria��o
	 * de Salts para as senhas dos usu�rios
	 * */
	
	public SaltDao() {}
	
	/*
	 * M�todos Principais (Vis�veis)
	 * 
	 * */
	
	public boolean CadastrarSalt(String uuid_usuario) {
		/*
		 * Insere registro de salt
		 * Assint�tica: O(1)
		 * */
		try {
			String sql = "INSERT INTO salt(uuid_usuario, salt)"
					   + " VALUES(UUID_TO_BIN(?), ?);";
			Connection conexao = ConexaoMySQL.AbrirConexao();
			PreparedStatement smtp = conexao.prepareStatement(sql);
			
				
			smtp.setString(1, uuid_usuario);
			smtp.setString(2, GeradorHash.GerarSalt());
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
	
	public String SelecionarCalcularSaltSenha(String uuid_usuario, String senha) {
		/*
		 * Seleciona e calcula hash de senha
		 * Assint�tica: O(1)
		 * */

		String salt;
		try {
			String sql = "SELECT salt"
					   + " FROM salt"
					   + " WHERE uuid_usuario = UUID_TO_BIN(?);";
			Connection conexao = ConexaoMySQL.AbrirConexao();
			PreparedStatement smtp = conexao.prepareStatement(sql);
			ResultSet rs;
				
			smtp.setString(1, uuid_usuario);
			rs = smtp.executeQuery();
			
			// salt encontrado no banco de dados
			if (rs.next()) { 
				salt =  rs.getString("salt");
				smtp.close();
				ConexaoMySQL.FecharConexao(conexao);
				
				return  GeradorHash.CalcularHashSenha(senha, salt);
			}
			
			// salt n�o encontrado
			else { return null; }
		}
		catch (SQLException e) { 
			e.printStackTrace(); 
			return null;
		}
	}
}
