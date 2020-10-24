<%@ page language="java" contentType="text/html; utf8"
    pageEncoding="utf8"%>
<%@page import="Bean.AlterarBiometriaBean" %>
<%@page import="Bean.UsuarioBean" %>
<%@page import="Dao.AlterarBiometriaDao" %>
<%@page import="Dao.UsuarioDao" %>
<%@page import="Seguranca.StripHTML" %>
<%@page import="Threads.EmailAlteracaoBiometriaThread" %>
<%
	int retorno;

	try {
		UsuarioBean usuario = new UsuarioBean();
		UsuarioBean usuario_logado = (UsuarioBean) session.getAttribute("usuario_logado");
		UsuarioDao usuario_dao = new UsuarioDao();
		
		usuario.setUuid(usuario_logado.getUuid());
		usuario.setEmail(usuario_logado.getEmail());
		
		AlterarBiometriaBean alterar_biometria = new AlterarBiometriaBean();
		AlterarBiometriaDao alterar_biometria_dao = new AlterarBiometriaDao();
		String uuid_alterar_biometria = null;
		
		alterar_biometria.setUuidUsuario(usuario.getUuid());
		uuid_alterar_biometria = alterar_biometria_dao.Cadastrar(alterar_biometria);
		
		System.out.println("email a enviar");
			
		Thread thread = new Thread(new EmailAlteracaoBiometriaThread(usuario.getEmail(), alterar_biometria.getUuidUsuario(), uuid_alterar_biometria));
		thread.start();
		
		retorno = 1;
		System.out.println("email enviado");
	}
	catch (Exception e) {
		e.printStackTrace(); 
		retorno = 0;
	}
	
	// erro no processamento
	if (retorno == 0) {
%>
		😥 Falha na solicitação: problemas internos, tente mais tarde!
<%
	// sucesso no processamento
	} else if (retorno == 1) {
%>
		🎉 Requisição realizada com sucesso! Em breve te encaminharemos um email para dar sequência no processo.
<%
	}
%>