package Bean;

public class AlterarBiometriaBean {
	/*
	 * Classe bean respons�vel por armazenar os dados das requisi��es das altera��es de biometrias:
	 * 
	 * uuid_alterar_biometria
	 * uuid_usuario
	 * usado >> 0: n�o, 1: sim
	 * expirado >> 0: n�o, 1: sim
	 * */
	
	public AlterarBiometriaBean() {}
	
	String uuid_alterar_biometria;
	String uuid_usuario;
	int usado;
	int expirado;
	
	public String getUuidAlterarBiometria() { return uuid_alterar_biometria; }
	public void setUuidAlterarBiometria(String uuid_alterar_biometria) { this.uuid_alterar_biometria = uuid_alterar_biometria; }
	
	public String getUuidUsuario() { return uuid_usuario; }
	public void setUuidUsuario(String uuid_usuario) { this.uuid_usuario= uuid_usuario; }
	
	public int getUsado() { return usado; }
	public void setUsado(int usado) { this.usado = usado; }
	
	public int getExpirado() { return expirado; }
	public void setExpirado(int expirado) { this.expirado = expirado; }
}
