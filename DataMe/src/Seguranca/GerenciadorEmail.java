package Seguranca;

import java.util.Properties;
import javax.mail.*;  
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;  

public class GerenciadorEmail {
	/*
	 * Classe Responsável por encaminhar emails aos usuários
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
		 * Encaminha email para alteração de senha ao usuário
		 * 
		 * Assintótica: O(1)
		 * */
		
		String assunto = "[Equipe DataMe] Alteração de Senha!";
		String texto_mensagem = "<center><h1><b>Alteração de Senha Solicitada!</b></h1></center>"
				+ "<p>Uma solicitação de senha foi realizada para este usuário, se não foi você, pode ignrar esta mensagem. "
				+ "Caso deseja continuar com a operação, "
				+ "<a href='http://localhost:8080/DataMe/alterar-senha.jsp?hash_usuario=" + this.uuid_usuario + "&hash_alteracao_senha=" + this.uuid_alteracao
				+ "' target='_blank'>Clique aqui</a> para ser redirecionada à página de alteração."
				+ "<p>Anexamos um arquivo ATT00001.htm (pode ser que venha com outro nome rsrs) neste mensagem para você salvar o email no computador e acessar o link de alteração de senha quando puder.</p>";
		Properties propriedades = new Properties();
		propriedades.put("mail.smtp.port", 587); // porta do servidor smtp
		propriedades.put("mail.smtp.host", "smtp.office365.com"); // servidor smtp da outlook
		propriedades.put("mail.smtp.starttls.enable", "true"); // habilitando criptografia de envio
		propriedades.put("mail.debug", "true"); // depuração se caso algum erro ocorrer
		propriedades.put("mail.smtp.auth", "true"); // login automático no email
		
		// Inicia sessão no email realizano o login automático
		Session sessao = Session.getDefaultInstance(propriedades,
				new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(email, senha);
					}
				}
		);
		
		// Preparação da Mensagem a ser Enviada
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
		 * Encaminha email para definição de senha pelo usuário no primeiro login
		 * 
		 * Assintótica: O(1)
		 * */
		
		String assunto = "[Equipe DataMe] Definição de Senha!";
		String texto_mensagem = "<center><h1><b>Seja Bem-Vindo ao DataMe!</b></h1></center>"
				+ "<p>Você foi cadastrado em nossa plataforma DataMe, nela você poderá estar vendo as notícias ambientais mais quentes do país. "
				+ "Para continuar a operação, você deve  "
				+ "<a href='http://localhost:8080/DataMe/alterar-senha.jsp?hash_usuario=" + this.uuid_usuario + "&hash_alteracao_senha=" + this.uuid_alteracao
				+ "' target='_blank'>clicar aqui</a> para ser redirecionada à página de definição de senhas."
				+ "<p>Anexamos um arquivo ATT00001.htm (pode ser que venha com outro nome rsrs) neste mensagem para você salvar o email no computador e acessar o link de alteração de senha quando puder.</p>";
		Properties propriedades = new Properties();
		propriedades.put("mail.smtp.port", 587); // porta do servidor smtp
		propriedades.put("mail.smtp.host", "smtp.office365.com"); // servidor smtp da outlook
		propriedades.put("mail.smtp.starttls.enable", "true"); // habilitando criptografia de envio
		propriedades.put("mail.debug", "true"); // depuração se caso algum erro ocorrer
		propriedades.put("mail.smtp.auth", "true"); // login automático no email
		
		// Inicia sessão no email realizano o login automático
		Session sessao = Session.getDefaultInstance(propriedades,
				new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(email, senha);
					}
				}
		);
		
		// Preparação da Mensagem a ser Enviada
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
		 * Encaminha email para alteração da foto de biometria ao usuário
		 * 
		 * Assintótica: O(1)
		 * */
		
		String assunto = "[Equipe DataMe] Alteração de Biometria!";
		String texto_mensagem = "<center><h1><b>Alteração de Biometria Solicitada!</b></h1></center>"
				+ "<p>Uma solicitação de biometria foi realizada para este usuário, se não foi você, pode ignrar esta mensagem. "
				+ "Caso deseja continuar com a operação, "
				+ "<a href='http://localhost:8080/DataMe/alterar-biometria.jsp?hash_usuario=" + this.uuid_usuario + "&hash_alteracao_biometria=" + this.uuid_alteracao
				+ "' target='_blank'>Clique aqui</a> para ser redirecionada à página de alteração."
				+ "<p>Anexamos um arquivo ATT00001.htm (pode ser que venha com outro nome rsrs) neste mensagem para você salvar o email no computador e acessar o link de alteração de senha quando puder.</p>";
		Properties propriedades = new Properties();
		propriedades.put("mail.smtp.port", 587); // porta do servidor smtp
		propriedades.put("mail.smtp.host", "smtp.office365.com"); // servidor smtp da outlook
		propriedades.put("mail.smtp.starttls.enable", "true"); // habilitando criptografia de envio
		propriedades.put("mail.debug", "true"); // depuração se caso algum erro ocorrer
		propriedades.put("mail.smtp.auth", "true"); // login automático no email
		
		// Inicia sessão no email realizano o login automático
		Session sessao = Session.getDefaultInstance(propriedades,
				new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(email, senha);
					}
				}
		);
		
		// Preparação da Mensagem a ser Enviada
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
