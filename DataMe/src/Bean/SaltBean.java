package Bean;

public class SaltBean {
	/*
	 * Classe respons�vel por armazenar os dados de salts dos usu�rios. Tais salts s�o usados no c�lculo BCrypt das senhas:
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
