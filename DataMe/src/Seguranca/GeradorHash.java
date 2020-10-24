package Seguranca;

public class GeradorHash {
	/*
	 * Classe respons�vel por gerar salts aleat�rios e calcular hash BCrypt de senhas
	 * */
	
	public GeradorHash() { }
	
	private static int ROTATIONS = 7;
	
	public static String GerarSalt() { 
		/*
		 * Gera��o de Salt Aleat�rio
		 * Assint�tica: O(7) >> O(1)
		 * */
		return BCrypt.gensalt(ROTATIONS);
	}
	
	public static String CalcularHashSenha(String senha, String salt) { 
		/*
		 * C�lculo da Hash BCrypt de senhas
		 * Assint�tica: O(1)
		 * */
		return BCrypt.hashpw(senha, salt); 
	}
}
