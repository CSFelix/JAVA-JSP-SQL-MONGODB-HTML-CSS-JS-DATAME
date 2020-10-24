package Threads;

import Seguranca.GerenciadorEmail;

public class EmailAlteracaoBiometriaThread implements Runnable {
	/*
	 * Classe responsável por enviar emails de alterações de fotos da biometria utilizando threads.
	 * Tive que criar esta thread porque a tela ficava carregando um pouco durante o processo.
	 * Logo, a solução foi tornar este processo em segundo plano.
	 * */
	
	public EmailAlteracaoBiometriaThread(String destinatario, String uuid_usuario, String uuid_alteracao_biometria) {
		this.destinatario = destinatario;
		this.uuid_usuario = uuid_usuario;
		this.uuid_alteracao_biometria = uuid_alteracao_biometria;
	}
	
	public void run() {
		/*
		 * Envio do Email
		 * Assintótica: O(1)
		 * */
		GerenciadorEmail gerenciador = new GerenciadorEmail(this.destinatario,
															this.uuid_usuario,
															this.uuid_alteracao_biometria);
		gerenciador.EnviarEmailAlteracaoBiometria();
	}
	
	private String destinatario;
	private String uuid_usuario;
	private String uuid_alteracao_biometria;
}
