package Seguranca;

public class GeradorHash {
	/*
	 * Classe responsável por gerar salts aleatórios e calcular hash BCrypt de senhas
	 * */
	
	public GeradorHash() { }
	
	private static int ROTATIONS = 7;
	
	public static String GerarSalt() { 
		/*
		 * Geração de Salt Aleatório
		 * Assintótica: O(7) >> O(1)
		 * */
		return BCrypt.gensalt(ROTATIONS);
	}
	
	public static String CalcularHashSenha(String senha, String salt) { 
		/*
		 * Cálculo da Hash BCrypt de senhas
		 * Assintótica: O(1)
		 * */
		return BCrypt.hashpw(senha, salt); 
	}
}
