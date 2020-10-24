package Seguranca;

import java.util.Properties;
import javax.mail.*;  
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;  

public class GerenciadorEmail {
	/*
	 * Classe Respons�vel por encaminhar emails aos usu�rios
	 * */
	
	public GerenciadorEmail(String destinatario, String uuid_usuario, String uuid_alteracao) {
		this.destinatario = destinatario; this.uuid_usuario = uuid_usuario; this.uuid_alteracao = uuid_alteracao;
	}
	
	String email = "equipe_chatme@outlook.com";
	String senha = "ChatMeProgrammer";
	
	String destinatario;
	String uuid_usuario;
	String uuid_alteracao; // senha, biometria
	
	public boolean EnviarEmailAlteracaoSenha() {
		/*
		 * Encaminha email para altera��o de senha ao usu�rio
		 * 
		 * Assint�tica: O(1)
		 * */
		
		String assunto = "[Equipe DataMe] Altera��o de Senha!";
		String texto_mensagem = "<center><h1><b>Altera��o de Senha Solicitada!</b></h1></center>"
				+ "<p>Uma solicita��o de senha foi realizada para este usu�rio, se n�o foi voc�, pode ignrar esta mensagem. "
				+ "Caso deseja continuar com a opera��o, "
				+ "<a href='http://localhost:8080/DataMe/alterar-senha.jsp?hash_usuario=" + this.uuid_usuario + "&hash_alteracao_senha=" + this.uuid_alteracao
				+ "' target='_blank'>Clique aqui</a> para ser redirecionada � p�gina de altera��o."
				+ "<p>Anexamos um arquivo ATT00001.htm (pode ser que venha com outro nome rsrs) neste mensagem para voc� salvar o email no computador e acessar o link de altera��o de senha quando puder.</p>";
		Properties propriedades = new Properties();
		propriedades.put("mail.smtp.port", 587); // porta do servidor smtp
		propriedades.put("mail.smtp.host", "smtp.office365.com"); // servidor smtp da outlook
		propriedades.put("mail.smtp.starttls.enable", "true"); // habilitando criptografia de envio
		propriedades.put("mail.debug", "true"); // depura��o se caso algum erro ocorrer
		propriedades.put("mail.smtp.auth", "true"); // login autom�tico no email
		
		// Inicia sess�o no email realizano o login autom�tico
		Session sessao = Session.getDefaultInstance(propriedades,
				new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(email, senha);
					}
				}
		);
		
		// Prepara��o da Mensagem a ser Enviada
		try {
			MimeMessage mensagem = new MimeMessage(sessao);
			mensagem.setFrom(new InternetAddress(email));
			mensagem.addRecipient(Message.RecipientType.TO, new InternetAddress(this.destinatario));
			mensagem.setSubject(assunto);
			
			MimeMultipart multipart = new MimeMultipart("related");
			BodyPart messageBodyPart = new MimeBodyPart();
			
			// Adiciona texto na mensagem
			messageBodyPart.setContent(texto_mensagem, "text/html");
			multipart.addBodyPart(messageBodyPart);
			
			// Envio do email
	        multipart.addBodyPart(messageBodyPart);
			mensagem.setContent(multipart);
			
			Transport.send(mensagem);
			System.out.println("Enviado");
		}
		catch (MessagingException e) {
			System.out.println(e);
			return false;
		}
		
		return true;
	}
	
	public boolean EnviarEmailDefinicaoSenha() {
		/*
		 * Encaminha email para defini��o de senha pelo usu�rio no primeiro login
		 * 
		 * Assint�tica: O(1)
		 * */
		
		String assunto = "[Equipe DataMe] Defini��o de Senha!";
		String texto_mensagem = "<center><h1><b>Seja Bem-Vindo ao DataMe!</b></h1></center>"
				+ "<p>Voc� foi cadastrado em nossa plataforma DataMe, nela voc� poder� estar vendo as not�cias ambientais mais quentes do pa�s. "
				+ "Para continuar a opera��o, voc� deve  "
				+ "<a href='http://localhost:8080/DataMe/alterar-senha.jsp?hash_usuario=" + this.uuid_usuario + "&hash_alteracao_senha=" + this.uuid_alteracao
				+ "' target='_blank'>clicar aqui</a> para ser redirecionada � p�gina de defini��o de senhas."
				+ "<p>Anexamos um arquivo ATT00001.htm (pode ser que venha com outro nome rsrs) neste mensagem para voc� salvar o email no computador e acessar o link de altera��o de senha quando puder.</p>";
		Properties propriedades = new Properties();
		propriedades.put("mail.smtp.port", 587); // porta do servidor smtp
		propriedades.put("mail.smtp.host", "smtp.office365.com"); // servidor smtp da outlook
		propriedades.put("mail.smtp.starttls.enable", "true"); // habilitando criptografia de envio
		propriedades.put("mail.debug", "true"); // depura��o se caso algum erro ocorrer
		propriedades.put("mail.smtp.auth", "true"); // login autom�tico no email
		
		// Inicia sess�o no email realizano o login autom�tico
		Session sessao = Session.getDefaultInstance(propriedades,
				new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(email, senha);
					}
				}
		);
		
		// Prepara��o da Mensagem a ser Enviada
		try {
			MimeMessage mensagem = new MimeMessage(sessao);
			mensagem.setFrom(new InternetAddress(email));
			mensagem.addRecipient(Message.RecipientType.TO, new InternetAddress(this.destinatario));
			mensagem.setSubject(assunto);
			
			MimeMultipart multipart = new MimeMultipart("related");
			BodyPart messageBodyPart = new MimeBodyPart();
			
			// Adiciona texto na mensagem
			messageBodyPart.setContent(texto_mensagem, "text/html");
			multipart.addBodyPart(messageBodyPart);
			
			// Envio do email
	        multipart.addBodyPart(messageBodyPart);
			mensagem.setContent(multipart);
			
			Transport.send(mensagem);
			System.out.println("Enviado");
		}
		catch (MessagingException e) {
			System.out.println(e);
			return false;
		}
		
		return true;
	}
	
	public boolean EnviarEmailAlteracaoBiometria() {
		/*
		 * Encaminha email para altera��o da foto de biometria ao usu�rio
		 * 
		 * Assint�tica: O(1)
		 * */
		
		String assunto = "[Equipe DataMe] Altera��o de Biometria!";
		String texto_mensagem = "<center><h1><b>Altera��o de Biometria Solicitada!</b></h1></center>"
				+ "<p>Uma solicita��o de biometria foi realizada para este usu�rio, se n�o foi voc�, pode ignrar esta mensagem. "
				+ "Caso deseja continuar com a opera��o, "
				+ "<a href='http://localhost:8080/DataMe/alterar-biometria.jsp?hash_usuario=" + this.uuid_usuario + "&hash_alteracao_biometria=" + this.uuid_alteracao
				+ "' target='_blank'>Clique aqui</a> para ser redirecionada � p�gina de altera��o."
				+ "<p>Anexamos um arquivo ATT00001.htm (pode ser que venha com outro nome rsrs) neste mensagem para voc� salvar o email no computador e acessar o link de altera��o de senha quando puder.</p>";
		Properties propriedades = new Properties();
		propriedades.put("mail.smtp.port", 587); // porta do servidor smtp
		propriedades.put("mail.smtp.host", "smtp.office365.com"); // servidor smtp da outlook
		propriedades.put("mail.smtp.starttls.enable", "true"); // habilitando criptografia de envio
		propriedades.put("mail.debug", "true"); // depura��o se caso algum erro ocorrer
		propriedades.put("mail.smtp.auth", "true"); // login autom�tico no email
		
		// Inicia sess�o no email realizano o login autom�tico
		Session sessao = Session.getDefaultInstance(propriedades,
				new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(email, senha);
					}
				}
		);
		
		// Prepara��o da Mensagem a ser Enviada
		try {
			MimeMessage mensagem = new MimeMessage(sessao);
			mensagem.setFrom(new InternetAddress(email));
			mensagem.addRecipient(Message.RecipientType.TO, new InternetAddress(this.destinatario));
			mensagem.setSubject(assunto);
			
			MimeMultipart multipart = new MimeMultipart("related");
			BodyPart messageBodyPart = new MimeBodyPart();
			
			// Adiciona texto na mensagem
			messageBodyPart.setContent(texto_mensagem, "text/html");
			multipart.addBodyPart(messageBodyPart);
			
			// Envio do email
	        multipart.addBodyPart(messageBodyPart);
			mensagem.setContent(multipart);
			
			Transport.send(mensagem);
			System.out.println("Enviado");
		}
		catch (MessagingException e) {
			System.out.println(e);
			return false;
		}
		
		return true;
	}
}
