package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import BancoDados.ConexaoMySQL;
import Bean.AlterarBiometriaBean;
import Seguranca.GeradorHash;

public class AlterarBiometriaDao {
	/*
	 * Classe responsável pelas transferências de informações beans e comunicação com o banco de dados relacionadas à alteração
	 * da foto de Reconhecimento Facial dos usuários
	 * */
	
	public AlterarBiometriaDao() {}
	
	/*
	 * Métodos Principais (Visíveis)
	 * 
	 * */
	public String Cadastrar(AlterarBiometriaBean alterar) {
		/*
		 * Insere registro para alteração de biometria
		 * Assintótica: O(1)
		 * */
		try {
			ExpirarAlteracoesAnteriores(alterar.getUuidUsuario());
			
			String sql = "INSERT INTO alterar_biometria(uuid_alterar_biometria, hash_alterar_biometria, uuid_usuario, usado, expirado)"
						 + " VALUES(UUID_TO_BIN(UUID()), ?, UUID_TO_BIN(?), 0, 0);";
			String hash_alterar_biometria = GeradorHash.GerarSalt();
			Connection conexao = ConexaoMySQL.AbrirConexao();
			PreparedStatement smtp = conexao.prepareStatement(sql);
			
			smtp.setString(1, hash_alterar_biometria);
			smtp.setString(2, alterar.getUuidUsuario());
			smtp.executeUpdate();
			smtp.close();
			ConexaoMySQL.FecharConexao(conexao);
				
			return SelecionarUuidAlterarBiometria(hash_alterar_biometria);
		}
		catch (SQLException e) { 
			e.printStackTrace(); 
			return null;
		}
	}
	
	public int SelecionarExpiracao(AlterarBiometriaBean alterar) {
		/*
		 * Seleciona a condição de expiração da requisição de alteração de senha.
		 * 
		 * expiração >> 0: não, 1: sim
		 * 
		 * Assintótica: O(1)
		 * */
		
		try {
			int expirado;
			String sql = "SELECT expirado"
					   + " FROM alterar_biometria"
					   + " WHERE uuid_alterar_biometria = UUID_TO_BIN(?);";
			Connection conexao = ConexaoMySQL.AbrirConexao();
			PreparedStatement smtp = conexao.prepareStatement(sql);
			ResultSet rs;
			
			smtp.setString(1, alterar.getUuidAlterarBiometria());
			rs = smtp.executeQuery();
			
			// registro de expiração encontrado
			if (rs.next()) { 
				expirado =  rs.getInt("expirado");
				smtp.close();
				ConexaoMySQL.FecharConexao(conexao);
				return expirado;
			}
			
			// registro de expiração não encontrado
			else { return 0; }
		}
		catch (SQLException e) { 
			e.printStackTrace(); 
			return 1;
		}
	}
	
	public boolean UsarAlteracao(AlterarBiometriaBean alterar) {
		/*
		 * Inativa uma alteração de biometria após usuário alterar
		 * Assintótica: O(1)
		 * */
		try {
			String sql = "UPDATE alterar_biometria SET"
					   + " usado = 1"
					   + " WHERE uuid_alterar_biometria = UUID_TO_BIN(?);";
			Connection conexao = ConexaoMySQL.AbrirConexao();
			PreparedStatement smtp = conexao.prepareStatement(sql);
			
				
			smtp.setString(1, alterar.getUuidAlterarBiometria());
			smtp.executeUpdate();
			smtp.close();
			ConexaoMySQL.FecharConexao(conexao);
			
			ExpirarAlteracao(alterar);
			return true;
		}
		catch (SQLException e) { 
			e.printStackTrace(); 
			return false;
		}
	}
	
	public boolean ExpirarAlteracao(AlterarBiometriaBean alterar) {
		/*
		 * Expira uma alteração de biometria
		 * Assintótica: O(1)
		 * */
		try {
			String sql = "UPDATE alterar_biometria SET"
					   + " expirado = 1"
					   + " WHERE uuid_alterar_biometria = UUID_TO_BIN(?);";
			Connection conexao = ConexaoMySQL.AbrirConexao();
			PreparedStatement smtp = conexao.prepareStatement(sql);
			
				
			smtp.setString(1, alterar.getUuidAlterarBiometria());
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
	
	/*
	 * Métodos Secudários (Ocultos)
	 * 
	 * */
	
	private boolean ExpirarAlteracoesAnteriores(String uuid_usuario) {
		/*
		 * Torna as requisições de alteração de biometria anteriores à requisição atual expiradas (expiração >> 1)
		 * Assintótica: O(1)
		 * */
		
		try {
			String sql = "UPDATE alterar_biometria SET"
						 + " expirado = 1"
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
	
	private String SelecionarUuidAlterarBiometria(String hash_alterar_biometria) {
		/*
		 * Seleciona a uuid de uma alteração de biometria
		 * Assintótica: O(1)
		 * */
		
		String uuid_alterar_senha = null;
		try {
			String sql = "SELECT BIN_TO_UUID(uuid_alterar_biometria)"
					   + " FROM alterar_biometria"
					   + " WHERE hash_alterar_biometria = ?;";
			Connection conexao = ConexaoMySQL.AbrirConexao();
			PreparedStatement smtp = conexao.prepareStatement(sql);
			ResultSet rs;
				
			smtp.setString(1, hash_alterar_biometria);
			rs = smtp.executeQuery();
			
			if (rs.next()) { 
				uuid_alterar_senha =  rs.getString("BIN_TO_UUID(uuid_alterar_biometria)");
				smtp.close();
				ConexaoMySQL.FecharConexao(conexao);
				return uuid_alterar_senha;
			}
			else { return null; }
		}
		catch (SQLException e) { 
			e.printStackTrace(); 
			return null;
		}
	}
}
