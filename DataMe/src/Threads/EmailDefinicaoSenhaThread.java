package Threads;

import Seguranca.GerenciadorEmail;

public class EmailDefinicaoSenhaThread implements Runnable {
	/*
	 * Classe responsável por enviar emails de definição de senhas após o cadastro utilizando threads.
	 * Tive que criar esta thread porque a tela ficava carregando um pouco durante o processo.
	 * Logo, a solução foi tornar este processo em segundo plano.
	 * */
	
	public EmailDefinicaoSenhaThread (String destinatario, String uuid_usuario, String uuid_alteracao_senha) {
		this.destinatario = destinatario;
		this.uuid_usuario = uuid_usuario;
		this.uuid_alteracao_senha = uuid_alteracao_senha;
	}
	
	public void run() {
		/*
		 * Envio do Email
		 * Assintótica: O(1)
		 * */
		GerenciadorEmail gerenciador = new GerenciadorEmail(this.destinatario,
															this.uuid_usuario,
															this.uuid_alteracao_senha);
		gerenciador.EnviarEmailDefinicaoSenha();
	}
	
	private String destinatario;
	private String uuid_usuario;
	private String uuid_alteracao_senha;
}
