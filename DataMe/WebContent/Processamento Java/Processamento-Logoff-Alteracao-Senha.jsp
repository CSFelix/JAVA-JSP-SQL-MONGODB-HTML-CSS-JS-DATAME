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

<%
UsuarioBean usuario = (UsuarioBean) session.getAttribute("usuario_logado");
UsuarioDao usuario_dao = new UsuarioDao();
usuario_dao.Deslogar(usuario.getUuid());
response.sendRedirect("..\\esqueceu-senha.jsp");
%>
</html>