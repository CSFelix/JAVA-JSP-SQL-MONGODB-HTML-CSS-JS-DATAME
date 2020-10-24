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

<%
	UsuarioBean usuario = new UsuarioBean();
	UsuarioDao usuario_dao = new UsuarioDao();
	
	usuario.setUuid(StripHTML.StripString(request.getParameter("uuidUsuario")));
	usuario.setBloqueado(Integer.parseInt(StripHTML.StripString(request.getParameter("operacao"))));
	
	usuario_dao.BloquearUsuario(usuario.getUuid(), usuario.isBloqueado());
%>
</html>