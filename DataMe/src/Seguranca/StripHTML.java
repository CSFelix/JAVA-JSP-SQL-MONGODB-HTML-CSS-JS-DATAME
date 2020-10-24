package Seguranca;

import java.util.regex.Pattern;

public class StripHTML {
	/*
	 * Classe respons�vel or realizar o processo de Strip em Strings
	 * a fim de evitar HTML e JS Injection. 
	 * Assint�tica da Fun��o: O(1).
	 * 
	 * - OBS.: o SQL Injection j� est� sendo evitado nas classes DAO's
	 * por meio do uso do Prepared Statement e pelo m�todo StripString
	 * */
	public static String StripString(String dado) { 
		/*
		 * Substitui todos os caracteres que fornecem SQL Injection por underline
		 * Assint�tica: O(1)
		 * */
		return dado.replaceAll("\\<.*?\\>", "_"); 
	}
	
	/* Constantes P�blicas 
	 * - Presentes na propriedade 'pattern' dos inputs
	 */
	public static final String REGEX_EMAIL = "[a-zA-Z0-9_@.]{5,200}";
	public static final String REGEX_NICKNAME_SENHA = "[a-zA-Z0-9_]{5,15}";
	public static final String REGEX_CODIGO_ALTERACAO_SENHA = "[0-9]{5, 5}]";
	
	public static final String REGEX_TITULO_NOTICIA = "[a-zA-Z0-9_]{5,30}";
	
	/* Constantes Privadas
	 * - Presentes apenas nos m�todos internos de verifica��o daqui
	 * */
	private static final String OWASP_REGEX_EMAIL = "^[a-zA-Z0-9_+&*-]+(?:\\." 
            								  + "[a-zA-Z0-9_+&*-]+)*@" 
            								  + "(?:[a-zA-Z0-9-]+\\.)+[a-z"
            								  + "A-Z]{2,7}$";
	
	/*
	 * M�todos de Verifica��o Avan�ada
	 * 
	 * Eles s�o utilizados para evitar o problema do usu�rio ter
	 * desativado o JavaScript do Navegador e os inputs serem aceitos
	 * mesmo ficando fora do padr�o RegEx. Seguran�a m�xima aqui rsrs 
	 * */
	public static boolean VerificaEmail(String email) {
		/*
		 * Verifica se email segue padr�o do Owasp
		 * Assint�tica: O(1)
		 * */
		Pattern pat = Pattern.compile(OWASP_REGEX_EMAIL); 
        if (email == null) { return false; } 
        else { return pat.matcher(email).matches(); }  
	}
}
