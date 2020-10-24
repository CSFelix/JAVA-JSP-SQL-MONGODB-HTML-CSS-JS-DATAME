<%@ page language="java" contentType="text/html; utf8"
    pageEncoding="utf8"%>

<%@page import="Bean.AlterarSenhaBean" %>
<%@page import="Bean.UsuarioBean" %>
<%@page import="Dao.AlterarSenhaDao" %>
<%@page import="Dao.SaltDao" %> 
<%@page import="Dao.UsuarioDao" %>
<%@page import="Seguranca.StripHTML" %>
<%@page import="Threads.EmailDefinicaoSenhaThread" %>

<%
	String nickname = StripHTML.StripString(request.getParameter("nicknameCadastroUsuario"));
	String email = StripHTML.StripString(request.getParameter("emailCadastroUsuario"));
	int nivel_usuario = Integer.parseInt(StripHTML.StripString(request.getParameter("nivelUsuario")));
	int bloqueio = Integer.parseInt(StripHTML.StripString(request.getParameter("bloqueio")));
	String uuid_usuario = StripHTML.StripString(request.getParameter("uuid_usuario"));
	
	UsuarioBean usuario = new UsuarioBean();
	UsuarioDao usuario_dao = new UsuarioDao();
	
	usuario.setUuid(uuid_usuario);
	usuario.setNickname(nickname);
	usuario.setEmail(email);
	usuario.setNivel(nivel_usuario);
	usuario.setBloqueado(bloqueio);
	
	int retorno;
	
	// cadastrado usuário
	if (uuid_usuario.equals("none-hash")) {
		
		usuario.setAvatar(null); // cadastrar com imagem padrão
		retorno = usuario_dao.Cadastrar(usuario);
		
		if (retorno == 0) { %> 0 <% } 
		else if (retorno == 1) { %> 1 <% } 
		else if (retorno == 2) { %> 2 <% } 
		else if (retorno == 3) { %> 3 <% } 
		else if (retorno == 4) { %> 4 <% } 
		else if (retorno == 5) { %> 5 <% } 
		else if (retorno == 6) { %> 6 <% } 
		else if (retorno == 7) { %> 7 <% } 
		else if (retorno == 8) { %> 8 <% } 
		else if (retorno == 9) {
			
			// Cadastro de Salt
			uuid_usuario = usuario_dao.SelecionarUuid(usuario.getEmail());
			SaltDao salt_dao = new SaltDao();
			salt_dao.CadastrarSalt(uuid_usuario);
			
			// Definição de Senha
			AlterarSenhaBean alterar_senha = new AlterarSenhaBean();
			AlterarSenhaDao alterar_senha_dao = new AlterarSenhaDao();
			String uuid_alterar_senha = null;
			
			alterar_senha.setUuidUsuario(uuid_usuario);
			uuid_alterar_senha = alterar_senha_dao.Cadastrar(alterar_senha);
			
			// Envio de Email da Definição de senha
			System.out.println("email a enviar");
			
			Thread thread = new Thread(new EmailDefinicaoSenhaThread(usuario.getEmail(), alterar_senha.getUuidUsuario(), uuid_alterar_senha));
			thread.start();
			
			System.out.println("email enviado");
		%> 9 <% }
	}
	
	// alteração usuário
	else {
		
		retorno = usuario_dao.AlterarDadosUsariosCadastrados(usuario);
		
		if (retorno == 0) { %> 0 <% } 
		else if (retorno == 1) { %> 1 <% } 
		else if (retorno == 2) { %> 2 <% } 
		else if (retorno == 3) { %> 3 <% } 
		else if (retorno == 4) { %> 4 <% } 
		else if (retorno == 5) { %> 5 <% } 
		else if (retorno == 6) { %> 6 <% } 
		else if (retorno == 7) { %> 7 <% } 
		else if (retorno == 8) { %> 8 <% } 
		else if (retorno == 9) {
			
			
		%> 9 <% }
	}
%>