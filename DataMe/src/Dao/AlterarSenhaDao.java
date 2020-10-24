package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import BancoDados.ConexaoMySQL;
import Bean.AlterarSenhaBean;
import Seguranca.GeradorHash;

public class AlterarSenhaDao {
	/*
	 * Classe respons�vel pelas transfer�ncias de informa��es beans e comunica��o com o banco de dados  relacionados �s
	 * requisi��es de altera��o de senhas dos usu�rios
	 * */
	
	public AlterarSenhaDao() {}
	
	/*
	 * M�todos Principais (Vis�veis)
	 * 
	 * */
	
	public String Cadastrar(AlterarSenhaBean alterar) {
		/*
		 * Insere registro para altera��o de senha
		 * Assint�tica: O(1)
		 * */
		try {
			ExpirarAlteracoesAnteriores(alterar.getUuidUsuario());
			
			String sql = "INSERT INTO alterar_senha(uuid_alterar_senha, hash_alterar_senha, uuid_usuario, usado, expirado)"
						 + " VALUES(UUID_TO_BIN(UUID()), ?, UUID_TO_BIN(?), 0, 0);";
			String hash_alterar_senha = GeradorHash.GerarSalt();
			Connection conexao = ConexaoMySQL.AbrirConexao();
			PreparedStatement smtp = conexao.prepareStatement(sql);
			
			smtp.setString(1, hash_alterar_senha);
			smtp.setString(2, alterar.getUuidUsuario());
			smtp.executeUpdate();
			smtp.close();
			ConexaoMySQL.FecharConexao(conexao);
				
			return SelecionarUuidAlterarSenha(hash_alterar_senha);
		}
		catch (SQLException e) { 
			e.printStackTrace(); 
			return null;
		}
	}
	
	public int SelecionarExpiracao(AlterarSenhaBean alterar) {
		/*
		 * Seleciona a condi��o de expira��o da requisi��o de altera��o de senha.
		 * 
		 * expira��o >> 0: n�o, 1: sim
		 * 
		 * Assint�tica: O(1)
		 * */
		
		try {
			int expirado;
			String sql = "SELECT expirado"
					   + " FROM alterar_senha"
					   + " WHERE uuid_alterar_senha = UUID_TO_BIN(?);";
			Connection conexao = ConexaoMySQL.AbrirConexao();
			PreparedStatement smtp = conexao.prepareStatement(sql);
			ResultSet rs;
			
			smtp.setString(1, alterar.getUuidAlterarSenha());
			rs = smtp.executeQuery();
			
			// registro de expira��o encontrado
			if (rs.next()) { 
				expirado =  rs.getInt("expirado");
				smtp.close();
				ConexaoMySQL.FecharConexao(conexao);
				return expirado;
			}
			
			// registro de expira��o n�o encontrado
			else { return 0; }
		}
		catch (SQLException e) { 
			e.printStackTrace(); 
			return 1;
		}
	}
	
	public boolean UsarAlteracao(AlterarSenhaBean alterar) {
		/*
		 * Inativa uma altera��o de senha ap�s usu�rio alterar
		 * Assint�tica: O(1)
		 * */
		try {
			String sql = "UPDATE alterar_senha SET"
					   + " usado = 1"
					   + " WHERE uuid_alterar_senha = UUID_TO_BIN(?);";
			Connection conexao = ConexaoMySQL.AbrirConexao();
			PreparedStatement smtp = conexao.prepareStatement(sql);
			
				
			smtp.setString(1, alterar.getUuidAlterarSenha());
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
	
	public boolean ExpirarAlteracao(AlterarSenhaBean alterar) {
		/*
		 * Expira uma altera��o de senha
		 * Assint�tica: O(1)
		 * */
		try {
			String sql = "UPDATE alterar_senha SET"
					   + " expirado = 1"
					   + " WHERE uuid_alterar_senha = UUID_TO_BIN(?);";
			Connection conexao = ConexaoMySQL.AbrirConexao();
			PreparedStatement smtp = conexao.prepareStatement(sql);
			
				
			smtp.setString(1, alterar.getUuidAlterarSenha());
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
	 * M�todos Secud�rios (Ocultos)
	 * 
	 * */
	
	private boolean ExpirarAlteracoesAnteriores(String uuid_usuario) {
		/*
		 * Torna as requisi��es de altera��o de senha anteriores � requisi��o atual expiradas (expira��o >> 1)
		 * Assint�tica: O(1)
		 * */
		
		try {
			String sql = "UPDATE alterar_senha SET"
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
	
	private String SelecionarUuidAlterarSenha(String hash_alterar_senha) {
		/*
		 * Seleciona a uuid de uma altera��o de senha
		 * Assint�tica: O(1)
		 * */
		
		String uuid_alterar_senha = null;
		try {
			String sql = "SELECT BIN_TO_UUID(uuid_alterar_senha)"
					   + " FROM alterar_senha"
					   + " WHERE hash_alterar_senha = ?;";
			Connection conexao = ConexaoMySQL.AbrirConexao();
			PreparedStatement smtp = conexao.prepareStatement(sql);
			ResultSet rs;
				
			smtp.setString(1, hash_alterar_senha);
			rs = smtp.executeQuery();
			
			if (rs.next()) { 
				uuid_alterar_senha =  rs.getString("BIN_TO_UUID(uuid_alterar_senha)");
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
