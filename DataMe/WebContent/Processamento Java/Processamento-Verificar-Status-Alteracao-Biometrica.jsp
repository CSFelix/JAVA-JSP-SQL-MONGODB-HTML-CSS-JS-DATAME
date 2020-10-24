<%@ page language="java" contentType="text/html; utf8"
    pageEncoding="utf8"%>
    
<%@page import="java.sql.*" %>

<%@page import="BancoDados.ConexaoMySQL" %>
<%@page import="Bean.AlterarBiometriaBean" %>
<%@page import="Dao.AlterarBiometriaDao" %>

<!DOCTYPE html>
<html>
<head></head>
<body></body>

<script>
$(function() {
	$("#verificarStatusAlteracaoBiometrica").click(function() {
		<%
		AlterarBiometriaBean alterar_biometria = new AlterarBiometriaBean();
		alterar_biometria.setUuidUsuario((String) session.getAttribute("hash_usuario"));
		alterar_biometria.setUuidAlterarBiometria((String) session.getAttribute("hash_alteracao_biometria"));
				
		AlterarBiometriaDao alterar_biometria_dao = new AlterarBiometriaDao();
		int expiracao = alterar_biometria_dao.SelecionarExpiracao(alterar_biometria);
		
		// solicitação expirada
		if (expiracao == 1) { response.sendRedirect("..\\alteracao-biometria-expirada.jsp"); }
		
		// solicitação não expirada
		else { response.sendRedirect("..\\alteracao-biometria.jsp"); }
		%>
	});
});
</script>
</html>
