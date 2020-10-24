package BancoDados;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class ConexaoMySQL {
	/*
	 * Classe respons�vel por abrir e fechar conex�es com o banco de dados MySQL
	 * Utiliza o Design Pattern Singleton
	 * */
	
	static final String SERVIDOR = "localhost"; // configurar ip do servidor caso for rodar em rede
	static final String LOGIN = "root";
	static final String SENHA = "felix00";
	static final String PORTA = "3306";
	
	static final String BANCO = "datame";
	static final String JDBC = "com.mysql.cj.jdbc.Driver";
	// URL configurada com o hor�rio brasileiro
	static final String URL = "jdbc:mysql://" + SERVIDOR + ":" + PORTA + "/" + BANCO + "?useTimezone=true&serverTimezone=UTC";
	
	public static Connection AbrirConexao() {
		/*
		 * Abre conex�o com banco de dados
		 * Assint�tica: O(1)
		 * */
		try {
			Class.forName(JDBC);
			Connection conexao = DriverManager.getConnection(URL, LOGIN, SENHA);
			return conexao;
		} 
		catch (ClassNotFoundException e) { e.printStackTrace(); } 
		catch (SQLException e) { e.printStackTrace(); }
		
		return null;
	}
	
	public static void FecharConexao(Connection conexao) {
		/*
		 * Fecha conex�o com o banco
		 * Assint�tica: O(1)
		 * */
		try { conexao.close(); } catch (SQLException e) { e.printStackTrace(); }
	}
}
