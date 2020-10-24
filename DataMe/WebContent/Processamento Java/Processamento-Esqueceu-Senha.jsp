<%@ page language="java" contentType="text/html; utf8"
    pageEncoding="utf8"%>
    
<%@page import="java.sql.*" %>

<%@page import="BancoDados.ConexaoMySQL" %>
<%@page import="Bean.AlterarSenhaBean" %> 
<%@page import="Bean.UsuarioBean" %>    
<%@page import="Dao.AlterarSenhaDao" %>
<%@page import="Dao.UsuarioDao" %>
<%@page import="Seguranca.GerenciadorEmail" %>   
<%@page import="Seguranca.StripHTML" %>
<%@page import="Threads.EmailEsqueceuSenhaThread" %>
    
<!DOCTYPE html>
<html>
<head></head>
<body></body>

<script>
$(function() {
	$("#alterarSenha").click(function() {
		<%
		UsuarioBean usuario = new UsuarioBean();
		UsuarioDao usuario_dao = new UsuarioDao();
		usuario.setEmail(StripHTML.StripString(request.getParameter("email")));
		
		// false >> cadastrado
		// true >> não cadastrado
		boolean email_cadastrado = usuario_dao.ChecarEmail(usuario.getEmail());
			
		// Email Inválido\Não-Cadastrado ou fora do padrão regex
		if (email_cadastrado || !StripHTML.VerificaEmail(usuario.getEmail())) {
			session.setAttribute("alterar_senha", 0);
			response.sendRedirect("..\\esqueceu-senha.jsp");
		}
		
		// Email Válido\Cadastrado
		else {
			AlterarSenhaBean alterar_senha = new AlterarSenhaBean();
			AlterarSenhaDao alterar_senha_dao = new AlterarSenhaDao();
			String uuid_alterar_senha = null;
			
			alterar_senha.setUuidUsuario(usuario_dao.SelecionarUuid(usuario.getEmail()));
			uuid_alterar_senha = alterar_senha_dao.Cadastrar(alterar_senha);
			
			System.out.println("email a enviar");
			session.setAttribute("alterar_senha", 1);
				
			Thread thread = new Thread(new EmailEsqueceuSenhaThread(usuario.getEmail(), alterar_senha.getUuidUsuario(), uuid_alterar_senha));
			thread.start();
			
			System.out.println("email enviado");
			response.sendRedirect("..\\alteracao-senha-solicitada.jsp");
		}
		%>
	});
});
</script>
</html>