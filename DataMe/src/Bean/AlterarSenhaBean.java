package Bean;

public class AlterarSenhaBean {
	/*
	 * Classe bean responsável por armazenar os dados das requisições das alterações de senhas:
	 * 
	 * uuid_alterar_senha
	 * uuid_usuario
	 * usado >> 0: não, 1: sim
	 * expirado >> 0: não, 1: sim
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
