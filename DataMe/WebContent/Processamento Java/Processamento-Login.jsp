<%@ page language="java" contentType="text/html; utf8"
    pageEncoding="utf8"%>

<%@page import="java.sql.*" %>

<%@page import="BancoDados.ConexaoMySQL" %>
<%@page import="Bean.UsuarioBean" %>    
<%@page import="Dao.UsuarioDao" %>
<%@page import="Seguranca.StripHTML" %>

<!DOCTYPE html>
<html>
<head></head>
<body></body>

<script>
$(function() {
	$("#login").click(function() {
		<%
		UsuarioBean usuario = new UsuarioBean();
		usuario.setEmail(StripHTML.StripString(request.getParameter("email")));
		usuario.setSenha(StripHTML.StripString(request.getParameter("senha")));
		
		UsuarioDao usuario_dao = new UsuarioDao();
		usuario = usuario_dao.Logar(usuario);
		
		// Email\Senha Inválidos ou fora do padrão regex
		if (usuario == null || !StripHTML.VerificaEmail(usuario.getEmail()))  {
			session.setAttribute("login", 0);
			response.sendRedirect("..\\index.jsp");
		}
		
		// Email e Senha Válidos
		else {
			// usuário não bloqueado
			if (usuario.isBloqueado() == 0) {
				session.setAttribute("login", 1);
				session.setAttribute("usuario_logado", usuario);
				
				
				
				response.sendRedirect("..\\painel.jsp");
			}
			
			// bloqueado
			else { response.sendRedirect("..\\usuario-bloqueado.jsp"); }
		}
		%>
	});
});
</script>
</html>