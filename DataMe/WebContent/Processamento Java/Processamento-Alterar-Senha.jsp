<%@ page language="java" contentType="text/html; utf8"
    pageEncoding="utf8"%>
    
<%@page import="java.sql.*" %>

<%@page import="BancoDados.ConexaoMySQL" %>
<%@page import="Bean.AlterarSenhaBean" %>
<%@page import="Bean.UsuarioBean" %>    
<%@page import="Dao.AlterarSenhaDao" %>
<%@page import="Dao.UsuarioDao" %>  
<%@page import="Seguranca.StripHTML" %>

<!DOCTYPE html>
<html>
<head></head>
<body></body>

<script>
$(function() {
	$("#confirmacaoAlterarSenha").click(function() {
		<%
		// Verificar se senhas coincidem
		String senha = StripHTML.StripString(request.getParameter("novaSenha"));
		String confirmar_senha = StripHTML.StripString(request.getParameter("confirmarNovaSenha"));
		String uuid_usuario = (String) session.getAttribute("hash_usuario");
		String uuid_alteracao_senha = (String) session.getAttribute("hash_alteracao_senha");
		
		// Senhas coincidem
		if (senha.equals(confirmar_senha)) {
			
			// Verficação se o link está expirado
			AlterarSenhaBean alterar_senha = new AlterarSenhaBean();
			AlterarSenhaDao alterar_senha_dao = new AlterarSenhaDao();
			alterar_senha.setUuidAlterarSenha((String) session.getAttribute("hash_alteracao_senha"));
			
			int link_expirado = alterar_senha_dao.SelecionarExpiracao(alterar_senha);
			
			// link não expirado
			if (link_expirado == 0) {
				
				// Processamento de Alteração da Senha
				UsuarioBean usuario = new UsuarioBean();
				UsuarioDao usuario_dao = new UsuarioDao();
				
				usuario.setUuid((String) session.getAttribute("hash_usuario"));
				usuario.setSenha(senha);
				
				usuario_dao.AlterarSenha(usuario);
				
				// Inativação do Link de Alteração de Senha
				alterar_senha_dao.UsarAlteracao(alterar_senha);
				
				// Redirecionamento
				session.setAttribute("confirmacao_alterar_senha", 1);
				response.sendRedirect("..\\senha-alterada.jsp?hash_usuario="
									+ usuario.getUuid()
									+ "&hash_alteracao_senha="
									+ alterar_senha.getUuidAlterarSenha());
			}
			
			// link expirado
			else { response.sendRedirect("..\\alteracao-senha-expirada.jsp"); }
		}
		
		// Senhas não coincidem
		else {
			session.setAttribute("confirmacao_alterar_senha", 0);
			response.sendRedirect("http://localhost:8080/DataMe/alterar-senha.jsp?hash_usuario=" + uuid_usuario + "&hash_alteracao_senha=" + uuid_alteracao_senha);
		}
		//
		%>
	});
});
</script>
</html>