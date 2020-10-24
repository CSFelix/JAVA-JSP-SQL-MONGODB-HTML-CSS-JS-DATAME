package Seguranca;

import java.util.regex.Pattern;

public class StripHTML {
	/*
	 * Classe responsável or realizar o processo de Strip em Strings
	 * a fim de evitar HTML e JS Injection. 
	 * Assintótica da Função: O(1).
	 * 
	 * - OBS.: o SQL Injection já está sendo evitado nas classes DAO's
	 * por meio do uso do Prepared Statement e pelo método StripString
	 * */
	public static String StripString(String dado) { 
		/*
		 * Substitui todos os caracteres que fornecem SQL Injection por underline
		 * Assintótica: O(1)
		 * */
		return dado.replaceAll("\\<.*?\\>", "_"); 
	}
	
	/* Constantes Públicas 
	 * - Presentes na propriedade 'pattern' dos inputs
	 */
	public static final String REGEX_EMAIL = "[a-zA-Z0-9_@.]{5,200}";
	public static final String REGEX_NICKNAME_SENHA = "[a-zA-Z0-9_]{5,15}";
	public static final String REGEX_CODIGO_ALTERACAO_SENHA = "[0-9]{5, 5}]";
	
	public static final String REGEX_TITULO_NOTICIA = "[a-zA-Z0-9_]{5,30}";
	
	/* Constantes Privadas
	 * - Presentes apenas nos métodos internos de verificação daqui
	 * */
	private static final String OWASP_REGEX_EMAIL = "^[a-zA-Z0-9_+&*-]+(?:\\." 
            								  + "[a-zA-Z0-9_+&*-]+)*@" 
            								  + "(?:[a-zA-Z0-9-]+\\.)+[a-z"
            								  + "A-Z]{2,7}$";
	
	/*
	 * Métodos de Verificação Avançada
	 * 
	 * Eles são utilizados para evitar o problema do usuário ter
	 * desativado o JavaScript do Navegador e os inputs serem aceitos
	 * mesmo ficando fora do padrão RegEx. Segurança máxima aqui rsrs 
	 * */
	public static boolean VerificaEmail(String email) {
		/*
		 * Verifica se email segue padrão do Owasp
		 * Assintótica: O(1)
		 * */
		Pattern pat = Pattern.compile(OWASP_REGEX_EMAIL); 
        if (email == null) { return false; } 
        else { return pat.matcher(email).matches(); }  
	}
}
