package Bean;

public class AlterarSenhaBean {
	/*
	 * Classe bean respons�vel por armazenar os dados das requisi��es das altera��es de senhas:
	 * 
	 * uuid_alterar_senha
	 * uuid_usuario
	 * usado >> 0: n�o, 1: sim
	 * expirado >> 0: n�o, 1: sim
	 * */
	
	public AlterarSenhaBean() {}
	
	String uuid_alterar_senha;
	String uuid_usuario;
	int usado;
	int expirado;
	
	public String getUuidAlterarSenha() { return uuid_alterar_senha; }
	public void setUuidAlterarSenha(String uuid_alterar_senha) { this.uuid_alterar_senha = uuid_alterar_senha; }
	
	public String getUuidUsuario() { return uuid_usuario; }
	public void setUuidUsuario(String uuid_usuario) { this.uuid_usuario= uuid_usuario; }
	
	public int getUsado() { return usado; }
	public void setUsado(int usado) { this.usado = usado; }
	
	public int getExpirado() { return expirado; }
	public void setExpirado(int expirado) { this.expirado = expirado; }
}
