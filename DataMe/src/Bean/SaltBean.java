package Bean;

public class SaltBean {
	/*
	 * Classe responsável por armazenar os dados de salts dos usuários. Tais salts são usados no cálculo BCrypt das senhas:
	 * 
	 * uuid_usuario
	 * salt
	 * */
	
	public SaltBean() {}
	
	String uuid_usuario;
	String salt;
	
	public String getUuidUsuario() { return uuid_usuario; }
	public void setUuidUsuario(String uuid) { this.uuid_usuario = uuid; }
	
	public String getSalt() { return salt; }
	public void setSalt(String salt) { this.salt = salt; }
}
