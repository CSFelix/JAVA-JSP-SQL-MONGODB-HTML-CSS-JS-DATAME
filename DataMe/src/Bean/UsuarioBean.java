package Bean;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;

public class UsuarioBean {
	/*
	 * Classe Bean responsável por armazenar os dados dos usuários:

	* foto_reconhecimento >> foto usada no reconhecimento facial;
	* uuid;
	* email;
	* senha;
	* nickname;
	* avatar >> foto de perfil em binário;
	* stream_avatar >> foto de perfil em binpário Stream.
	
	* inspecionar_elemento >> 0: liberado, 1: bloqueado;
	* nivel;
	* bloqueado >> 0: desbloqueado, 1: bloqueado;
	* status >> 0: offline, 1: online;

	 * */
	
	public UsuarioBean() { }
	
	// Usado na Consulta
	/*public UsuarioBean(String uuid, String login, String senha, String nickname, File avatar, int nivel, int online) {
		setUuid(uuid);  setEmail(login); setSenha(senha);
		setAvatar(avatar); setStreamAvatar(); setNickname(nickname);
		setNivel(nivel); setOnline(online);
	}*/
	
	// Usado no Login
	/*public UsuarioBean(String uuid, String login, String senha, String nickname,  File avatar, int nivel) {
		setUuid(uuid);  setEmail(login); setSenha(senha); 
		setNickname(nickname); setAvatar(avatar); setStreamAvatar();
		setNivel(nivel); setOnline(1);
	}*/
	
	String foto_reconhecimento;
	String uuid;
	String email;
	String senha;
	String nickname;
	File avatar;
	FileInputStream stream_avatar;
	
	int inspecionar_elemento;
	int nivel;
	int bloqueado;
	int status;
	
	public String getFotoReconhecimento() { return foto_reconhecimento; }
	public void setFotoReconhecimento(String foto_reconhecimento) { this.foto_reconhecimento = foto_reconhecimento; }
	
	public String getUuid() { return uuid; }
	public void setUuid(String uuid) { this.uuid = uuid; }

	public String getEmail() { return email; }
	public void setEmail(String email) { this.email = email; }

	public String getSenha() { return senha; }
	public void setSenha(String senha) { this.senha = senha; }

	public String getNickname() { return nickname; }
	public void setNickname(String nickname) { this.nickname = nickname; }
	
	public File getAvatar() { return avatar; }
	public void setAvatar(File avatar) {
		// foto de perfil definida pelo usuário
		if (avatar != null) { this.avatar = avatar; }
		
		// foto de perfil não definida
		// aplicação define a padrão
		// depois será preciso corrigir para não puxar mais o diretório raiz do meu pc, mas sim, o da aplicação
		else { 
			this.avatar = new File("C:\\Users\\gabri\\Desktop\\Faculdade\\APS\\Projeto\\WebContent\\Imagens\\Foto Perfil\\avatar.png");
			this.setStreamAvatar();
		}
	}

	public FileInputStream getStreamAvatar() { return stream_avatar; }
	public void setStreamAvatar() {
		// transforma foto de perfil em binário
		try { this.stream_avatar = new FileInputStream(this.avatar); } 
		catch (FileNotFoundException e) { e.printStackTrace(); }
	}
	
	public int isInspecionarElementoBloqueado() { return this.inspecionar_elemento; }
	public void setLiberarInspecionarElemento(int flag) { this.inspecionar_elemento = flag; }
	
	public int getNivel() { return this.nivel; }
	public void setNivel(int nivel) { this.nivel = nivel; }
	
	public int isBloqueado() { return this.bloqueado; }
	public void setBloqueado(int bloqueio) { this.bloqueado = bloqueio; }

	public int isOnline() { return status; }
	public void setOnline(int status) { this.status = status; }
}
